-- Querier.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 9/18/2020, 2:40:46 PM
--
---@type ns
local ns = select(2, ...)

local floor, max = math.floor, math.max

local GetNumAuctionItems = GetNumAuctionItems
local CanSendAuctionQuery = CanSendAuctionQuery
local GetItemInfo = GetItemInfo

local STATUS_PENDING = 1
local STATUS_WAITRESP = 2
local STATUS_RUNNING = 3

---@class Querier: AceModule, AceEvent-3.0, AceHook-3.0
local Querier = ns.Addon:NewModule('Querier', 'AceEvent-3.0', 'AceHook-3.0')

function Querier:OnInitialize()
    self.statusProcess = { --
        [STATUS_PENDING] = self.Pending,
        [STATUS_RUNNING] = self.Running,
    }

    self.updater = CreateFrame('Frame')
    self.updater:Hide()
    self.updater:SetScript('OnUpdate', function()
        return self:OnIdle()
    end)

end

function Querier:OnEnable()
    self:RegisterEvent('AUCTION_HOUSE_CLOSED')
    self:SecureHook('QueryAuctionItems')
end

function Querier:QueryAuctionItems(text, minLevel, maxLevel, page, usable, quality, queryAll, exactMatch, filters)
    if not self.ourQuery then
        print('not our query')
        self:Cancel()
        return
    end

    if not self.params then
        print('no params')
        return
    end

    if not self.params.virtual then
        print('not virtual')
        return
    end

    print('our query', page)

    self.params.text = ns.LastLink:GetLastLink() or text
    self.params.minLevel = minLevel
    self.params.maxLevel = maxLevel
    self.params.page = page
    self.params.usable = usable
    self.params.quality = quality
    self.params.queryAll = queryAll
    self.params.exact = exactMatch
    self.params.filters = filters

    self.scaner:OnParams()
end

function Querier:AUCTION_HOUSE_CLOSED()
    self.queryAllDisabled = nil
    self:Cancel()
end

function Querier:GET_ITEM_INFO_RECEIVED(_, itemId)
    if self.scaner then
        self.scaner.pending:Ready(itemId)
    end
end

function Querier:OnIdle()
    if not self.scaner or self.scaner.canceled then
        self:Cancel()
        return
    end
    local method = self.statusProcess[self.status]
    if method then
        method(self)
    end
end

function Querier:OnResponse()
    local count, total = GetNumAuctionItems('list')
    if total == 0 then
        self.pageMax = 0
    else
        self.pageMax = floor(total / max(count, NUM_AUCTION_ITEMS_PER_PAGE))
    end

    print('response', self.page, self.pageMax)

    self.ourQuery = nil
    self.scaner:OnResponse()
    self.status = STATUS_RUNNING
    self:UnregisterEvent('AUCTION_ITEM_LIST_UPDATE')
end

function Querier:Query(params, scaner)
    self.params = params
    self.scaner = scaner
    self.status = STATUS_PENDING
    self.page = params.page or 0

    self.scaner:OnStart()

    if params.virtual then
        self.scaner:PreQuery()
        self:OnIdle()
    end

    self.updater:Show()
end

function Querier:CanQuery()
    if self.params and self.params.virtual then
        return true
    end
    local canQuery, canQueryAll = CanSendAuctionQuery('list')
    if not canQuery then
        return false
    end

    if self.params.queryAll and (not canQueryAll or self.queryAllDisabled) then
        return false
    end
    return true
end

function Querier:ParseSearchText(link)
    local exact = false
    local text = link
    local itemId, _, suffixId = ns.ParseItemLink(link)
    if itemId then
        local name = GetItemInfo(link)
        if name then
            exact = true
            text = name

            if suffixId ~= 0 then
                local origName = GetItemInfo(itemId)
                if origName then
                    local suffix = name:gsub(origName, ''):trim()
                    text = origName .. ' ' .. suffix
                end
            end
        end
    end
    return text, exact
end

function Querier:Pending()
    if not self:CanQuery() then
        return
    end

    self.status = STATUS_WAITRESP
    self:RegisterEvent('AUCTION_ITEM_LIST_UPDATE', 'OnResponse')
    self:RegisterEvent('GET_ITEM_INFO_RECEIVED')

    if self.params.virtual then
        self.ourQuery = true
    else
        local params = self.params
        local text, exact = self:ParseSearchText(params.text)

        self.scaner:PreQuery()

        self.ourQuery = true
        QueryAuctionItems(text, params.minLevel, params.maxLevel, self.page, params.usable, params.quality,
                          params.queryAll, exact or params.exact, params.filters)
        self.ourQuery = nil

        if params.queryAll then
            self.queryAllDisabled = true
        end
    end
end

function Querier:Running()
    if not self.scaner:Continue() then
        return
    end

    if self.scaner:Next() and self.page < self.pageMax then
        self.page = self.page + 1
        self.status = STATUS_PENDING
        return
    end

    self:UnregisterEvent('GET_ITEM_INFO_RECEIVED')
    self.scaner:Done()
    self.updater:Hide()
end

function Querier:Cancel()
    self.scaner = nil
    self.updater:Hide()
end
