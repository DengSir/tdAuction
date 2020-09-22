-- .index.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 9/18/2020, 2:48:17 PM

---@class ns
---@field UI UI
---@field Addon Addon
---@field Scaner Scaner
---@field FullScaner FullScaner
---@field BrowseScaner BrowseScaner
---@field PriceScaner PriceScaner
---@field Querier Querier
---@field global GLOBAL
---@field profile PROFILE

---@class UI
---@field FullScan FullScan
---@field Browse Browse
---@field BrowseItem BrowseItem
---@field Sell Sell
---@field ComboBox ComboBox

---@class Addon

---@class Scaner
---@field params Params

---@class FullScaner: Scaner

---@class BrowseScaner: Scaner

---@class PriceScaner: Scaner

---@class Params
---@field text string
---@field minLevel number
---@field maxLevel number
---@field page number
---@field usable boolean
---@field quality number
---@field filters any
---@field queryAll boolean

---@class Querier
---@field updater Frame
---@field params Params
---@field scaner Scaner

---@class SellOutput

---@class FullScan: Frame

---@class Browse: Frame

---@class Sell: Frame

---@class BrowseItem: Button

---@class ComboBox: Frame
