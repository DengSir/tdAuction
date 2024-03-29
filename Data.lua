-- Data.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 9/23/2020, 1:01:44 PM
--
---@class ns
local ns = select(2, ...)

ns.DISENCHANT_KEYS = {
    INVTYPE_HEAD = 'Armor',
    INVTYPE_NECK = 'Armor',
    INVTYPE_SHOULDER = 'Armor',
    INVTYPE_BODY = 'Armor',
    INVTYPE_CHEST = 'Armor',
    INVTYPE_ROBE = 'Armor',
    INVTYPE_WAIST = 'Armor',
    INVTYPE_LEGS = 'Armor',
    INVTYPE_FEET = 'Armor',
    INVTYPE_WRIST = 'Armor',
    INVTYPE_HAND = 'Armor',
    INVTYPE_FINGER = 'Armor',
    INVTYPE_TRINKET = 'Armor',
    INVTYPE_CLOAK = 'Armor',
    INVTYPE_HOLDABLE = 'Armor',
    INVTYPE_SHIELD = 'Armor',

    INVTYPE_2HWEAPON = 'Weapon',
    INVTYPE_WEAPONMAINHAND = 'Weapon',
    INVTYPE_WEAPON = 'Weapon',
    INVTYPE_WEAPONOFFHAND = 'Weapon',
    INVTYPE_RANGED = 'Weapon',
    INVTYPE_RANGEDRIGHT = 'Weapon',
    -- @build>2@
    INVTYPE_THROWN = 'Weapon',
    -- @end-build>2@
}

ns.DISENCHANT_POSSIBLES = {
    Weapon = {
        [Enum.ItemQuality.Good or Enum.ItemQuality.Uncommon] = {
            {
                possibles = { --
                    {min = 1, max = 2, rate = 0.8, id = 10938},
                    {min = 1, max = 2, rate = 0.2, id = 10940},
                },
                level = 15,
            },
            {
                possibles = {
                    {min = 1, max = 2, rate = 0.75, id = 10939},
                    {min = 2, max = 3, rate = 0.2, id = 10940},
                    {min = 1, max = 1, rate = 0.05, id = 10978},
                },
                level = 20,
            },
            {
                possibles = {
                    {min = 1, max = 2, rate = 0.75, id = 10998},
                    {min = 4, max = 6, rate = 0.15, id = 10940},
                    {min = 1, max = 1, rate = 0.1, id = 10978},
                },
                level = 25,
            },
            {
                possibles = {
                    {min = 1, max = 2, rate = 0.75, id = 11082},
                    {min = 1, max = 2, rate = 0.2, id = 11083},
                    {min = 1, max = 1, rate = 0.05, id = 11084},
                },
                level = 30,
            },
            {
                possibles = {
                    {min = 1, max = 2, rate = 0.75, id = 11134},
                    {min = 2, max = 5, rate = 0.2, id = 11083},
                    {min = 1, max = 1, rate = 0.05, id = 11138},
                },
                level = 35,
            },
            {
                possibles = {
                    {min = 1, max = 2, rate = 0.75, id = 11135},
                    {min = 1, max = 2, rate = 0.2, id = 11137},
                    {min = 1, max = 1, rate = 0.05, id = 11139},
                },
                level = 40,
            },
            {
                possibles = {
                    {min = 1, max = 2, rate = 0.75, id = 11174},
                    {min = 2, max = 5, rate = 0.2, id = 11137},
                    {min = 1, max = 1, rate = 0.05, id = 11177},
                },
                level = 45,
            },
            {
                possibles = {
                    {min = 1, max = 2, rate = 0.75, id = 11175},
                    {min = 1, max = 2, rate = 0.2, id = 11176},
                    {min = 1, max = 1, rate = 0.05, id = 11178},
                },
                level = 50,
            },
            {
                possibles = {
                    {min = 1, max = 2, rate = 0.75, id = 16202},
                    {min = 2, max = 5, rate = 0.22, id = 11176},
                    {min = 1, max = 1, rate = 0.03, id = 14343},
                },
                level = 55,
            },
            {
                possibles = {
                    {min = 1, max = 2, rate = 0.75, id = 16203},
                    {min = 1, max = 2, rate = 0.22, id = 16204},
                    {min = 1, max = 1, rate = 0.03, id = 14344},
                },
                level = 60,
            },
            {
                possibles = {
                    {min = 2, max = 3, rate = 0.75, id = 16203},
                    {min = 2, max = 5, rate = 0.22, id = 16204},
                    {min = 1, max = 1, rate = 0.03, id = 14344},
                },
                -- @build>2@
                level = 65,
            },
            {
                possibles = {
                    {min = 1, max = 3, rate = 0.75, id = 22447},
                    {min = 1, max = 3, rate = 0.22, id = 22445},
                    {min = 1, max = 1, rate = 0.03, id = 22448},
                },
                level = 79,
            },
            {
                possibles = {
                    {min = 2, max = 3, rate = 0.75, id = 22447},
                    {min = 2, max = 3, rate = 0.22, id = 22445},
                    {min = 1, max = 1, rate = 0.03, id = 22448},
                },
                level = 99,
            },
            {
                possibles = {
                    {min = 1, max = 2, rate = 0.75, id = 22446},
                    {min = 2, max = 5, rate = 0.22, id = 22445},
                    {min = 1, max = 1, rate = 0.03, id = 22449},
                },
                -- @end-build>2@
                -- @build>3@
                level = 120,
            },
            {
                possibles = {
                    {min = 1, max = 2, rate = 0.75, id = 34056},
                    {min = 1, max = 3, rate = 0.22, id = 34054},
                    {min = 1, max = 1, rate = 0.03, id = 34053},
                },
                level = 151,
            },
            {
                possibles = {
                    {min = 1, max = 2, rate = 0.75, id = 34055},
                    {min = 4, max = 7, rate = 0.22, id = 34054},
                    {min = 1, max = 1, rate = 0.03, id = 34052},
                },
                -- @end-build>3@
            },
        },
        [Enum.ItemQuality.Superior or Enum.ItemQuality.Rare] = {
            {possibles = {{min = 1, max = 1, rate = 1, id = 10978}}, level = 25},
            {possibles = {{min = 1, max = 1, rate = 1, id = 11084}}, level = 30},
            {possibles = {{min = 1, max = 1, rate = 1, id = 11138}}, level = 35},
            {possibles = {{min = 1, max = 1, rate = 1, id = 11139}}, level = 40},
            {possibles = {{min = 1, max = 1, rate = 1, id = 11177}}, level = 45},
            {possibles = {{min = 1, max = 1, rate = 1, id = 11178}}, level = 50},
            {possibles = {{min = 1, max = 1, rate = 1, id = 14343}}, level = 55},
            {
                possibles = { --
                    {min = 1, max = 1, rate = 0.995, id = 14344},
                    {min = 1, max = 1, rate = 0.005, id = 20725},
                },
                -- @build>2@
                level = 65,
            },
            {
                possibles = { --
                    {min = 1, max = 1, rate = 0.995, id = 22448},
                    {min = 1, max = 1, rate = 0.005, id = 20725},
                },
                level = 99,
            },
            {
                possibles = { --
                    {min = 1, max = 1, rate = 0.995, id = 22449},
                    {min = 1, max = 1, rate = 0.005, id = 22450},
                },
                -- @end-build>2@
                -- @build>3@
                level = 120,
            },
            {
                possibles = { --
                    {min = 1, max = 1, rate = 0.995, id = 34053},
                    {min = 1, max = 1, rate = 0.005, id = 34057},
                },
                level = 164,
            },
            {
                possibles = { --
                    {min = 1, max = 1, rate = 0.995, id = 34052},
                    {min = 1, max = 1, rate = 0.005, id = 34057},
                },
                -- @end-build>3@
            },
        },
        [Enum.ItemQuality.Epic] = {
            {possibles = {{min = 2, max = 4, rate = 1, id = 11177}}, level = 45},
            {possibles = {{min = 2, max = 4, rate = 1, id = 11178}}, level = 50},
            {possibles = {{min = 2, max = 4, rate = 1, id = 14343}}, level = 55},
            {possibles = {{min = 1, max = 1, rate = 1, id = 20725}}, level = 60},
            {
                possibles = { --
                    {min = 2, max = 2, rate = 0.667, id = 20725},
                    {min = 1, max = 1, rate = 0.333, id = 20725},
                },
                -- @build>2@
                level = 94,
            },
            {
                possibles = { --
                    {min = 1, max = 2, rate = 1, id = 22450},
                },
                level = 104,
            },
            {
                possibles = { --
                    {min = 2, max = 2, rate = 0.667, id = 22450},
                    {min = 1, max = 1, rate = 0.333, id = 22450},
                },
                -- @end-build>2@
                -- @build>3@
                level = 164,
            },
            { --
                possibles = {{min = 1, max = 1, rate = 1, id = 34057}},
                -- @end-build>3@
            },
        },
    },
    Armor = {
        [Enum.ItemQuality.Good or Enum.ItemQuality.Uncommon] = {
            {
                possibles = { --
                    {min = 1, max = 2, rate = 0.8, id = 10940},
                    {min = 1, max = 2, rate = 0.2, id = 10938},
                },
                level = 15,
            },
            {
                possibles = {
                    {min = 2, max = 3, rate = 0.75, id = 10940},
                    {min = 1, max = 2, rate = 0.2, id = 10939},
                    {min = 1, max = 1, rate = 0.05, id = 10978},
                },
                level = 20,
            },
            {
                possibles = {
                    {min = 4, max = 6, rate = 0.75, id = 10940},
                    {min = 1, max = 2, rate = 0.15, id = 10998},
                    {min = 1, max = 1, rate = 0.1, id = 10978},
                },
                level = 25,
            },
            {
                possibles = {
                    {min = 1, max = 2, rate = 0.75, id = 11083},
                    {min = 1, max = 2, rate = 0.2, id = 11082},
                    {min = 1, max = 1, rate = 0.05, id = 11084},
                },
                level = 30,
            },
            {
                possibles = {
                    {min = 2, max = 5, rate = 0.75, id = 11083},
                    {min = 1, max = 2, rate = 0.2, id = 11134},
                    {min = 1, max = 1, rate = 0.05, id = 11138},
                },
                level = 35,
            },
            {
                possibles = {
                    {min = 1, max = 2, rate = 0.75, id = 11137},
                    {min = 1, max = 2, rate = 0.2, id = 11135},
                    {min = 1, max = 1, rate = 0.05, id = 11139},
                },
                level = 40,
            },
            {
                possibles = {
                    {min = 2, max = 5, rate = 0.75, id = 11137},
                    {min = 1, max = 2, rate = 0.2, id = 11174},
                    {min = 1, max = 1, rate = 0.05, id = 11177},
                },
                level = 45,
            },
            {
                possibles = {
                    {min = 1, max = 2, rate = 0.75, id = 11176},
                    {min = 1, max = 2, rate = 0.2, id = 11175},
                    {min = 1, max = 1, rate = 0.05, id = 11178},
                },
                level = 50,
            },
            {
                possibles = {
                    {min = 2, max = 5, rate = 0.75, id = 11176},
                    {min = 1, max = 2, rate = 0.2, id = 16202},
                    {min = 1, max = 1, rate = 0.05, id = 14343},
                },
                level = 55,
            },
            {
                possibles = {
                    {min = 1, max = 2, rate = 0.75, id = 16204},
                    {min = 1, max = 2, rate = 0.2, id = 16203},
                    {min = 1, max = 1, rate = 0.05, id = 14344},
                },
                level = 60,
            },
            {
                possibles = {
                    {min = 2, max = 5, rate = 0.75, id = 16204},
                    {min = 2, max = 3, rate = 0.2, id = 16203},
                    {min = 1, max = 1, rate = 0.05, id = 14344},
                },
                -- @build>2@
                level = 65,
            },
            {
                possibles = {
                    {min = 1, max = 3, rate = 0.75, id = 22445},
                    {min = 1, max = 3, rate = 0.22, id = 22447},
                    {min = 1, max = 1, rate = 0.03, id = 22448},
                },
                level = 79,
            },
            {
                possibles = {
                    {min = 2, max = 3, rate = 0.75, id = 22445},
                    {min = 2, max = 3, rate = 0.22, id = 22447},
                    {min = 1, max = 1, rate = 0.03, id = 22448},
                },
                level = 99,
            },
            {
                possibles = {
                    {min = 2, max = 5, rate = 0.75, id = 22445},
                    {min = 1, max = 2, rate = 0.22, id = 22446},
                    {min = 1, max = 1, rate = 0.03, id = 22449},
                },
                -- @end-build>2@
                -- @build>3@
                level = 120,
            },
            {
                possibles = {
                    {min = 1, max = 3, rate = 0.75, id = 34054},
                    {min = 1, max = 2, rate = 0.22, id = 34056},
                    {min = 1, max = 1, rate = 0.03, id = 34053},
                },
                level = 151,
            },
            {
                possibles = {
                    {min = 4, max = 7, rate = 0.75, id = 34054},
                    {min = 1, max = 2, rate = 0.22, id = 34055},
                    {min = 1, max = 1, rate = 0.03, id = 34052},
                },
                -- @end-build>3@
            },
        },
        [Enum.ItemQuality.Superior or Enum.ItemQuality.Rare] = {
            {possibles = {{min = 1, max = 1, rate = 1, id = 10978}}, level = 25},
            {possibles = {{min = 1, max = 1, rate = 1, id = 11084}}, level = 30},
            {possibles = {{min = 1, max = 1, rate = 1, id = 11138}}, level = 35},
            {possibles = {{min = 1, max = 1, rate = 1, id = 11139}}, level = 40},
            {possibles = {{min = 1, max = 1, rate = 1, id = 11177}}, level = 45},
            {possibles = {{min = 1, max = 1, rate = 1, id = 11178}}, level = 50},
            {possibles = {{min = 1, max = 1, rate = 1, id = 14343}}, level = 55},
            {
                possibles = { --
                    {min = 1, max = 1, rate = 0.995, id = 14344},
                    {min = 1, max = 1, rate = 0.005, id = 20725},
                },
                -- @build>2@
                level = 65,
            },
            {
                possibles = { --
                    {min = 1, max = 1, rate = 0.995, id = 22448},
                    {min = 1, max = 1, rate = 0.005, id = 20725},
                },
                level = 99,
            },
            {
                possibles = { --
                    {min = 1, max = 1, rate = 0.995, id = 22449},
                    {min = 1, max = 1, rate = 0.005, id = 22450},
                },
                -- @end-build>2@
                -- @build>3@
                level = 120,
            },
            {
                possibles = { --
                    {min = 1, max = 1, rate = 0.995, id = 34053},
                    {min = 1, max = 1, rate = 0.005, id = 34057},
                },
                level = 164,
            },
            {
                possibles = { --
                    {min = 1, max = 1, rate = 0.995, id = 34052},
                    {min = 1, max = 1, rate = 0.005, id = 34057},
                },
                -- @end-build>3@
            },
        },
        [Enum.ItemQuality.Epic] = {
            {possibles = {{min = 2, max = 4, rate = 1, id = 11177}}, level = 45},
            {possibles = {{min = 2, max = 4, rate = 1, id = 11178}}, level = 50},
            {possibles = {{min = 2, max = 4, rate = 1, id = 14343}}, level = 55},
            {possibles = {{min = 1, max = 1, rate = 1, id = 20725}}, level = 60},
            {
                possibles = { --
                    {min = 1, max = 2, rate = 1, id = 20725},
                },
                -- @build>2@
                level = 94,
            },
            {
                possibles = { --
                    {min = 1, max = 2, rate = 1, id = 22450},
                },
                level = 100,
            },
            {
                possibles = { --
                    {min = 2, max = 2, rate = 0.667, id = 22450},
                    {min = 1, max = 1, rate = 0.333, id = 22450},
                },
                -- @end-build>2@
                -- @build>3@
                level = 164,
            },
            {
                possibles = { --
                    {min = 1, max = 1, rate = 1, id = 34057},
                },
                level = 280,
                -- @end-build>3@
            },
        },
    },
}
