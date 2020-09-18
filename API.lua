-- API.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 9/18/2020, 2:24:41 PM
--
---@type ns
local ns = select(2, ...)

local Tooltip
function ns.GetAuctionSellItemLink()
    if not Tooltip then
        Tooltip = CreateFrame('GameTooltip', 'tdAuctionSellScaner', UIParent, 'GameTooltipTemplate')
    end
    Tooltip:SetOwner(UIParent, 'ANCHOR_NONE')
    Tooltip:SetAuctionSellItem()
    return select(2, Tooltip:GetItem())
end

function ns.ParseItemLink(link)
    if not link then
        return
    end
    local itemId, enchantId, suffixId, uniqueId = link:match('item:(%d*):(%d*):::::(%d*):(%d*)')
    if not itemId then
        return
    end
    return tonumber(itemId) or 0, tonumber(enchantId) or 0, tonumber(suffixId) or 0, tonumber(uniqueId) or 0
end

function ns.ParseItemKey(link)
    local itemId, _, suffixId = ns.ParseItemLink(link)
    if not itemId then
        return '0:0'
    end
    return itemId .. ':' .. suffixId
end

local VALID_NPCS = {
    -- 幽暗城
    [8672] = true,
    [8721] = true,
    [15675] = true,
    [15676] = true,
    [15682] = true,
    [15683] = true,
    [15684] = true,
    [15686] = true,
    -- 铁炉堡
    [8671] = true,
    [8720] = true,
    [9859] = true,
    -- 暴风城
    [8670] = true,
    [8719] = true,
    [15659] = true,
    -- 奥格瑞玛
    [8673] = true,
    [8724] = true,
    [9856] = true,
    -- 雷霆崖
    [8674] = true,
    [8722] = true,
    -- 达纳苏斯
    [8723] = true,
    [8669] = true,
    [15678] = true,
    [15679] = true,
}

local function NpcId()
    local guid = UnitGUID('npc')
    return guid and tonumber(guid:match('.-%-%d+%-%d+%-%d+%-%d+%-(%d+)'))
end

function ns.IsValidNpc()
    local npcId = NpcId()
    return npcId and VALID_NPCS[npcId]
end
