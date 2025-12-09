-- Helper.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 12/8/2025, 8:21:23 PM
--
---@type ns
local ns = select(2, ...)

---@class Helper: AceModule, AceHook-3.0
local Helper = ns.Addon:NewModule('Helper', 'AceHook-3.0')
Helper:Disable()

function Helper:OnEnable()
    self:SecureHook('ChatEdit_InsertLink')

    self:HookScript(BrowseSearchButton, 'PreClick', 'OnBrowsePreClick')
    self:HookScript(BrowsePrevPageButton, 'PreClick', 'OnBrowsePreClick')
    self:HookScript(BrowseNextPageButton, 'PreClick', 'OnBrowsePreClick')

    self:HookScript(BrowseName, 'OnEditFocusGained', 'OnBrowsePreClick')
    self:HookScript(BrowseName, 'OnEditFocusLost', function()
        C_Timer.After(0.01, function()
            if not BrowseName:HasFocus() then
                self.ourQuery = nil
            end
        end)
    end)

    self:SecureHook('QueryAuctionItems')

    self:HookScript(BrowseName, 'OnTextChanged', function(edit, userInput)
        if userInput or edit:GetText() == '' then
            self.lastLink = nil
        end
    end)
end

function Helper:OnBrowsePreClick(...)
    print(...)
end

function Helper:ChatEdit_InsertLink(link)

    print(debugstack(3))

    if not BrowseName or not BrowseName:IsVisible() then
        return
    end

    -- local text = BrowseName:GetText()
    local text = self.text
    local name = C_Item.GetItemInfo(link)
    if not name then
        return
    end

    if text ~= '"' .. name .. '"' then
        return
    end

    self.lastLink = link

    print(link)
end

function Helper:GetLastLink()
    return self.lastLink
end

function Helper:QueryAuctionItems(text, minLevel, maxLevel, page, usable, quality, queryAll, exactMatch, filters)
    if queryAll then
        return
    end

    local link = ns.Helper:GetLastLink()
    if not link then
        return
    end

    local params = {
        text = link,
        minLevel = minLevel,
        maxLevel = maxLevel,
        page = page,
        usable = usable,
        quality = quality,
        queryAll = queryAll,
        exact = exactMatch,
        filters = filters,
        virtual = true,
    }

    print(params)

    self.scaner:Query(params)
end

function Helper:SetupScaner(scaner)
    self.scaner = scaner
end
