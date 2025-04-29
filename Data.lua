-- Data.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 9/23/2020, 1:01:44 PM
--
---@class ns
local ns = select(2, ...)

ns.DISENCHANT_KEYS = {}
ns.DISENCHANT_POSSIBLES = {}

local Good = Enum.ItemQuality.Good or Enum.ItemQuality.Uncommon
local Rare = Enum.ItemQuality.Superior or Enum.ItemQuality.Rare
local Epic = Enum.ItemQuality.Epic

local Armor = 'Armor'
local Weapon = 'Weapon'

local function inv(build, invType, type)
    if ns.BUILD < build then
        return
    end
    ns.DISENCHANT_KEYS[invType] = type
end

local function dis(build, type, quality, level, ...)
    if ns.BUILD < build then
        return
    end
    ns.DISENCHANT_POSSIBLES[type] = ns.DISENCHANT_POSSIBLES[type] or {}
    ns.DISENCHANT_POSSIBLES[type][quality] = ns.DISENCHANT_POSSIBLES[type][quality] or {}

    table.insert(ns.DISENCHANT_POSSIBLES[type][quality], {level = level, possibles = {...}})
end

local function possible(min, max, rate, id)
    return {min = min, max = max, rate = rate, id = id}
end

inv(1, 'INVTYPE_HEAD', Armor)
inv(1, 'INVTYPE_NECK', Armor)
inv(1, 'INVTYPE_SHOULDER', Armor)
inv(1, 'INVTYPE_BODY', Armor)
inv(1, 'INVTYPE_CHEST', Armor)
inv(1, 'INVTYPE_ROBE', Armor)
inv(1, 'INVTYPE_WAIST', Armor)
inv(1, 'INVTYPE_LEGS', Armor)
inv(1, 'INVTYPE_FEET', Armor)
inv(1, 'INVTYPE_WRIST', Armor)
inv(1, 'INVTYPE_HAND', Armor)
inv(1, 'INVTYPE_FINGER', Armor)
inv(1, 'INVTYPE_TRINKET', Armor)
inv(1, 'INVTYPE_CLOAK', Armor)
inv(1, 'INVTYPE_HOLDABLE', Armor)
inv(1, 'INVTYPE_SHIELD', Armor)

inv(1, 'INVTYPE_2HWEAPON', Weapon)
inv(1, 'INVTYPE_WEAPON', Weapon)
inv(1, 'INVTYPE_WEAPONMAINHAND', Weapon)
inv(1, 'INVTYPE_WEAPONOFFHAND', Weapon)
inv(1, 'INVTYPE_RANGED', Weapon)
inv(1, 'INVTYPE_RANGEDRIGHT', Weapon)
inv(2, 'INVTYPE_THROWN', Weapon)

dis(1, Weapon, Good, 15, possible(1, 2, 0.800, 10938), possible(1, 2, 0.200, 10940))
dis(1, Weapon, Good, 20, possible(1, 2, 0.750, 10939), possible(2, 3, 0.200, 10940), possible(1, 1, 0.050, 10978))
dis(1, Weapon, Good, 25, possible(1, 2, 0.750, 10998), possible(4, 6, 0.150, 10940), possible(1, 1, 0.100, 10978))
dis(1, Weapon, Good, 30, possible(1, 2, 0.750, 11082), possible(1, 2, 0.200, 11083), possible(1, 1, 0.050, 11084))
dis(1, Weapon, Good, 35, possible(1, 2, 0.750, 11134), possible(2, 5, 0.200, 11083), possible(1, 1, 0.050, 11138))
dis(1, Weapon, Good, 40, possible(1, 2, 0.750, 11135), possible(1, 2, 0.200, 11137), possible(1, 1, 0.050, 11139))
dis(1, Weapon, Good, 45, possible(1, 2, 0.750, 11174), possible(2, 5, 0.200, 11137), possible(1, 1, 0.050, 11177))
dis(1, Weapon, Good, 50, possible(1, 2, 0.750, 11175), possible(1, 2, 0.200, 11176), possible(1, 1, 0.050, 11178))
dis(1, Weapon, Good, 55, possible(1, 2, 0.750, 16202), possible(2, 5, 0.220, 11176), possible(1, 1, 0.030, 14343))
dis(1, Weapon, Good, 60, possible(1, 2, 0.750, 16203), possible(1, 2, 0.220, 16204), possible(1, 1, 0.030, 14344))
dis(1, Weapon, Good, 65, possible(2, 3, 0.750, 16203), possible(2, 5, 0.220, 16204), possible(1, 1, 0.030, 14344))
dis(2, Weapon, Good, 79, possible(1, 3, 0.750, 22447), possible(1, 3, 0.220, 22445), possible(1, 1, 0.030, 22448))
dis(2, Weapon, Good, 99, possible(2, 3, 0.750, 22447), possible(2, 3, 0.220, 22445), possible(1, 1, 0.030, 22448))
dis(2, Weapon, Good, 120, possible(1, 2, 0.750, 22446), possible(2, 5, 0.220, 22445), possible(1, 1, 0.030, 22449))
dis(3, Weapon, Good, 151, possible(1, 2, 0.750, 34056), possible(1, 3, 0.220, 34054), possible(1, 1, 0.030, 34053))
dis(3, Weapon, Good, 187, possible(1, 2, 0.750, 34055), possible(4, 7, 0.220, 34054), possible(1, 1, 0.030, 34052))

dis(1, Weapon, Rare, 25, possible(1, 1, 1.000, 10978))
dis(1, Weapon, Rare, 30, possible(1, 1, 1.000, 11084))
dis(1, Weapon, Rare, 35, possible(1, 1, 1.000, 11138))
dis(1, Weapon, Rare, 40, possible(1, 1, 1.000, 11139))
dis(1, Weapon, Rare, 45, possible(1, 1, 1.000, 11177))
dis(1, Weapon, Rare, 50, possible(1, 1, 1.000, 11178))
dis(1, Weapon, Rare, 55, possible(1, 1, 1.000, 14343))
dis(1, Weapon, Rare, 65, possible(1, 1, 0.995, 14344), possible(1, 1, 0.005, 20725))
dis(2, Weapon, Rare, 99, possible(1, 1, 0.995, 22448), possible(1, 1, 0.005, 20725))
dis(2, Weapon, Rare, 120, possible(1, 1, 0.995, 22449), possible(1, 1, 0.005, 22450))
dis(3, Weapon, Rare, 164, possible(1, 1, 0.995, 34053), possible(1, 1, 0.005, 34057))
dis(3, Weapon, Rare, 200, possible(1, 1, 0.995, 34052), possible(1, 1, 0.005, 34057))

dis(1, Weapon, Epic, 45, possible(2, 4, 1.000, 11177))
dis(1, Weapon, Epic, 50, possible(2, 4, 1.000, 11178))
dis(1, Weapon, Epic, 55, possible(2, 4, 1.000, 14343))
dis(1, Weapon, Epic, 60, possible(1, 1, 1.000, 20725))
dis(1, Weapon, Epic, 94, possible(2, 2, 0.667, 20725), possible(1, 1, 0.333, 20725))
dis(2, Weapon, Epic, 104, possible(1, 2, 1.000, 22450))
dis(2, Weapon, Epic, 164, possible(2, 2, 0.667, 22450), possible(1, 1, 0.333, 22450))
dis(3, Weapon, Epic, 284, possible(1, 1, 1.000, 34057))

dis(1, Armor, Good, 15, possible(1, 2, 0.800, 10940), possible(1, 2, 0.200, 10938))
dis(1, Armor, Good, 20, possible(2, 3, 0.750, 10940), possible(1, 2, 0.200, 10939), possible(1, 1, 0.050, 10978))
dis(1, Armor, Good, 25, possible(4, 6, 0.750, 10940), possible(1, 2, 0.150, 10998), possible(1, 1, 0.100, 10978))
dis(1, Armor, Good, 30, possible(1, 2, 0.750, 11083), possible(1, 2, 0.200, 11082), possible(1, 1, 0.050, 11084))
dis(1, Armor, Good, 35, possible(2, 5, 0.750, 11083), possible(1, 2, 0.200, 11134), possible(1, 1, 0.050, 11138))
dis(1, Armor, Good, 40, possible(1, 2, 0.750, 11137), possible(1, 2, 0.200, 11135), possible(1, 1, 0.050, 11139))
dis(1, Armor, Good, 45, possible(2, 5, 0.750, 11137), possible(1, 2, 0.200, 11174), possible(1, 1, 0.050, 11177))
dis(1, Armor, Good, 50, possible(1, 2, 0.750, 11176), possible(1, 2, 0.200, 11175), possible(1, 1, 0.050, 11178))
dis(1, Armor, Good, 55, possible(2, 5, 0.750, 11176), possible(1, 2, 0.200, 16202), possible(1, 1, 0.050, 14343))
dis(1, Armor, Good, 60, possible(1, 2, 0.750, 16204), possible(1, 2, 0.200, 16203), possible(1, 1, 0.050, 14344))
dis(1, Armor, Good, 65, possible(2, 5, 0.750, 16204), possible(2, 3, 0.200, 16203), possible(1, 1, 0.050, 14344))
dis(2, Armor, Good, 79, possible(1, 3, 0.750, 22445), possible(1, 3, 0.220, 22447), possible(1, 1, 0.030, 22448))
dis(2, Armor, Good, 99, possible(2, 3, 0.750, 22445), possible(2, 3, 0.220, 22447), possible(1, 1, 0.030, 22448))
dis(2, Armor, Good, 120, possible(2, 5, 0.750, 22445), possible(1, 2, 0.220, 22446), possible(1, 1, 0.030, 22449))
dis(3, Armor, Good, 151, possible(1, 3, 0.750, 34054), possible(1, 2, 0.220, 34056), possible(1, 1, 0.030, 34053))
dis(3, Armor, Good, 187, possible(4, 7, 0.750, 34054), possible(1, 2, 0.220, 34055), possible(1, 1, 0.030, 34052))

dis(1, Armor, Rare, 25, possible(1, 1, 1.000, 10978))
dis(1, Armor, Rare, 30, possible(1, 1, 1.000, 11084))
dis(1, Armor, Rare, 35, possible(1, 1, 1.000, 11138))
dis(1, Armor, Rare, 40, possible(1, 1, 1.000, 11139))
dis(1, Armor, Rare, 45, possible(1, 1, 1.000, 11177))
dis(1, Armor, Rare, 50, possible(1, 1, 1.000, 11178))
dis(1, Armor, Rare, 55, possible(1, 1, 1.000, 14343))
dis(1, Armor, Rare, 65, possible(1, 1, 0.995, 14344), possible(1, 1, 0.005, 20725))
dis(2, Armor, Rare, 99, possible(1, 1, 0.995, 22448), possible(1, 1, 0.005, 20725))
dis(2, Armor, Rare, 120, possible(1, 1, 0.995, 22449), possible(1, 1, 0.005, 22450))
dis(3, Armor, Rare, 164, possible(1, 1, 0.995, 34053), possible(1, 1, 0.005, 34057))
dis(3, Armor, Rare, 200, possible(1, 1, 0.995, 34052), possible(1, 1, 0.005, 34057))

dis(1, Armor, Epic, 45, possible(2, 4, 1.000, 11177))
dis(1, Armor, Epic, 50, possible(2, 4, 1.000, 11178))
dis(1, Armor, Epic, 55, possible(2, 4, 1.000, 14343))
dis(1, Armor, Epic, 60, possible(1, 1, 1.000, 20725))
dis(1, Armor, Epic, 94, possible(1, 2, 1.000, 20725))
dis(2, Armor, Epic, 100, possible(1, 2, 1.000, 22450))
dis(2, Armor, Epic, 164, possible(2, 2, 0.667, 22450), possible(1, 1, 0.333, 22450))
dis(3, Armor, Epic, 284, possible(1, 1, 1.000, 34057))
