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
local DEFAULT_GLOBAL = {
    prices = {}
}

function Addon:OnInitialize()
    self:SetupDatabase()
    self:SetupUI()
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
    ns.db = LibStub('AceDB-3.0'):New('TDDB_AUCTION', {
        global = {
            prices = {}
        }
    })

    ns.global = ns.db.global
end

function Addon:SetupUI()
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
    ns.UI.FullScan:Bind(CreateFrame('Frame', nil, AuctionFrame, 'tdAuctionFullScanFrameTemplate'))
    ns.UI.Browse:Bind(AuctionFrameBrowse)
end
