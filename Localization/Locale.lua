-- Locale.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 4/16/2024, 5:37:35 PM
--
local ADDON = ...
local function A(l, f)
    local L = LibStub('AceLocale-3.0'):NewLocale(ADDON, l)
    if L then
        f(L)
    end
end

A('deDE', function(L)
    -- @locale:language=deDE@
    -- @end-locale@
end)

A('esES', function(L)
    -- @locale:language=esES@
    -- @end-locale@
end)

A('frFR', function(L)
    -- @locale:language=frFR@
    -- @end-locale@
end)

A('itIT', function(L)
    -- @locale:language=itIT@
    -- @end-locale@
end)

A('koKR', function(L)
    -- @locale:language=koKR@
    -- @end-locale@
end)

A('ptBR', function(L)
    -- @locale:language=ptBR@
    -- @end-locale@
end)

A('ruRU', function(L)
    -- @locale:language=ruRU@
    -- @end-locale@
end)

A('zhTW', function(L)
    -- @locale:language=zhTW@
    -- @end-locale@
end)
