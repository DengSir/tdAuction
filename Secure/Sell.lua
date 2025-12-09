-- Sell.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 12/8/2025, 11:04:29 PM
---@type ns
local ns = select(2, ...)

local MACRO_TEMPLATE = [[
/click AuctionFrameTab1
/click BrowseResetButton
/click %s
/click BrowseSearchButton
/click AuctionFrameTab3
]]

---@class SellSecure : AceModule, AceHook-3.0, AceEvent-3.0
local SellSecure = ns.Addon:NewModule('SellSecure', 'AceHook-3.0', 'AceEvent-3.0')

function SellSecure:OnInitialize()
    self:SecureHook('ContainerFrameItemButton_OnEnter')

    self:RegisterEvent('MODIFIER_STATE_CHANGED')
end

function SellSecure:IsValid()
    return IsModifiedClick('CHATLINK') and AuctionFrameAuctions:IsVisible()
end

function SellSecure:MODIFIER_STATE_CHANGED()
    if not self:IsValid() then
        return
    end
    for _, v in ipairs(GetMouseFoci()) do
        if self:IsSecureButton(v) then
            self:ContainerFrameItemButton_OnEnter(v)
            return
        end
    end
end

function SellSecure:ContainerFrameItemButton_OnEnter(button)
    if not self:IsValid() then
        return
    end
    if not AuctionFrameAuctions:IsVisible() then
        return
    end

    local name = button:GetName()

    local overlay = self.Overlay or self:CreateOverlay()
    overlay:ClearAllPoints()
    overlay:SetParent(button)
    overlay:SetAllPoints(button)
    overlay:Show()
    overlay:SetFrameLevel(button:GetFrameLevel() + 10)
    overlay:SetAttribute('macrotext', format(MACRO_TEMPLATE, name))
end

function SellSecure:IsSecureButton(button)
    local name = button:GetName()
    if not name then
        return false
    end
    if not issecurevariable(name) then
        return false
    end
    if not name:match('ContainerFrame%d+ItemButton%d+') then
        return false
    end
    return true
end

function SellSecure:CreateOverlay()
    local button = CreateFrame('Button', nil, UIParent, 'SecureActionButtonTemplate')
    button:SetAttribute('type', 'macro')
    button:SetScript('OnEnter', function(self)
        self:GetParent():GetScript('OnEnter')(self:GetParent())
    end)
    button:SetScript('OnLeave', function(self)
        self:Hide()
    end)

    self.Overlay = button
    return button
end
