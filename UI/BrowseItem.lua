-- BrowseItem.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 9/21/2020, 10:27:30 AM
--
---@type ns
local ns = select(2, ...)

---@class UI.BrowseItem: Object, Button, tdAuctionBrowseItemTemplate
local BrowseItem = ns.Addon:NewClass('UI.BrowseItem', 'Button')

local NONE = GRAY_FONT_COLOR:WrapTextInColorCode(NONE)
-- @build>2@
local DURATION_TEXT = { --
    [1] = RED_FONT_COLOR:WrapTextInColorCode('< 30m'),
    [2] = YELLOW_FONT_COLOR:WrapTextInColorCode('30m-2h'),
    [3] = GREEN_FONT_COLOR:WrapTextInColorCode('2-12h'),
    [4] = GRAY_FONT_COLOR:WrapTextInColorCode('> 12h'),
}
-- @end-build>2@
-- @classic@
local DURATION_TEXT = { --
    [1] = RED_FONT_COLOR:WrapTextInColorCode('< 30m'),
    [2] = YELLOW_FONT_COLOR:WrapTextInColorCode('30m-2h'),
    [3] = GREEN_FONT_COLOR:WrapTextInColorCode('2-8h'),
    [4] = GRAY_FONT_COLOR:WrapTextInColorCode('> 8h'),
}
-- @end-classic@

function BrowseItem:Constructor()
    self:SetScript('OnClick', self.OnClick)
end

function BrowseItem:OnEnter()
    GameTooltip:SetOwner(self.Enter, 'ANCHOR_RIGHT')
    GameTooltip:SetAuctionItem('list', self.id)
    GameTooltip_ShowCompareItem()
    if IsModifiedClick('DRESSUP') then
        ShowInspectCursor()
    else
        ResetCursor()
    end
end

function BrowseItem:OnClick()
    local link = GetAuctionItemLink('list', self.id)
    if IsModifiedClick() then
        if ns.profile.buy.quickBuy and IsControlKeyDown() and IsAltKeyDown() then
            local buyoutPrice = select(10, GetAuctionItemInfo('list', self.id))
            if buyoutPrice and buyoutPrice > 0 then
                PlaceAuctionBid('list', self.id, buyoutPrice)
            end
        else
            HandleModifiedItemClick(link)
        end
    else
        if GetCVarBool('auctionDisplayOnCharacter') then
            DressUpItemLink(link)
        end

        SetSelectedAuctionItem('list', self.id)
        CloseAuctionStaticPopups()
        self:GetParent():GetParent():update()
    end
end

function BrowseItem:Update(id)
    local name, texture, count, quality, canUse, level, levelColHeader, minBid, minIncrement, buyoutPrice, bidAmount,
          highBidder, bidderFullName, owner, ownerFullName, saleStatus, itemId, hasAllInfo = GetAuctionItemInfo('list',
                                                                                                                id)
    local duration = GetAuctionItemTimeLeft('list', id)
    local selectedId = GetSelectedAuctionItem('list')

    self.id = id
    self:SetID(id)

    self.Bg:SetShown(id % 2 == 1)
    self.Selected:SetShown(selectedId == id)

    if count > 1 then
        self.Name.Text:SetText(format('|cffffd100%dx|r %s', count, name))
    else
        self.Name.Text:SetText(name)
    end
    self.Name.Text:SetTextColor(ns.rgb(GetItemQualityColor(quality)))

    self.Icon:SetTexture(texture)
    if canUse then
        self.Icon:SetVertexColor(1, 1, 1)
    else
        self.Icon:SetVertexColor(1, 0, 0)
    end

    self.Level.Text:SetText(level)
    if UnitLevel('player') >= level then
        self.Level.Text:SetTextColor(1, 1, 1)
    else
        self.Level.Text:SetTextColor(1, 0, 0)
    end

    self.Time.Text:SetText(DURATION_TEXT[duration])
    self.Seller.Text:SetText(owner)

    local displayedPrice, requiredBid
    if bidAmount == 0 then
        displayedPrice = minBid
        requiredBid = minBid
    else
        displayedPrice = bidAmount
        requiredBid = bidAmount + minIncrement
    end

    if requiredBid >= MAXIMUM_BID_PRICE then
        buyoutPrice = requiredBid
    end

    self.Bid.Text:SetText(ns.gsc(displayedPrice))

    if highBidder then
        self.Bid.Text:SetTextColor(0, 1, 0)
    elseif bidAmount ~= 0 then
        self.Bid.Text:SetTextColor(1, 0, 0)
    else
        self.Bid.Text:SetTextColor(1, 1, 1)
    end

    if buyoutPrice == 0 then
        self.Buyout.Text:SetText(NONE)
        self.UnitPrice.Text:SetText(NONE)
    else
        self.Buyout.Text:SetText(ns.gsc(buyoutPrice))
        self.UnitPrice.Text:SetText(ns.gsc(buyoutPrice / count))
    end
end
