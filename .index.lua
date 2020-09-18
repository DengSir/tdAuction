-- .index.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 9/18/2020, 2:48:17 PM

---@class ns
---@field UI UI
---@field Addon Addon
---@field Scaner Scaner
---@field FullScaner FullScaner
---@field Querier Querier
---@field global GLOBAL

---@class UI
---@field FullScan FullScan
---@field Browse Browse

---@class Addon

---@class Scaner

---@class FullScaner: Scaner

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
