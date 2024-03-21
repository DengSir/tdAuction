-- TipScaner.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 5/22/2020, 9:31:04 AM
--
---@class ns
local ns = select(2, ...)

---@type LibGameTooltip
local TipScaner
do
    local tip = tdScanTip or CreateFrame('GameTooltip', 'tdScanTip', nil, 'GameTooltipTemplate')
    TipScaner = LibStub('LibTooltipExtra-1.0'):New(tip)
end

ns.TipScaner = TipScaner

TipScaner:SetClampedToScreen(false)

function TipScaner:Clear()
    self:ClearLines()

    if not self:IsOwned(WorldFrame) then
        self:SetOwner(WorldFrame, 'ANCHOR_NONE')
        self:SetPoint('TOP', WorldFrame, 'BOTTOM', -10000, -10000)
    end
end
