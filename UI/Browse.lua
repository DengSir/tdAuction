-- Browse.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 9/21/2020, 10:59:31 AM
--
---@type ns
local ns = select(2, ...)

local ripairs = ipairs_reverse or ripairs

local L = ns.L

local BUTTON_HEIGHT = 18
local FILTER_FRAME_SHORT = ns.NARROW_FILTER and 48 or 0
local CONTROL_LABEL_SPACING = ns.NARROW_FILTER and 0 or -3

local BUTTON_WIDTH_WITHSCROLL = 608 + FILTER_FRAME_SHORT
local BUTTON_WIDTH_NOSCROLL = BUTTON_WIDTH_WITHSCROLL + 28
local FRAME_WIDTH_WITHSCROLL = BUTTON_WIDTH_WITHSCROLL + 4
local FRAME_WIDTH_NOSCROLL = BUTTON_WIDTH_NOSCROLL + 4

---@class UI.Browse: Object, Frame
local Browse = ns.Addon:NewClass('UI.Browse', 'Frame')

if ns.TITAN then
    Browse.RegisterMessage = LibStub('AceEvent-3.0').RegisterMessage
end

function Browse:Constructor(parent)
    self.scaner = ns.BrowseScaner:New()
    self.scaner:SetCallback('OnDone', function()
        self.Browse.isSearching = nil
        self:UpdateAll()

        if self.SecureInput then
            self.SecureInput:Hide()
        end
    end)

    self.Browse = parent
    self:LayoutBlizzard()
    self:SetupSortButtons()
    self:SetupScrollFrame()
    self:UpdateColumns()
    self:SetupEventsAndHooks()
    self:SaveSorts()
end

function Browse:LayoutBlizzard()
    local BrowseDropDown = BrowseDropDown or BrowseDropdown
    local BrowseDropDownName = BrowseDropDownName or BrowseDropdownName

    ---@type tdAuctionBrowseBuyFrameTemplate
    self.BuyFrame = CreateFrame('Frame', nil, self.Browse, 'tdAuctionBrowseBuyFrameTemplate')
    self.Name = BrowseName
    self.SearchButton = BrowseSearchButton
    self.PrevPageButton = BrowsePrevPageButton
    self.NextPageButton = BrowseNextPageButton
    self.QualityDropDown = BrowseDropDown
    self.IsUsableCheckButton = IsUsableCheckButton
    self.BidPrice = BrowseBidPrice
    self.BidButton = BrowseBidButton
    self.BuyoutButton = BrowseBuyoutButton
    self.SearchCountText = BrowseSearchCountText
    self.MinLevel = BrowseMinLevel
    self.MaxLevel = BrowseMaxLevel
    self.ResetButton = BrowseResetButton
    self.ScrollFrame = self.BuyFrame.ScrollFrame
    self.NoResultsText = self.BuyFrame.NoResultsText
    self.SortButtonFrame = self.BuyFrame.SortButtonFrame
    self.ExactCheckButton = self.BuyFrame.ExactCheckButton

    if not ns.TITAN then
        self.ExactCheckButton:SetScript('OnClick', function()
            ns.profile.buy.exact = self.ExactCheckButton:GetChecked() or nil
        end)
        self.ExactCheckButton:SetChecked(ns.profile.buy.exact)
        self.ExactCheckButton:SetParent(self)
    else
        self.ExactCheckButton:Hide()
    end

    self.ResetButton:SetSize(80, 22)

    local hide = ns.hide
    local point = ns.point
    local function text(obj, text)
        if not obj then
            -- @debug@
            error('Invalid obj', 2)
            -- @end-debug@
            return
        end
        obj:SetFontObject('GameFontHighlightSmall')
        obj:SetText(text)
    end
    local function parent(obj)
        if not obj then
            -- @debug@
            error('Invalid obj', 2)
            -- @end-debug@
            return
        end
        obj:SetParent(self.BuyFrame)
        obj:Show()
        obj.Hide = nop
    end

    for i = 1, NUM_BROWSE_TO_DISPLAY do
        hide(_G['BrowseButton' .. i])
    end
    hide(BrowseQualitySort)
    hide(BrowseLevelSort)
    hide(BrowseDurationSort)
    hide(BrowseHighBidderSort)
    hide(BrowseCurrentBidSort)
    hide(BrowseScrollFrame)
    hide(BrowseNoResultsText)
    hide(BrowsePriceOptionsButtonFrame)

    text(ShowOnPlayerCheckButtonText, DISPLAY_ON_CHARACTER)
    text(IsUsableCheckButtonText, USABLE_ITEMS)
    text(self.ExactCheckButton.Text or self.ExactCheckButton.text, AH_EXACT_MATCH)

    local labels = {BrowseLevelText, BrowseNameText, BrowseDropDownName}
    local height = 0
    for _, label in ipairs(labels) do
        height = max(height, label:GetHeight())
    end
    for _, label in ipairs(labels) do
        label:SetHeight(height)
    end

    local nameWidth = 220

    self.Name:SetWidth(nameWidth)

    if not ns.TITAN then
        local function Get(index)
            return self.qualityIndex == index;
        end

        local function Set(index)
            self.qualityIndex = index;
        end

        -- 和Blizzard_AuctionUI.lua保持一致
        local FILTER_ALL_INDEX = -1

        self.qualityIndex = FILTER_ALL_INDEX

        self.QualityDropDown:SetupMenu(function(_, root)
            root:CreateRadio(ALL, Get, Set, FILTER_ALL_INDEX)

            for i = Enum.ItemQuality.Poor, Enum.ItemQuality.Epic do
                local name = ns.ITEM_QUALITY_DESCS[i]
                if name then
                    root:CreateRadio(name, Get, Set, i)
                end
            end
        end)
    end

    self.QualityDropDown:SetWidth(100)

    point(BrowseSearchDotsText, 'LEFT', self.NoResultsText, 'RIGHT')

    point(self.ResetButton, 'TOPRIGHT', 67, -35)
    point(self.SearchButton, 'TOPRIGHT', self.ResetButton, 'TOPLEFT', -5, 0)
    point(self.PrevPageButton, 'TOPLEFT', 658, -53)
    point(self.NextPageButton, 'TOPRIGHT', 70, -53)
    point(self.SearchCountText, 'BOTTOMLEFT', 190, 17)
    point(self.BidPrice, 'BOTTOM', 115, 18)

    point(BrowseLevelText, 'TOPLEFT', nameWidth + 90, -38)
    point(BrowseDropDownName, 'TOPLEFT', self.Browse, nameWidth + 170, -38)

    point(self.Name, 'TOPLEFT', BrowseNameText, 'BOTTOMLEFT', 3, -3 + CONTROL_LABEL_SPACING)
    point(self.MinLevel, 'TOPLEFT', BrowseLevelText, 'BOTTOMLEFT', 0, -3 + CONTROL_LABEL_SPACING)
    point(self.QualityDropDown, 'TOPLEFT', BrowseDropDownName, 'BOTTOMLEFT', -3, CONTROL_LABEL_SPACING)
    point(self.IsUsableCheckButton, 'TOPLEFT', nameWidth + 300, -38)
    point(ShowOnPlayerCheckButton, 'TOPLEFT', self.IsUsableCheckButton, 'BOTTOMLEFT', 0, 2)

    parent(self.PrevPageButton)
    parent(self.NextPageButton)
    parent(self.SearchCountText)
    parent(self.BidButton)
    parent(self.BuyoutButton)
    parent(self.SearchButton)
    parent(self.ResetButton)

    if ns.NARROW_FILTER then
        local function SetWidth(button, width, our)
            if our then
                return
            end
            button:SetWidth(width - FILTER_FRAME_SHORT, true)
        end

        for i = 1, 100 do
            local button = _G['AuctionFilterButton' .. i]
            if not button then
                break
            end
            button:SetWidth(70)
            hooksecurefunc(button, 'SetWidth', SetWidth)
        end

        point(BrowseFilterScrollFrame, 'TOPRIGHT', self.Browse, 'TOPLEFT', 158 - FILTER_FRAME_SHORT, -105)
    end

    point(self.ScrollFrame, 'TOPLEFT', self.Browse, 190 - FILTER_FRAME_SHORT, -104)
end

function Browse:SetupScrollFrame()
    self.ScrollFrame.update = function()
        return self:UpdateItems()
    end
    HybridScrollFrame_CreateButtons(self.ScrollFrame, 'tdAuctionBrowseItemTemplate')

    for _, button in ipairs(self.ScrollFrame.buttons) do
        ns.UI.BrowseItem:Bind(button)
    end
end

function Browse:SetupSortButtons()
    self.sortButtons = {}
    self.headers = {
        {key = 'Name', reverse = false, sortColumn = 'quality', text = NAME},
        {key = 'Level', reverse = true, hiddenable = true, sortColumn = 'level', text = REQ_LEVEL_ABBR},
        {key = 'Time', reverse = true, hiddenable = true, sortColumn = 'duration', text = L['Time']},
        {key = 'Seller', reverse = true, hiddenable = true, sortColumn = 'seller', text = AUCTION_CREATOR},
        {key = 'Bid', reverse = true, hiddenable = true, sortColumn = 'bid', text = L['Bid price']},
        {key = 'UnitBid', reverse = true, hiddenable = true, sortColumn = 'unitbid', text = L['Bid unit price']},
        {key = 'Buyout', reverse = true, hiddenable = true, sortColumn = 'buyout', text = BUYOUT},
        {key = 'UnitPrice', reverse = true, hiddenable = true, sortColumn = 'unitprice', text = L['Unit price']},
    }

    local function SortAuction(button)
        local sortColumn, reverse = ns.GetAuctionSort()
        local order = sortColumn and sortColumn == button.sortColumn and not reverse
        ns.SetSort(button.sortColumn, order)
    end

    local function OnClick(button)
        SortAuction(button)
        self:RequestSearch()
        self:SaveSorts()
    end

    local function PreClick(button)
        SortAuction(button)
        self:SaveSorts()
    end

    for _, info in pairs(self.headers) do
        local button = self.SortButtonFrame[info.key]
        button.key = info.key
        button.reverse = not not info.reverse
        button.sortColumn = info.sortColumn
        if ns.TITAN then
            button:SetScript('PreClick', PreClick)
            button:SetAttribute('type', 'macro')
            button:SetAttribute('macrotext', '/click BrowseSearchButton')
        else
            button:SetScript('OnClick', OnClick)
        end
        button.Text:SetText(info.text)
        if info.width then
            button:SetWidth(info.width)
        end
        tinsert(self.sortButtons, button)
    end

    local function get(key)
        return not ns.profile.buy.hiddenColumns[key]
    end

    local function set(key)
        ns.profile.buy.hiddenColumns[key] = not ns.profile.buy.hiddenColumns[key]
        self:UpdateColumns()
    end

    self.BuyFrame.ColumnOption:SetupMenu(function(_, root)
        root:CreateTitle(L['Toggle column'])
        root:CreateDivider()
        for _, info in ipairs(self.headers) do
            if info.hiddenable then
                root:CreateCheckbox(info.text, get, set, info.key)
            end
        end
        root:CreateDivider()
        root:CreateButton(CANCEL, nop)
    end)
end

function Browse:GenColumnMenu()
    local list = {}
    for _, info in ipairs(self.headers) do
        if info.hiddenable then
            tinsert(list, {
                text = info.text,
                isNotRadio = true,
                checked = not ns.profile.buy.hiddenColumns[info.key],
                func = function()
                    ns.profile.buy.hiddenColumns[info.key] = not ns.profile.buy.hiddenColumns[info.key]
                    self:UpdateColumns()
                end,
            })
        end
    end
    return list
end

function Browse:UpdateColumns()
    self:ApplyItem(self.SortButtonFrame)

    for _, item in ipairs(self.ScrollFrame.buttons) do
        self:ApplyItem(item)
    end
end

function Browse:ApplyItem(frame)
    local prevItem = frame.ColumnAnchor
    for _, info in ripairs(self.headers) do
        local hidden = ns.profile.buy.hiddenColumns[info.key]
        local item = frame[info.key]
        item:SetShown(not hidden)

        if not hidden then
            item:SetPoint('RIGHT', prevItem, 'LEFT')
            prevItem = item
        end
    end
end

function Browse:SetupEventsAndHooks()
    if not ns.TITAN then
        AuctionFrameBrowse_Update = nop
        AuctionFrameBrowse_UpdateArrows = nop
        AuctionFrameBrowse_Search = function()
            return self:RequestSearch()
        end

        hooksecurefunc('BrowseWowTokenResults_Update', function()
            self.BuyFrame:SetShown(not self:IsAtWowToken())
        end)
    end

    hooksecurefunc('SetSelectedAuctionItem', function(listType)
        if listType == 'list' then
            self:UpdateItems()
            self:UpdateSelected()
        end
    end)

    self.SearchButton:HookScript('OnEnable', function()
        for _, button in ipairs(self.sortButtons) do
            button:Enable()
        end
    end)

    self.SearchButton:HookScript('OnDisable', function()
        for _, button in ipairs(self.sortButtons) do
            button:Disable()
        end
    end)

    self.Browse:SetScript('OnEvent', function()
        self.Browse.isSearching = nil
        self:UpdateAll()
    end)

    self.Browse:HookScript('OnShow', function()
        self:RestoreSorts()
        self:UpdateAll()
    end)

    if not ns.TITAN then
        local orig_ChatEdit_InsertLink = ChatEdit_InsertLink
        _G.ChatEdit_InsertLink = function(text)
            if self.Name:IsVisible() and IsShiftKeyDown() then
                self.Name:Hide()
                local ok = orig_ChatEdit_InsertLink(text)
                self.Name:Show()

                if not ok then
                    local name, link = GetItemInfo(text)
                    if link then
                        self.Name:SetText(link)
                        self:RequestSearch()
                        ok = true
                    end
                end
                return ok
            else
                return orig_ChatEdit_InsertLink(text)
            end
        end
    else
        self:RegisterMessage('TDAUCTION_QUERY_BROWSE', function()
            self.scaner:Query({virtual = true})
        end)

        self:RegisterMessage('TDAUCTION_INSECURE_TEXT_INPUT', function(_, text)
            self.Name:SetText('')
            self:GetSecureInput():ShowText(text)
        end)
    end

    self:PatchVisible('UpdateItems')
    self:PatchVisible('UpdateSelected')
    self:PatchVisible('UpdateControls')
    self:PatchVisible('UpdateSortButtons')
end

function Browse:GetSecureInput()
    if not self.SecureInput then
        self.SecureInput = ns.UI.SecureInput:Bind(CreateFrame('Frame', nil, AuctionFrame,
                                                              'tdAuctionSecureInputFrameTemplate'))
    end
    return self.SecureInput
end

function Browse:UpdateAll()
    self:UpdateItems()
    self:UpdateSelected()
    self:UpdateControls()
    self:UpdateSortButtons()
end

function Browse:UpdateItems()
    local scrollFrame = self.ScrollFrame
    local offset = HybridScrollFrame_GetOffset(scrollFrame)
    local page = self.Browse.page or 0
    local pageStart = NUM_AUCTION_ITEMS_PER_PAGE * page

    local ourSearch = self:IsOurSearch()
    local shouldHide = self.Browse.isSearching or not ourSearch
    local num, total, hasScrollBar, buttonWidth
    local totalHeight = 0

    if not shouldHide then
        num, total = GetNumAuctionItems('list')
        hasScrollBar = num * BUTTON_HEIGHT > scrollFrame:GetHeight()
        buttonWidth = hasScrollBar and BUTTON_WIDTH_WITHSCROLL or BUTTON_WIDTH_NOSCROLL
        totalHeight = num * BUTTON_HEIGHT
    end

    if not self.Browse.isSearching then
        self.ScrollFrame:SetWidth(hasScrollBar and FRAME_WIDTH_WITHSCROLL or FRAME_WIDTH_NOSCROLL)
    end

    for i, button in ipairs(scrollFrame.buttons) do
        local id = offset + i
        local index = id + pageStart
        if shouldHide or (index > num + pageStart) then
            button:Hide()
        else
            button:Show()
            button:Update(id)
            button:SetWidth(buttonWidth)
        end
    end
    HybridScrollFrame_Update(scrollFrame, totalHeight, scrollFrame:GetHeight())

    if not ourSearch then
        self.NoResultsText:SetText(BROWSE_SEARCH_TEXT)
    elseif self.Browse.isSearching then
        self.NoResultsText:SetText(SEARCHING_FOR_ITEMS)
    elseif not num or num == 0 then
        self.NoResultsText:SetText(BROWSE_NO_RESULTS)
    else
        self.NoResultsText:SetText('')
    end
end

function Browse:UpdateSortButtons()
    local sortColumn, reverse = ns.GetAuctionSort()

    for i, button in ipairs(self.sortButtons) do
        if sortColumn == button.sortColumn then
            if reverse ~= button.reverse then
                button.Arrow:SetTexCoord(0, 0.5625, 1, 0)
            else
                button.Arrow:SetTexCoord(0, 0.5625, 0, 1)
            end
            button.Arrow:Show()
        else
            button.Arrow:Hide()
        end
    end
end

function Browse:UpdateSelected()
    self.BidButton:Show()
    self.BuyoutButton:Show()
    self.BidButton:Disable()
    self.BuyoutButton:Disable()

    local id = GetSelectedAuctionItem('list')
    if id == 0 then
        return
    end

    local money = GetMoney()
    local name, texture, count, quality, canUse, level, levelColHeader, minBid, minIncrement, buyoutPrice, bidAmount,
          highBidder, bidderFullName, owner, ownerFullName, saleStatus, itemId, hasAllInfo = GetAuctionItemInfo('list',
                                                                                                                id)
    local ownerName = ownerFullName or owner
    local isMine = UnitName('player') == ownerName

    if buyoutPrice > 0 and buyoutPrice >= minBid then
        local canBuyout = 1
        if money < buyoutPrice then
            if not highBidder or money + bidAmount < buyoutPrice then
                canBuyout = nil
            end
        end
        if canBuyout and not isMine then
            self.BuyoutButton:Enable()
            AuctionFrame.buyoutPrice = buyoutPrice
        end
    else
        AuctionFrame.buyoutPrice = nil
    end

    local requiredBid

    if bidAmount == 0 then
        requiredBid = minBid
    else
        requiredBid = bidAmount + minIncrement
    end

    ns.SetMoneyFrame(self.BidPrice, requiredBid)

    if not highBidder and not isMine and money >= requiredBid and requiredBid <= MAXIMUM_BID_PRICE then
        self.BidButton:Enable()
    end
end

function Browse:UpdateControls()
    local shouldHide = self.Browse.isSearching or not self:IsOurSearch()
    if not shouldHide then
        local page = self.Browse.page or 0
        local num, total = GetNumAuctionItems('list')
        if total > NUM_AUCTION_ITEMS_PER_PAGE and num <= NUM_AUCTION_ITEMS_PER_PAGE then
            self.PrevPageButton.isEnabled = page ~= 0
            self.NextPageButton.isEnabled = page ~= ceil(total / NUM_AUCTION_ITEMS_PER_PAGE) - 1

            local itemsMin = page * NUM_AUCTION_ITEMS_PER_PAGE + 1
            local itemsMax = itemsMin + num - 1
            self.SearchCountText:SetFormattedText(NUMBER_OF_RESULTS_TEMPLATE, itemsMin, itemsMax, total)
            return
        end
    end

    self.PrevPageButton.isEnabled = false
    self.NextPageButton.isEnabled = false
    self.SearchCountText:SetText('')
end

function Browse:IsAtWowToken()
    return AuctionFrame_DoesCategoryHaveFlag('WOW_TOKEN_FLAG', self.Browse.selectedCategoryIndex)
end

function Browse:IsOurSearch()
    return self.scaner == ns.Querier.scaner
end
function Browse:RequestSearch()
    self.isSearching = true
    self:BuildSearchParams()
    self:UpdateItems()
    self.scaner:Query(self.searchParams)
end

function Browse:BuildSearchParams()
    local params = {
        text = self.Name:GetText(),
        minLevel = self.MinLevel:GetNumber(),
        maxLevel = self.MaxLevel:GetNumber(),
        filters = self:GetFilters(),
        usable = self.IsUsableCheckButton:GetChecked(),
        quality = self.qualityIndex,
        exact = self.ExactCheckButton:GetChecked(),
    }

    if not ns.ParamsEqual(params, self.searchParams) then
        self.searchParams = params
        self.Browse.page = 0
    end
    self.searchParams.page = self.Browse.page
end

function Browse:GetFilters()
    local categoryIndex = self.Browse.selectedCategoryIndex
    local subCategoryIndex = self.Browse.selectedSubCategoryIndex
    local subSubCategoryIndex = self.Browse.selectedSubSubCategoryIndex
    local filters

    if categoryIndex and subCategoryIndex and subSubCategoryIndex then
        filters = AuctionCategories[categoryIndex].subCategories[subCategoryIndex].subCategories[subSubCategoryIndex]
                      .filters
    elseif categoryIndex and subCategoryIndex then
        filters = AuctionCategories[categoryIndex].subCategories[subCategoryIndex].filters
    elseif categoryIndex then
        filters = AuctionCategories[categoryIndex].filters
    else
    end
    return filters
end

function Browse:PatchVisible(method)
    local m = self[method]
    if m then
        self[method] = function()
            if self:IsVisible() then
                return m(self)
            end
        end
    end
end

function Browse:SaveSorts()
    local sorts = {}
    local i = 1
    while true do
        local column, reverse = GetAuctionSort('list', i)
        if not column then
            break
        end
        tinsert(sorts, 1, {column = column, reverse = reverse})

        i = i + 1
    end

    self.sorts = sorts
end

function Browse:RestoreSorts()
    SortAuctionClearSort('list')

    for i, v in ipairs(self.sorts) do
        SortAuctionSetSort('list', v.column, v.reverse)
    end
end
