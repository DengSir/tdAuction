-- Addon.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 9/16/2020, 6:21:49 PM
--
---@class ns
-- class
---@field Pending Pending
---@field Scaner Scaner
---@field BrowseScaner BrowseScaner
---@field FullScaner FullScaner
---@field PriceScaner PriceScaner
-- module
---@field Querier Querier
local ns = select(2, ...)

---@class Addon: AceAddon-3.0, LibClass-2.0, AceEvent-3.0
local Addon = LibStub('AceAddon-3.0'):NewAddon('tdAuction', 'LibClass-2.0', 'AceEvent-3.0')

local L = LibStub('AceLocale-3.0'):GetLocale('tdAuction')

ns.Addon = Addon
---@class UI
---@field Browse UI.Browse
---@field BrowseItem UI.BrowseItem
ns.UI = {}
ns.L = L

---@class DATABASE
---@field profile PROFILE
---@field global GLOBAL

---@class GLOBAL
local DEFAULT_GLOBAL = { --
    prices = {},
}

---@class PROFILE
local DEFAULT_PROFILE = { --
    tooltip = { --
        price = true,
        auctionPrice = true,
        updateTime = 'timediff',
        disenchantPrice = true,
        shiftSingle = true,
        showDisenchant = 1,
    },
    sell = {
        stackSize = 0,
        duration = 2,
        durationNoDeposit = false,
        autoOpenPriceList = true,
        scanFull = false,
        altSell = true,
        bidRatio = 0.95,
        merchantRatio = 5,
    },
    buy = { --
        quickBuy = true,
        hiddenColumns = {Seller = true, UnitBid = not ns.ZH or nil},
    },
}

function Addon:OnInitialize()
    self:SetupDatabase()
    self:SetupBlizzardUI()
    self:SetupOptionFrame()
end

function Addon:OnModuleCreated(module)
    ns[module:GetName()] = module
end

function Addon:OnClassCreated(class, name)
    local uiName = name:match('^UI%.(.+)$')
    if uiName then
        ns.UI[uiName] = class
    else
        ns[name] = class
    end
end

function Addon:SetupDatabase()
    _G.TDDB_AUCTION_NEW = _G.TDDB_AUCTION_NEW or _G.TDDB_AUCTION

    ---@type AceDB-3.0 | DATABASE
    ns.db = LibStub('AceDB-3.0'):New('TDDB_AUCTION_NEW', {global = DEFAULT_GLOBAL, profile = DEFAULT_PROFILE}, true)

    ns.global = ns.db.global
    ns.profile = ns.db.profile

    local realm = GetRealmName()
    ns.global.prices[realm] = ns.global.prices[realm] or {}

    local prices = ns.global.prices[realm]
    ns.rawPrices = prices

    if not prices.version or type(prices.version) ~= 'number' or prices.version < 0 then
        prices.version = 1

        for k, v in pairs(prices) do
            if type(v) ~= 'table' then
                prices[k] = {v, 0}
            end
        end
    end

    local anyKey = 'TDDB_AUCTION_ANYACCOUNT'
    local anyDb = _G[anyKey]
    if anyDb then
        local function getPrices(db)
            return db.global.prices[realm]
        end

        for _, db in pairs(anyDb) do
            local anyPrices = getPrices(db)
            if anyPrices then
                for k, v in pairs(anyPrices) do
                    if type(v) == 'table' and (not prices[k] or v[2] > prices[k][2]) then
                        prices[k] = v
                    end
                end
            end
        end

        _G[anyKey] = nil
    end

    ns.prices = setmetatable({}, {
        __index = function(_, k)
            local info = prices[k]
            return info and info[1]
        end,
        __newindex = function(_, k, v)
            prices[k] = {v, time()}
        end,
    })

    -- compat
    ns.db:RegisterCallback('OnDatabaseShutdown', function()
        _G.TDDB_AUCTION = nil
    end)
    _G.TDDB_AUCTION = {global = {prices = {[realm] = ns.prices}}}
end

function Addon:SetupBlizzardUI()
    if IsAddOnLoaded('Blizzard_AuctionUI') then
        self:OnAuctionLoaded()
    else
        self:RegisterEvent('ADDON_LOADED', function(_, addon)
            if addon == 'Blizzard_AuctionUI' then
                self:UnregisterEvent('ADDON_LOADED')
                self:OnAuctionLoaded()
            end
        end)
    end
end

function Addon:OnAuctionLoaded()
    self:FixFilter()
    self:SetupSort()
    self:SetupBackground()
    self:SetupUI()
end

function Addon:FixFilter()
    local categories = {
        -- [AUCTION_CATEGORY_WEAPONS] = Enum.ItemClass.Weapon,
        -- [AUCTION_CATEGORY_ARMOR] = Enum.ItemClass.Armor,
        [AUCTION_CATEGORY_CONTAINERS] = Enum.ItemClass.Container,
        -- [AUCTION_CATEGORY_CONSUMABLES] = Enum.ItemClass.Consumable,
        -- [AUCTION_CATEGORY_GLYPHS] = Enum.ItemClass.Glyph,
        [AUCTION_CATEGORY_TRADE_GOODS] = Enum.ItemClass.Tradegoods,
        -- [AUCTION_CATEGORY_PROJECTILE] = Enum.ItemClass.Projectile,
        -- [AUCTION_CATEGORY_QUIVER] = Enum.ItemClass.Quiver,
        [AUCTION_CATEGORY_RECIPES] = Enum.ItemClass.Recipe,
        -- [AUCTION_CATEGORY_REAGENT] = Enum.ItemClass.Reagent,
        -- [AUCTION_CATEGORY_GEMS] = Enum.ItemClass.Gem,
        -- [AUCTION_CATEGORY_MISCELLANEOUS] = Enum.ItemClass.Miscellaneous,
        -- [AUCTION_CATEGORY_QUEST_ITEMS] = Enum.ItemClass.Questitem,
    }

    for _, obj in pairs(AuctionCategories) do
        if not obj.filters or not obj.filters[1] or not obj.filters[1].subClassID then
            local classId = categories[obj.name]
            if classId then
                obj.filters = nil
                -- @debug@
                print('FixFilter', obj.name, classId)
                -- @end-debug@
                local subClassId = 0
                while true do
                    local name = GetItemSubClassInfo(classId, subClassId)
                    if not name then
                        break
                    end
                    obj:CreateSubCategoryAndFilter(classId, subClassId)
                    subClassId = subClassId + 1
                end
            end
        end
    end
end

function Addon:SetupSort()
    AuctionSort['list_level'] = {
        {column = 'duration', reverse = true},
        {column = 'unitprice', reverse = false},
        {column = 'quantity', reverse = false},
        {column = 'minbidbuyout', reverse = true},
        {column = 'name', reverse = true},
        {column = 'quality', reverse = true},
        {column = 'level', reverse = false},
    }

    AuctionSort['list_duration'] = {
        {column = 'unitprice', reverse = false},
        {column = 'quantity', reverse = true},
        {column = 'minbidbuyout', reverse = false},
        {column = 'name', reverse = false},
        {column = 'level', reverse = true},
        {column = 'quality', reverse = false},
        {column = 'duration', reverse = false},
    }

    AuctionSort['list_seller'] = {
        {column = 'duration', reverse = false},
        {column = 'unitprice', reverse = false},
        {column = 'quantity', reverse = true},
        {column = 'minbidbuyout', reverse = false},
        {column = 'name', reverse = false},
        {column = 'level', reverse = true},
        {column = 'quality', reverse = false},
        {column = 'seller', reverse = false},
    }

    AuctionSort['list_unitprice'] = {
        {column = 'duration', reverse = false},
        {column = 'quantity', reverse = true},
        {column = 'name', reverse = false},
        {column = 'level', reverse = true},
        {column = 'quality', reverse = false},
        {column = 'unitprice', reverse = false},
    }

    AuctionSort['list_unitbid'] = {
        {column = 'duration', reverse = false},
        {column = 'quantity', reverse = true},
        {column = 'name', reverse = false},
        {column = 'level', reverse = true},
        {column = 'quality', reverse = false},
        {column = 'unitbid', reverse = false},
    }

    AuctionSort['list_quality'] = {
        {column = 'duration', reverse = false},
        {column = 'unitprice', reverse = false},
        {column = 'quantity', reverse = true},
        {column = 'minbidbuyout', reverse = false},
        {column = 'name', reverse = false},
        {column = 'level', reverse = true},
        {column = 'quality', reverse = false},
    }

    AuctionSort['list_buyout'] = {
        {column = 'duration', reverse = false},
        {column = 'quantity', reverse = true},
        {column = 'name', reverse = false},
        {column = 'level', reverse = true},
        {column = 'quality', reverse = false},
        {column = 'buyout', reverse = false},
    }

    ns.SetSort('unitprice')
end

function Addon:SetupBackground()
    local BGS = {}
    do
        local function T(key, ...)
            for i = 1, 3 do
                local val = select(i, ...)
                if val then
                    local obj = _G['AuctionFrame' .. key]
                    local texture = [[Interface\AddOns\tdAuction\Media\UI-AuctionFrame-]] .. val .. '-' .. key
                    BGS[i] = BGS[i] or {}
                    BGS[i][obj] = texture
                end
            end
        end

        T('TopLeft', ns.NARROW_FILTER and 'Browse-zh' or 'Browse', 'Bid', 'Auction')
        T('Top', 'Browse', 'Auction', 'Auction')
        T('TopRight', 'Browse', 'Auction', 'Auction')
        T('BotLeft', ns.NARROW_FILTER and 'Browse-zh' or 'Browse', 'Bid', 'Auction')
        T('Bot', 'Auction', 'Auction', 'Auction')
        T('BotRight', 'Bid', 'Bid', 'Auction')
    end

    hooksecurefunc('AuctionFrameTab_OnClick', function(self)
        local index = self:GetID()
        local bgs = BGS[index]
        if bgs then
            for k, v in pairs(bgs) do
                k:SetTexture(v)
            end
        end
    end)
end

function Addon:SetupUI()
    self.FullScan = ns.UI.FullScan:Bind(CreateFrame('Frame', nil, AuctionFrame, 'tdAuctionFullScanFrameTemplate'))
    self.Browse = ns.UI.Browse:Bind(AuctionFrameBrowse)
    self.Sell = ns.UI.Sell:Bind(AuctionFrameAuctions)
    ---@type tdAuctionFeaturesFrameTemplate
    self.Features = CreateFrame('Frame', nil, AuctionFrame, 'tdAuctionFeaturesFrameTemplate')

    self.Features:SetScript('OnShow', function()
        self.Features.FullScanButton:SetEnabled(ns.IsValidNpc())
    end)

    self.Features.FullScanButton:SetScript('OnEnter', function(button)
        if button:IsEnabled() then
            return
        end

        GameTooltip:SetOwner(button, 'ANCHOR_RIGHT')
        GameTooltip:SetText(L.TOOLTIP_FULLSCAN_DISABLED:format(UnitName('npc')), nil, nil, nil, nil, true)
        GameTooltip:Show()
    end)
    self.Features.FullScanButton:SetScript('OnLeave', function(button)
        if button:IsEnabled() then
            return
        end
        GameTooltip:Hide()
    end)
    self.Features.FullScanButton:SetMotionScriptsWhileDisabled(true)

    self.Features.FullScanButton:SetText(L['Full scan'])
    self.Features.FullScanButton:SetScript('OnClick', function()
        self.FullScan:Show()
    end)

    self.Features.OptionButton:SetScript('OnClick', function()
        self:OpenOptionFrame()
    end)
end
