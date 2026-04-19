-- Overlay.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 4/19/2026, 12:00:00 AM
---@type ns
local ns = select(2, ...)

local L = ns.L

local MODE_BROWSE = 1
local MODE_SELL = 2
local MODE_LOCKED = 3

---@class Overlay: Object, Button
local Overlay = ns.Addon:NewClass('Overlay', 'Button')

function Overlay:Create()
    return self:Bind(CreateFrame('Button', nil, UIParent,
                                 'SecureHandlerShowHideTemplate SecureHandlerEnterLeaveTemplate SecureHandlerStateTemplate'))
end

function Overlay:Constructor()
    self:Hide()
    self:SetParent(UIParent)
    self:SetPropagateMouseMotion(true)
    self:SetFrameStrata('FULLSCREEN_DIALOG')

    self:SetAttribute('_onstate-usable', [[
        if newstate == '1' then
            self:Hide()
        end
    ]])
    self:SetAttribute('_onleave', [[
        self:Hide()
    ]])
    self:SetAttribute('_onhide', [[
        self:Hide()
        self:SetParent(nil)
        self:ClearAllPoints()
    ]])

    self.ItemButton = BankFrameItem28
    self.ResetButton = BrowseResetButton

    self.PreClickButton = self:Catch(CreateFrame('Button', nil, self), true)
    self.PostClickButton = self:Catch(CreateFrame('Button', nil, self), true)
    self.BrowseSearch = self:Catch(BrowseLevelSort, true)
    self.SellSearch = self:Catch(BrowseDurationSort, true)

    self.PreClickButton:SetScript('OnClick', function()
        return self:PreClick()
    end)
    self.PostClickButton:SetScript('OnClick', function()
        return self:PostClick()
    end)
    self.PostClickButton:SetPropagateMouseClicks(false)

    self:HookScript('OnHide', self.OnHide)

    RegisterStateDriver(self, 'usable', '[combat]1;0')

    self.savedInfo = {}
    self:OnHide()
end

function Overlay:PostClick()
    if self.mode == MODE_SELL then
        C_Container.PickupContainerItem(self.bag, self.slot)
        ClickAuctionSellItemButton()
        ClearCursor()
        AuctionFrameTab3:Click()
    end
end

function Overlay:PreClick()
    if self.mode == MODE_LOCKED then
        UIErrorsFrame:AddMessage(L['Cannot perform this action while the search is locked.'], RED_FONT_COLOR:GetRGB())
    elseif self.mode == MODE_BROWSE then
        ns.Secure:BlockBlizzardSetSorts(1)
    elseif self.mode == MODE_SELL then
        ns.Secure:BlockBlizzardSetSorts(2)
        AuctionFrameTab1:Click()
    end
end

function Overlay:OnShow()
    local frameLevel = self:GetFrameLevel()

    if self.mode == MODE_LOCKED then
        self.PreClickButton:SetFrameLevel(frameLevel + 10)
        self.PreClickButton:Show()
        self.PreClickButton:SetPropagateMouseClicks(false)

        self.PostClickButton:Hide()
        self.BrowseSearch:Hide()
        self.SellSearch:Hide()
        self:Uncatch(self.ItemButton)
        self:Uncatch(self.ResetButton)

    elseif self.mode == MODE_BROWSE then
        self.PreClickButton:Show()
        self.ItemButton:Show()
        self.BrowseSearch:Show()

        self.SellSearch:Hide()
        self.PostClickButton:Hide()
        self:Uncatch(self.ResetButton)

        self.BrowseSearch:SetFrameLevel(frameLevel + 10)
        self:Catch(self.ItemButton):SetFrameLevel(frameLevel + 20)
        self.PreClickButton:SetFrameLevel(frameLevel + 30)

        self:SetID(self.bag)
        self.ItemButton:SetID(self.slot)
        self.PreClickButton:SetPropagateMouseClicks(true)

    elseif self.mode == MODE_SELL then
        self.PreClickButton:Show()
        self.ResetButton:Show()
        self.ItemButton:Show()
        self.SellSearch:Show()
        self.PostClickButton:Show()

        self.PostClickButton:SetFrameLevel(frameLevel + 10)
        self.SellSearch:SetFrameLevel(frameLevel + 20)
        self:Catch(self.ItemButton):SetFrameLevel(frameLevel + 30)
        self:Catch(self.ResetButton):SetFrameLevel(frameLevel + 40)
        self.PreClickButton:SetFrameLevel(frameLevel + 50)

        self:SetID(self.bag)
        self.ItemButton:SetID(self.slot)
        self.PreClickButton:SetPropagateMouseClicks(true)
    end
end

function Overlay:OnHide()
    self:Uncatch(self.ItemButton)
    self:Uncatch(self.ResetButton)

    self.PreClickButton:Hide()
    self.BrowseSearch:Hide()
    self.SellSearch:Hide()

    wipe(self.savedInfo)
    self.mode = nil
    self.bag = nil
    self.slot = nil
end

function Overlay:Catch(item, always)
    if not always and not self.savedInfo[item] then
        local info = {points = {}}
        info.id = item:GetID()
        info.parent = item:GetParent()
        info.alpha = item:GetAlpha()
        info.clicks = item:CanPropagateMouseClicks()
        info.motion = item:IsMouseMotionEnabled()
        info.level = item:GetFrameLevel()
        info.shown = item:IsShown()
        for i = 1, item:GetNumPoints() do
            info.points[i] = {item:GetPoint(i)}
        end
        self.savedInfo[item] = info
    end

    item:ClearAllPoints()
    item:SetParent(self)
    item:SetAllPoints(self)
    item:SetPropagateMouseClicks(true)
    item:SetMouseMotionEnabled(false)
    item:SetAlpha(0)

    return item
end

function Overlay:Uncatch(item)
    local info = self.savedInfo[item]
    if not info then
        return
    end
    self.savedInfo[item] = nil

    item:ClearAllPoints()
    item:SetParent(info.parent)
    for _, p in ipairs(info.points) do
        item:SetPoint(unpack(p))
    end
    item:SetPropagateMouseClicks(info.clicks)
    item:SetMouseMotionEnabled(info.motion)
    item:SetAlpha(info.alpha)
    item:SetFrameLevel(info.level)
    item:SetShown(info.shown)
    item:SetID(info.id)
end

function Overlay:Setup(button, bag, slot, mode)
    self.bag = bag
    self.slot = slot
    self.mode = mode
    self:ClearAllPoints()
    self:SetAllPoints(button)
    self:SetFrameStrata('FULLSCREEN_DIALOG')
    self:SetFrameLevel(9400)
    self:Show()
    self:OnShow()
end

function Overlay:Close()
    self:Hide()
end
