-- ElvUI.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 7/15/2021, 4:53:08 PM
--
if not ElvUI then
    return
end

---@type ns
local ns = select(2, ...)
local E = unpack(ElvUI)
local S = E:GetModule('Skins')

local function hook(t, m, f)
    local o = t[m]
    t[m] = function(...)
        return f(o, ...)
    end
end

hook(ns.Addon, 'SetupUI', function(o, self)
    C_Timer.After(0, function()
        o(self)

        local point = ns.point

        local Browse = ns.Addon.Browse
        do
            for _, button in ipairs(Browse.sortButtons) do
                button:StripTextures()
                button.Arrow:SetTexture([[Interface\Buttons\UI-SortArrow]])
                button:StyleButton()
            end

            point(Browse.PrevPageButton, 'TOPLEFT', 658, -58)
            point(Browse.NextPageButton, 'TOPRIGHT', 70, -58)
            point(Browse.SearchCountText, 'BOTTOMLEFT', 190, 12)
            point(BrowseBidPrice, 'BOTTOM', 115, 8)
            point(BrowseBidText, 'RIGHT', BrowseBidPrice, 'LEFT', -5, 0)

            S:HandleScrollBar(Browse.BuyFrame.ScrollFrame.scrollBar)
            S:HandleCheckBox(Browse.ExactCheckButton)

            for _, button in ipairs(Browse.BuyFrame.ScrollFrame.buttons) do
                S:HandleIcon(button.Icon)
            end

            Browse:UpdateSortButtons()
        end

        local Features = ns.Addon.Features
        do
            point(Features.FullScanButton, 'TOPLEFT', AuctionFrame.backdrop, 5, -5)
            S:HandleButton(Features.FullScanButton)
            S:HandleButton(Features.OptionButton)
        end

        local FullScan = ns.Addon.FullScan
        do
            FullScan.Blocker:ClearAllPoints()
            FullScan.Blocker:SetAllPoints(AuctionFrame.backdrop)

            for _, v in ipairs({FullScan.Blocker:GetRegions()}) do
                v:Hide()
            end

            local tex = FullScan.Blocker:CreateTexture(nil, 'BACKGROUND')
            tex:SetAllPoints(true)
            tex:SetColorTexture(0, 0, 0, 0.6)

            FullScan:StripTextures()
            FullScan:SetTemplate('Transparent')

            S:HandleCloseButton(FullScan.CloseButton, FullScan)
            S:HandleButton(FullScan.ExecButton)
        end

        local Sell = ns.Addon.Sell
        do
            AuctionsItemButton:StripTextures()
            AuctionsItemButton:SetTemplate('Default', true)
            AuctionsItemButton:StyleButton()

            S:HandleDropDownBox(Sell.DurationDropDown)
            S:HandleNextPrevButton(Sell.PriceListButton, 'right', nil, true)

            Sell.PriceList:StripTextures()
            Sell.PriceList:SetTemplate('Transparent')

            S:HandleScrollBar(Sell.PriceList.ScrollFrame.scrollBar)

            Sell.PriceList.Close:SetSize(32, 32)
            S:HandleCloseButton(Sell.PriceList.Close, Sell.PriceList, 5, 5)

            Sell.PriceList:Point('TOPLEFT', Sell.PriceReading, 'TOPRIGHT', 6, 13)
        end
    end)
end)
