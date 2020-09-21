-- Addon.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 9/16/2020, 6:21:49 PM
--
---@type ns
local ns = select(2, ...)

---@type Addon
local Addon = LibStub('AceAddon-3.0'):NewAddon('tdAuction', 'LibClass-2.0', 'AceEvent-3.0')

ns.Addon = Addon
ns.UI = {}
ns.L = setmetatable({}, {
    __index = function(t, k)
        return k
    end,
})

---@class GLOBAL
local DEFAULT_GLOBAL = {prices = {}}

function Addon:OnInitialize()
    self:SetupDatabase()
    self:SetupBlizzardUI()
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
    ns.db = LibStub('AceDB-3.0'):New('TDDB_AUCTION', {global = {prices = {}}})

    ns.global = ns.db.global
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
    self:SetupSort()
    self:SetupBackground()
    self:SetupUI()
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

    AuctionFrame_SetSort('list', 'unitprice')
end

function Addon:SetupBackground()
    local BGS = {}
    do
        local function T(key, ...)
            for i = 1, 3 do
                local val = select(i, ...)
                if val then
                    local obj = _G['AuctionFrame' .. key]
                    local texture = [[Interface\AddOns\tdUI\Media\AuctionFrame\UI-AuctionFrame-]] .. val .. '-' .. key
                    BGS[i] = BGS[i] or {}
                    BGS[i][obj] = texture
                end
            end
        end

        T('TopLeft', 'Browse', 'Bid', 'Auction')
        T('Top', 'Browse', 'Auction', 'Auction')
        T('TopRight', 'Browse', 'Auction', 'Auction')
        T('BotLeft', 'Browse', 'Bid', 'Auction')
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
    ns.UI.FullScan:Bind(CreateFrame('Frame', nil, AuctionFrame, 'tdAuctionFullScanFrameTemplate'))
    ns.UI.Browse:Bind(AuctionFrameBrowse)
    ns.UI.Sell:Bind(AuctionFrameAuctions)
end
