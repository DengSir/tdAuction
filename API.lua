-- API.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 9/18/2020, 2:24:41 PM
--
---@class ns
local ns = select(2, ...)

ns.BUILD = tonumber(GetBuildInfo():match('^%d+'))

local Hider
function ns.hide(obj)
    if not Hider then
        Hider = CreateFrame('Frame')
        Hider:Hide()
    end
    if not obj then
        -- @debug@
        error('Invalid obj', 2)
        -- @end-debug@
        return
    end
    obj:Hide()
    obj:SetParent(Hider)
end

function ns.point(obj, ...)
    if not obj then
        -- @debug@
        error('Invalid obj', 2)
        -- @end-debug@
        return
    end
    obj:ClearAllPoints()
    obj:SetPoint(...)
end

function ns.rgb(r, g, b)
    if b then
        return r, g, b
    elseif r.r then
        return r.r, r.g, r.b
    else
        return unpack(r)
    end
end

-- local COPPER_AMOUNT_TEXTURE = '%d |TInterface\\MoneyFrame\\UI-CopperIcon:20:20:-20:0|t'
-- local SILVER_AMOUNT_TEXTURE = '%d |TInterface\\MoneyFrame\\UI-SilverIcon:20:20:-20:0|t'
-- local GOLD_AMOUNT_TEXTURE = '%d |TInterface\\MoneyFrame\\UI-GoldIcon:20:20:-20:0|t'

function ns.gsc(money)
    money = floor(money)
    local text = ''
    if (money % 100 > 0) and (money < 10000) or (money == 0) then
        text = COPPER_AMOUNT_TEXTURE:format(money % 100, 0, 0)
    end
    money = floor(money / 100)
    if (money % 100 > 0) and (money < 100000) then
        text = SILVER_AMOUNT_TEXTURE:format(money % 100) .. ' ' .. text
    end
    money = floor(money / 100)
    if (money > 0) then
        text = GOLD_AMOUNT_TEXTURE:format(money, 0, 0) .. ' ' .. text
    end
    return text:trim()
end

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
    local itemId, enchantId, suffixId, uniqueId = link:match(
                                                      'item:(%d*):(%-?%d*):%-?%d*:%-?%d*:%-?%d*:%-?%d*:(%-?%d*):(%-?%d*)')
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
    -- 埃索达
    [16707] = true,
    [18348] = true,
    [18349] = true,
    -- 银月城
    [16627] = true,
    [16628] = true,
    [16629] = true,
    [17627] = true,
    [17628] = true,
    [17629] = true,
    [18761] = true,
    -- 达拉然
    [35594] = true,
    [35607] = true,
}

local function NpcId()
    local guid = UnitGUID('npc')
    return guid and tonumber(guid:match('.-%-%d+%-%d+%-%d+%-%d+%-(%d+)'))
end

function ns.IsValidNpc()
    local npcId = NpcId()
    return npcId and VALID_NPCS[npcId]
end

function ns.ParamsEqual(a, b)
    if not a or not b then
        return false
    end

    return a.text == b.text and a.minLevel == b.minLevel and a.maxLevel == b.maxLevel and a.filters == b.filters and
               a.usable == b.usable and a.quality == b.quality and a.exact == b.exact
end

ns.ITEM_QUALITY_DESCS = {}
do
    for quality = Enum.ItemQuality.Poor, Enum.ItemQuality.Heirloom do
        local r, g, b = GetItemQualityColor(quality)
        ns.ITEM_QUALITY_DESCS[quality] = format('|cff%02x%02x%02x%s|r', r * 255, g * 255, b * 255,
                                                _G['ITEM_QUALITY' .. quality .. '_DESC'])
    end
end

function ns.GetDisenchantPossibles(equipLoc, quality, itemLevel)
    local key = ns.DISENCHANT_KEYS[equipLoc]
    if not key then
        return
    end
    local classData = ns.DISENCHANT_POSSIBLES[key]
    if not classData then
        return
    end
    local qualityData = classData[quality]
    if not qualityData then
        return
    end

    for _, info in ipairs(qualityData) do
        if not info.level or itemLevel <= info.level then
            return info.possibles
        end
    end
end

function ns.GetDisenchantPrice(equipLoc, quality, itemLevel)
    if not itemLevel or itemLevel == 0 then
        return
    end

    local possibles = ns.GetDisenchantPossibles(equipLoc, quality, itemLevel)
    if not possibles then
        return
    end

    local total = 0
    for _, v in ipairs(possibles) do
        local count = (v.min + v.max) / 2
        local price = ns.prices[v.id .. ':0']
        if not price then
            return
        end

        total = total + price * count * v.rate
    end
    return total
end

function ns.SetSort(column, order)
    SortAuctionClearSort('list')

    for _, row in ipairs(AuctionSort['list_' .. column]) do
        local sort = row.column
        if order then
            SortAuctionSetSort('list', sort, not row.reverse)
        else
            SortAuctionSetSort('list', sort, row.reverse)
        end
    end
end

local function CheckMoney(editBox)
    local value = editBox:GetNumber()
    if value == 0 then
        editBox:SetText('')
        return true
    end
end

function ns.SetMoneyFrame(moneyFrame, money)
    MoneyInputFrame_SetCopper(moneyFrame, floor(money))

    local name = moneyFrame:GetName()
    return CheckMoney(_G[name .. 'Gold']) and CheckMoney(_G[name .. 'Silver']) and CheckMoney(_G[name .. 'Copper'])
end

function ns.GetPriceInfo(key)
    local a, b = ns.rawPrices[key], ns.otherAccountPrices[key]
    local r
    if a and b then
        r = a[2] > b[2] and a or b
    elseif a then
        r = a
    elseif b then
        r = b
    end
    if r then
        return r[1], r[2]
    end
end

if ns.BUILD >= 2 then
    ns.SELL_HOURS = {[1] = AUCTION_DURATION_ONE, [2] = AUCTION_DURATION_TWO, [3] = AUCTION_DURATION_THREE}
elseif ns.BUILD == 1 then
    ns.SELL_HOURS = {[1] = '2' .. HOURS, [2] = '8' .. HOURS, [3] = '24' .. HOURS}
else
    assert(false, 'Unknown build: %s', ns.BUILD)
end

ns.ZH = (GetLocale() == 'zhCN' or GetLocale() == 'zhTW')
ns.NARROW_FILTER = ns.ZH and not ElvUI
