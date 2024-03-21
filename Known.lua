-- Known.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 3/21/2024, 3:38:09 PM
--
-- @class ns
local ns = select(2, ...)
local TipScaner = ns.TipScaner

local GARRISON_ICONS = {[1001489] = true, [1001490] = true, [1001491] = true}

local function IsKnown(id)
    TipScaner:Clear()
    TipScaner:SetItemByID(id)

    for i = 1, TipScaner:NumLines() do
        local font = TipScaner:GetFontStringLeft(i)
        if not font then
            return
        end
        local text = font:GetText()
        if text and text == ITEM_SPELL_KNOWN then
            return true
        end
    end
end

local function HasHeirloom(id)
    return C_Heirloom and C_Heirloom.IsItemHeirloom(id) and C_Heirloom.PlayerHasHeirloom(id)
end

local function IsKnownable(id)
    if not id then
        return
    end
    if C_Heirloom and C_Heirloom.IsItemHeirloom(id) then
        return true
    end

    local _, _, _, _, icon, classId, subClassId = GetItemInfoInstant(id)
    if GARRISON_ICONS[icon] then
        return true
    end

    if classId == LE_ITEM_CLASS_MISCELLANEOUS then
        -- @build<3@
        if subClassId == LE_ITEM_MISCELLANEOUS_MOUNT then
            return true
        end
        -- @end-build<3@
        if C_ToyBox and select(2, C_ToyBox.GetToyInfo(id)) then
            return true
        end
    elseif classId == LE_ITEM_CLASS_RECIPE then
        return true
    end
end

local known = setmetatable({}, {
    __index = function(t, id)
        if HasHeirloom(id) or IsKnown(id) then
            t[id] = true
            return true
        end
    end,
})

function ns.IsKnown(id)
    if IsKnownable(id) then
        return known[id]
    end
end
