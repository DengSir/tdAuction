-- Secure.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 12/10/2025, 1:11:26 AM
---@type ns
local ns = select(2, ...)

local MODE_BROWSE = 1
local MODE_SELL = 2

local SELL_TEMPLATE = [[
/click AuctionFrameTab1
/click BrowseResetButton
/click %s
/click BrowseSearchButton ForSell
/click AuctionFrameTab3
]]

local SEARCH_TEMPLATE = [[
/click %s
/click BrowseSearchButton
]]

---@class Secure : AceModule, AceHook-3.0, AceEvent-3.0
local Secure = ns.Addon:NewModule('Secure', 'AceHook-3.0', 'AceEvent-3.0')
Secure:Disable()

function Secure:OnEnable()
    self:SecureHook('ContainerFrameItemButton_OnEnter')
    self:RegisterEvent('MODIFIER_STATE_CHANGED')

    self:HookScript(BrowseSearchButton, 'PreClick', 'OnBrowsePreClick')
    self:HookScript(BrowsePrevPageButton, 'PreClick', 'OnBrowsePreClick')
    self:HookScript(BrowseNextPageButton, 'PreClick', 'OnBrowsePreClick')

    self:HookScript(BrowseName, 'OnEditFocusGained', 'OnBrowsePreClick')
    -- self:HookScript(BrowseName, 'OnEditFocusLost', function()
    --     C_Timer.After(0.01, function()
    --         if not BrowseName:HasFocus() then
    --             self.ourQuery = nil
    --         end
    --     end)
    -- end)
end

function Secure:OnDisable()
    if self.Overlay then
        self.Overlay:Hide()
    end
end

function Secure:OnBrowsePreClick(_, which)
    print(which)
    if which == 'ForSell' then
        self:SendMessage('TDAUCTION_QUERY_FOR_SELL')
    else
        self:SendMessage('TDAUCTION_QUERY_BROWSE')
    end
end

function Secure:MODIFIER_STATE_CHANGED()
    local mode = self:GetCurrentMode()
    if not mode then
        return
    end
    for _, v in ipairs(GetMouseFoci()) do
        if self:IsSecureButton(v) then
            self:ContainerFrameItemButton_OnEnter(v)
            return
        end
    end
end

function Secure:CreateOverlay()
    local overlay = CreateFrame('Button', nil, UIParent, 'SecureActionButtonTemplate')
    overlay:SetAttribute('type', 'macro')
    overlay:SetScript('OnLeave', overlay.Hide)
    overlay:SetScript('PreClick', function(overlay)
        if overlay.mode == MODE_SELL then
            AuctionFrameBrowse.page = nil
        end
    end)
    overlay:SetScript('PostClick', function(overlay)
        if overlay.mode == MODE_SELL then
            C_Container.PickupContainerItem(overlay.bag, overlay.slot)
            ClickAuctionSellItemButton()
            ClearCursor()
        end
    end)
    self.Overlay = overlay
    return overlay
end

function Secure:SetupOverlay(button, bag, slot, mode)
    local overlay = self.Overlay or self:CreateOverlay()
    overlay:ClearAllPoints()
    overlay:SetParent(button)
    overlay:SetAllPoints(button)
    overlay:SetPropagateMouseMotion(true)
    overlay:SetFrameLevel(button:GetFrameLevel() + 10)
    overlay:SetAttribute('macrotext', self:GenerateMacro(button, mode))
    overlay:Show()
    overlay.bag = bag
    overlay.slot = slot
    overlay.mode = mode
end

function Secure:GenerateMacro(button, mode)
    if mode == MODE_BROWSE then
        return format(SEARCH_TEMPLATE, button:GetName())
    elseif mode == MODE_SELL then
        return format(SELL_TEMPLATE, button:GetName())
    end
end

function Secure:ContainerFrameItemButton_OnEnter(button)
    local mode = self:GetCurrentMode()
    if not mode then
        return
    end

    if not IsModifiedClick('CHATLINK') then
        return
    end

    if not self:IsSecureButton(button) then
        return
    end

    local slot = button:GetID()
    local bag = button:GetParent():GetID()
    local itemLink = C_Container.GetContainerItemLink(bag, slot)
    if not itemLink then
        return
    end
    local info = C_Container.GetContainerItemInfo(bag, slot)
    if info.isBound or info.isLocked then
        return
    end

    self:SetupOverlay(button, bag, slot, mode)
end

function Secure:IsSecureButton(button)
    local name = button:GetName()
    if not name then
        return false
    end
    if not issecurevariable(name) then
        return false
    end
    if not name:match('ContainerFrame%d+Item%d+') then
        return false
    end
    return true
end

function Secure:GetCurrentMode()
    if AuctionFrameBrowse:IsVisible() then
        return MODE_BROWSE
    elseif AuctionFrameAuctions:IsVisible() then
        return MODE_SELL
    end
end
