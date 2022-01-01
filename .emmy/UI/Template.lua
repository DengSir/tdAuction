---@class __tdAuctionFeaturesFrameTemplate_FullScanButton : UIPanelButtonTemplate , Button

---@class __tdAuctionFeaturesFrameTemplate_OptionButton : UIPanelButtonTemplate , Button

---@class tdAuctionFeaturesFrameTemplate : Frame
---@field FullScanButton __tdAuctionFeaturesFrameTemplate_FullScanButton
---@field OptionButton __tdAuctionFeaturesFrameTemplate_OptionButton
local tdAuctionFeaturesFrameTemplate = {}

---@class __tdAuctionFullScanFrameTemplate_CloseButton : UIPanelCloseButton , Button

---@class __tdAuctionFullScanFrameTemplate_ExecButton : UIPanelButtonTemplate , Button

---@class __tdAuctionFullScanFrameTemplate_ProgressBar : StatusBar
---@field Text FontString
local __tdAuctionFullScanFrameTemplate_ProgressBar = {}

---@class tdAuctionFullScanFrameTemplate : BackdropTemplate , Frame
---@field Header Texture
---@field HeaderText FontString
---@field Text FontString
---@field Blocker Frame
---@field CloseButton __tdAuctionFullScanFrameTemplate_CloseButton
---@field ExecButton __tdAuctionFullScanFrameTemplate_ExecButton
---@field ProgressBar __tdAuctionFullScanFrameTemplate_ProgressBar
local tdAuctionFullScanFrameTemplate = {}

---@class tdAuctionItemTextTemplate : Frame
local tdAuctionItemTextTemplate = {}

---@class tdAuctionItemTextLeftTemplate : tdAuctionItemTextTemplate , Frame
---@field Text FontString
local tdAuctionItemTextLeftTemplate = {}

---@class tdAuctionItemTextLeftElideTemplate : tdAuctionItemTextTemplate , Frame
---@field Text FontString
local tdAuctionItemTextLeftElideTemplate = {}

---@class tdAuctionItemTextCenterTemplate : tdAuctionItemTextTemplate , Frame
---@field Text FontString
local tdAuctionItemTextCenterTemplate = {}

---@class tdAuctionItemTextCenterElideTemplate : tdAuctionItemTextTemplate , Frame
---@field Text FontString
local tdAuctionItemTextCenterElideTemplate = {}

---@class tdAuctionItemTextRightTemplate : tdAuctionItemTextTemplate , Frame
---@field Text FontString
local tdAuctionItemTextRightTemplate = {}

---@class tdAuctionBrowseItemTemplate : Button
---@field Icon Texture
---@field Selected Texture
---@field Highlight Texture
---@field Bg Texture
---@field Enter Button
local tdAuctionBrowseItemTemplate = {}

---@class tdAuctionSortButtonTemplate : Button
---@field BgLeft Texture
---@field BgRight Texture
---@field Text FontString
---@field Arrow Texture
local tdAuctionSortButtonTemplate = {}

---@class __tdAuctionBrowseBuyFrameTemplate_ResetButton : UIPanelButtonTemplate , Button

---@class __tdAuctionBrowseBuyFrameTemplate_ScrollFrame_scrollBar : HybridScrollBarTemplate , Slider

---@class __tdAuctionBrowseBuyFrameTemplate_ScrollFrame : HybridScrollFrameTemplate , ScrollFrame
---@field scrollBar __tdAuctionBrowseBuyFrameTemplate_ScrollFrame_scrollBar
local __tdAuctionBrowseBuyFrameTemplate_ScrollFrame = {}

---@class __tdAuctionBrowseBuyFrameTemplate_SortButtonFrame_UnitPrice : tdAuctionSortButtonTemplate , Button

---@class __tdAuctionBrowseBuyFrameTemplate_SortButtonFrame_Buyout : tdAuctionSortButtonTemplate , Button

---@class __tdAuctionBrowseBuyFrameTemplate_SortButtonFrame_Bid : tdAuctionSortButtonTemplate , Button

---@class __tdAuctionBrowseBuyFrameTemplate_SortButtonFrame_Seller : tdAuctionSortButtonTemplate , Button

---@class __tdAuctionBrowseBuyFrameTemplate_SortButtonFrame_Time : tdAuctionSortButtonTemplate , Button

---@class __tdAuctionBrowseBuyFrameTemplate_SortButtonFrame_Level : tdAuctionSortButtonTemplate , Button

---@class __tdAuctionBrowseBuyFrameTemplate_SortButtonFrame_Name : tdAuctionSortButtonTemplate , Button

---@class __tdAuctionBrowseBuyFrameTemplate_SortButtonFrame : Frame
---@field UnitPrice __tdAuctionBrowseBuyFrameTemplate_SortButtonFrame_UnitPrice
---@field Buyout __tdAuctionBrowseBuyFrameTemplate_SortButtonFrame_Buyout
---@field Bid __tdAuctionBrowseBuyFrameTemplate_SortButtonFrame_Bid
---@field Seller __tdAuctionBrowseBuyFrameTemplate_SortButtonFrame_Seller
---@field Time __tdAuctionBrowseBuyFrameTemplate_SortButtonFrame_Time
---@field Level __tdAuctionBrowseBuyFrameTemplate_SortButtonFrame_Level
---@field Name __tdAuctionBrowseBuyFrameTemplate_SortButtonFrame_Name
local __tdAuctionBrowseBuyFrameTemplate_SortButtonFrame = {}

---@class tdAuctionBrowseBuyFrameTemplate : Frame
---@field NoResultsText FontString
---@field ResetButton __tdAuctionBrowseBuyFrameTemplate_ResetButton
---@field ScrollFrame __tdAuctionBrowseBuyFrameTemplate_ScrollFrame
---@field SortButtonFrame __tdAuctionBrowseBuyFrameTemplate_SortButtonFrame
---@field ColumnOption Button
local tdAuctionBrowseBuyFrameTemplate = {}

---@class tdAuctionSellDurationDropDown : UIDropDownMenuTemplate , Frame

---@class __tdAuctionSellFrameTemplate_PriceReading_AnimFrame : Frame
---@field Anim AnimationGroup
local __tdAuctionSellFrameTemplate_PriceReading_AnimFrame = {}

---@class __tdAuctionSellFrameTemplate_PriceReading : Frame
---@field AnimFrame __tdAuctionSellFrameTemplate_PriceReading_AnimFrame
local __tdAuctionSellFrameTemplate_PriceReading = {}

---@class __tdAuctionSellFrameTemplate_PriceList_ScrollFrame_scrollBar : HybridScrollBarTemplate , Slider

---@class __tdAuctionSellFrameTemplate_PriceList_ScrollFrame : HybridScrollFrameTemplate , ScrollFrame
---@field scrollBar __tdAuctionSellFrameTemplate_PriceList_ScrollFrame_scrollBar
local __tdAuctionSellFrameTemplate_PriceList_ScrollFrame = {}

---@class __tdAuctionSellFrameTemplate_PriceList : BackdropTemplate , Frame
---@field CountLabel FontString
---@field PriceLabel FontString
---@field Close Button
---@field ScrollFrame __tdAuctionSellFrameTemplate_PriceList_ScrollFrame
local __tdAuctionSellFrameTemplate_PriceList = {}

---@class tdAuctionSellFrameTemplate : Frame
---@field PriceSetText FontString
---@field DurationDropDown tdAuctionSellDurationDropDown
---@field PriceListButton Button
---@field BuyoutError Frame
---@field PriceReading __tdAuctionSellFrameTemplate_PriceReading
---@field PriceList __tdAuctionSellFrameTemplate_PriceList
local tdAuctionSellFrameTemplate = {}

---@class tdAuctionPriceItemTemplate : Button
---@field Count FontString
---@field Price FontString
local tdAuctionPriceItemTemplate = {}
