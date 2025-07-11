-- Locale.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 4/17/2024, 3:33:47 PM
--
local A = ...
local function T(l, f)
    local o = LibStub('AceLocale-3.0'):NewLocale(A, l)
    if o then f(o) end
end

T('deDE', function(L)
-- @locale:language=deDE@
L = L or {}
--[[Translation missing --]]
--[[ L["1 Year"] = "1 Year"--]] 
--[[Translation missing --]]
--[[ L["180 Days"] = "180 Days"--]] 
--[[Translation missing --]]
--[[ L["30 Days"] = "30 Days"--]] 
--[[Translation missing --]]
--[[ L["7 Days"] = "7 Days"--]] 
--[[Translation missing --]]
--[[ L["90 Days"] = "90 Days"--]] 
L["Always"] = "Immer"
L["Auction price"] = "Auktionspreis"
--[[Translation missing --]]
--[[ L["Auction price time style"] = "Auction price time style"--]] 
--[[Translation missing --]]
--[[ L["Auto clean database"] = "Auto clean database"--]] 
L["Auto open price list"] = "Preisliste automatisch öffnen"
L["Bid price"] = "Gebot"
--[[Translation missing --]]
--[[ L["Bid unit price"] = "Bid unit price"--]] 
L["Choose other price"] = "Anderen Preis wählen"
L["Clear database"] = "Datenbank leeren"
L["Count"] = "Anzahl"
L["Database"] = "Datenbank"
--[[Translation missing --]]
--[[ L["Date"] = "Date"--]] 
L["Default auction duration"] = "Standardwert für Auktionslänge"
L["Default stack size"] = "Standardtwert für Stapelgröße"
L["Disenchant price"] = "Entzauberungspreis"
--[[Translation missing --]]
--[[ L["Duration no deposit"] = "Duration no deposit"--]] 
L["Enable ALT to sell"] = "Aktiviere ALT zum verkaufen"
L["Enable ALT-CTRL click to buyout"] = "Aktiviere ALT-STRG zum kaufen"
--[[Translation missing --]]
--[[ L["Export"] = "Export"--]] 
--[[Translation missing --]]
--[[ L["EXPORT_HEADER"] = "\"Price\",\"Name\",\"\",\"\",\"Count\""--]] 
L["Full"] = "Voll"
L["Full scan"] = "Vollständiger Scan"
L["Full scaning, elapsed time: %s"] = "Vollständiger Scan, verstrichene Zeit: %s"
L["Ignore"] = "Ignorieren"
L["in about %s"] = "in etwa %s"
L["Merchant price"] = "Händlerpreis"
L["Nerver"] = "Niemals"
--[[Translation missing --]]
--[[ L["Never"] = "Never"--]] 
L["New"] = "Neu"
L["Next available time:"] = "Nächste verfügbare Zeit:"
L["No price"] = "Kein Preis"
L["Now"] = "Jetzt"
L["Pressed SHIFT"] = "Wenn SHIFT gedrückt"
L["Price"] = "Preis"
L["Processing data, elapsed time: %s"] = "Verarbeite Daten, verstrichene Zeit: %s"
L["Scan all"] = "Alles scannen"
L["Scan one page"] = "Eine Seite scannen"
L["Scan price mode"] = "Preisscan Modus"
L["Show disenchant info"] = "Zeige Entzauberungsinfo"
L["Single price"] = "Einzelpreis"
L["Start auction:"] = "Auktion starten:"
L["Start price discount"] = "Startpreis Rabatt"
L["Start scan"] = "Scan starten"
L["Time"] = "Zeit"
--[[Translation missing --]]
--[[ L["Time different"] = "Time different"--]] 
--[[Translation missing --]]
--[[ L["Toggle column"] = "Toggle column"--]] 
L["Tooltip"] = true
--[[Translation missing --]]
--[[ L["TOOLTIP_FULLSCAN_DISABLED"] = "An unknown NPC (%s), tdAuction cannot determine whether the auction house is neutral or not."--]] 
L["TOOLTIP_PREFIX_AUCTION"] = "Auktion"
L["TOOLTIP_PREFIX_DISENCHANT"] = "Entzaubern"
L["TOOLTIP_PREFIX_VENDO"] = "Händler"
L["Total price"] = "Gesamtpreis"
L["Unit price"] = "Stückpreis"
L["Unknown"] = "Unbekannt"
L["Update"] = "Aktualisieren"
L["Use history price"] = "Verwende historischen Preis"
L["Use merchant price x%d"] = "Verwende Händlerpreis x%d"
L["When no price, use merchant price multiply by"] = "Falls kein Preis verfügbar, verwende Händlerpreis multipliziert mit"
L["When pressed SHIFT, to dislay ..."] = "Wenn SHIFT gedrückt, zeige..."
L["You are sure to clear the database"] = "Bist du sicher, dass du die Datenbank leeren willst?"
-- @end-locale@
end)

T('esES', function(L)
-- @locale:language=esES@
L = L or {}
--[[Translation missing --]]
--[[ L["1 Year"] = "1 Year"--]] 
--[[Translation missing --]]
--[[ L["180 Days"] = "180 Days"--]] 
--[[Translation missing --]]
--[[ L["30 Days"] = "30 Days"--]] 
--[[Translation missing --]]
--[[ L["7 Days"] = "7 Days"--]] 
--[[Translation missing --]]
--[[ L["90 Days"] = "90 Days"--]] 
--[[Translation missing --]]
--[[ L["Always"] = "Always"--]] 
--[[Translation missing --]]
--[[ L["Auction price"] = "Auction price"--]] 
--[[Translation missing --]]
--[[ L["Auction price time style"] = "Auction price time style"--]] 
--[[Translation missing --]]
--[[ L["Auto clean database"] = "Auto clean database"--]] 
--[[Translation missing --]]
--[[ L["Auto open price list"] = "Auto open price list"--]] 
--[[Translation missing --]]
--[[ L["Bid price"] = "Bid price"--]] 
--[[Translation missing --]]
--[[ L["Bid unit price"] = "Bid unit price"--]] 
--[[Translation missing --]]
--[[ L["Choose other price"] = "Choose other price"--]] 
--[[Translation missing --]]
--[[ L["Clear database"] = "Clear database"--]] 
--[[Translation missing --]]
--[[ L["Count"] = "Count"--]] 
--[[Translation missing --]]
--[[ L["Database"] = "Database"--]] 
--[[Translation missing --]]
--[[ L["Date"] = "Date"--]] 
--[[Translation missing --]]
--[[ L["Default auction duration"] = "Default auction duration"--]] 
--[[Translation missing --]]
--[[ L["Default stack size"] = "Default stack size"--]] 
--[[Translation missing --]]
--[[ L["Disenchant price"] = "Disenchant price"--]] 
--[[Translation missing --]]
--[[ L["Duration no deposit"] = "Duration no deposit"--]] 
--[[Translation missing --]]
--[[ L["Enable ALT to sell"] = "Enable ALT to sell"--]] 
--[[Translation missing --]]
--[[ L["Enable ALT-CTRL click to buyout"] = "Enable ALT-CTRL click to buyout"--]] 
--[[Translation missing --]]
--[[ L["Export"] = "Export"--]] 
--[[Translation missing --]]
--[[ L["EXPORT_HEADER"] = "\"Price\",\"Name\",\"\",\"\",\"Count\""--]] 
--[[Translation missing --]]
--[[ L["Full"] = "Full"--]] 
--[[Translation missing --]]
--[[ L["Full scan"] = "Full scan"--]] 
--[[Translation missing --]]
--[[ L["Full scaning, elapsed time: %s"] = "Full scaning, elapsed time: %s"--]] 
--[[Translation missing --]]
--[[ L["Ignore"] = "Ignore"--]] 
--[[Translation missing --]]
--[[ L["in about %s"] = "in about %s"--]] 
--[[Translation missing --]]
--[[ L["Merchant price"] = "Merchant price"--]] 
--[[Translation missing --]]
--[[ L["Nerver"] = "Nerver"--]] 
--[[Translation missing --]]
--[[ L["Never"] = "Never"--]] 
--[[Translation missing --]]
--[[ L["New"] = "New"--]] 
--[[Translation missing --]]
--[[ L["Next available time:"] = "Next available time:"--]] 
--[[Translation missing --]]
--[[ L["No price"] = "No price"--]] 
--[[Translation missing --]]
--[[ L["Now"] = "Now"--]] 
--[[Translation missing --]]
--[[ L["Pressed SHIFT"] = "Pressed SHIFT"--]] 
--[[Translation missing --]]
--[[ L["Price"] = "Price"--]] 
--[[Translation missing --]]
--[[ L["Processing data, elapsed time: %s"] = "Processing data, elapsed time: %s"--]] 
--[[Translation missing --]]
--[[ L["Scan all"] = "Scan all"--]] 
--[[Translation missing --]]
--[[ L["Scan one page"] = "Scan one page"--]] 
--[[Translation missing --]]
--[[ L["Scan price mode"] = "Scan price mode"--]] 
--[[Translation missing --]]
--[[ L["Show disenchant info"] = "Show disenchant info"--]] 
--[[Translation missing --]]
--[[ L["Single price"] = "Single price"--]] 
--[[Translation missing --]]
--[[ L["Start auction:"] = "Start auction:"--]] 
--[[Translation missing --]]
--[[ L["Start price discount"] = "Start price discount"--]] 
--[[Translation missing --]]
--[[ L["Start scan"] = "Start scan"--]] 
--[[Translation missing --]]
--[[ L["Time"] = "Time"--]] 
--[[Translation missing --]]
--[[ L["Time different"] = "Time different"--]] 
--[[Translation missing --]]
--[[ L["Toggle column"] = "Toggle column"--]] 
--[[Translation missing --]]
--[[ L["Tooltip"] = "Tooltip"--]] 
--[[Translation missing --]]
--[[ L["TOOLTIP_FULLSCAN_DISABLED"] = "An unknown NPC (%s), tdAuction cannot determine whether the auction house is neutral or not."--]] 
--[[Translation missing --]]
--[[ L["TOOLTIP_PREFIX_AUCTION"] = "Auction"--]] 
--[[Translation missing --]]
--[[ L["TOOLTIP_PREFIX_DISENCHANT"] = "Disenchant"--]] 
--[[Translation missing --]]
--[[ L["TOOLTIP_PREFIX_VENDO"] = "Vendor"--]] 
--[[Translation missing --]]
--[[ L["Total price"] = "Total price"--]] 
--[[Translation missing --]]
--[[ L["Unit price"] = "Unit price"--]] 
--[[Translation missing --]]
--[[ L["Unknown"] = "Unknown"--]] 
--[[Translation missing --]]
--[[ L["Update"] = "Update"--]] 
--[[Translation missing --]]
--[[ L["Use history price"] = "Use history price"--]] 
--[[Translation missing --]]
--[[ L["Use merchant price x%d"] = "Use merchant price x%d"--]] 
--[[Translation missing --]]
--[[ L["When no price, use merchant price multiply by"] = "When no price, use merchant price multiply by"--]] 
--[[Translation missing --]]
--[[ L["When pressed SHIFT, to dislay ..."] = "When pressed SHIFT, to dislay ..."--]] 
--[[Translation missing --]]
--[[ L["You are sure to clear the database"] = "You are sure to clear the database"--]]
-- @end-locale@
end)

T('frFR', function(L)
-- @locale:language=frFR@
L = L or {}
--[[Translation missing --]]
--[[ L["1 Year"] = "1 Year"--]] 
--[[Translation missing --]]
--[[ L["180 Days"] = "180 Days"--]] 
--[[Translation missing --]]
--[[ L["30 Days"] = "30 Days"--]] 
--[[Translation missing --]]
--[[ L["7 Days"] = "7 Days"--]] 
--[[Translation missing --]]
--[[ L["90 Days"] = "90 Days"--]] 
--[[Translation missing --]]
--[[ L["Always"] = "Always"--]] 
--[[Translation missing --]]
--[[ L["Auction price"] = "Auction price"--]] 
--[[Translation missing --]]
--[[ L["Auction price time style"] = "Auction price time style"--]] 
--[[Translation missing --]]
--[[ L["Auto clean database"] = "Auto clean database"--]] 
--[[Translation missing --]]
--[[ L["Auto open price list"] = "Auto open price list"--]] 
--[[Translation missing --]]
--[[ L["Bid price"] = "Bid price"--]] 
--[[Translation missing --]]
--[[ L["Bid unit price"] = "Bid unit price"--]] 
--[[Translation missing --]]
--[[ L["Choose other price"] = "Choose other price"--]] 
--[[Translation missing --]]
--[[ L["Clear database"] = "Clear database"--]] 
--[[Translation missing --]]
--[[ L["Count"] = "Count"--]] 
--[[Translation missing --]]
--[[ L["Database"] = "Database"--]] 
--[[Translation missing --]]
--[[ L["Date"] = "Date"--]] 
--[[Translation missing --]]
--[[ L["Default auction duration"] = "Default auction duration"--]] 
--[[Translation missing --]]
--[[ L["Default stack size"] = "Default stack size"--]] 
--[[Translation missing --]]
--[[ L["Disenchant price"] = "Disenchant price"--]] 
--[[Translation missing --]]
--[[ L["Duration no deposit"] = "Duration no deposit"--]] 
--[[Translation missing --]]
--[[ L["Enable ALT to sell"] = "Enable ALT to sell"--]] 
--[[Translation missing --]]
--[[ L["Enable ALT-CTRL click to buyout"] = "Enable ALT-CTRL click to buyout"--]] 
--[[Translation missing --]]
--[[ L["Export"] = "Export"--]] 
--[[Translation missing --]]
--[[ L["EXPORT_HEADER"] = "\"Price\",\"Name\",\"\",\"\",\"Count\""--]] 
--[[Translation missing --]]
--[[ L["Full"] = "Full"--]] 
--[[Translation missing --]]
--[[ L["Full scan"] = "Full scan"--]] 
--[[Translation missing --]]
--[[ L["Full scaning, elapsed time: %s"] = "Full scaning, elapsed time: %s"--]] 
--[[Translation missing --]]
--[[ L["Ignore"] = "Ignore"--]] 
--[[Translation missing --]]
--[[ L["in about %s"] = "in about %s"--]] 
--[[Translation missing --]]
--[[ L["Merchant price"] = "Merchant price"--]] 
--[[Translation missing --]]
--[[ L["Nerver"] = "Nerver"--]] 
--[[Translation missing --]]
--[[ L["Never"] = "Never"--]] 
--[[Translation missing --]]
--[[ L["New"] = "New"--]] 
--[[Translation missing --]]
--[[ L["Next available time:"] = "Next available time:"--]] 
--[[Translation missing --]]
--[[ L["No price"] = "No price"--]] 
--[[Translation missing --]]
--[[ L["Now"] = "Now"--]] 
--[[Translation missing --]]
--[[ L["Pressed SHIFT"] = "Pressed SHIFT"--]] 
--[[Translation missing --]]
--[[ L["Price"] = "Price"--]] 
--[[Translation missing --]]
--[[ L["Processing data, elapsed time: %s"] = "Processing data, elapsed time: %s"--]] 
--[[Translation missing --]]
--[[ L["Scan all"] = "Scan all"--]] 
--[[Translation missing --]]
--[[ L["Scan one page"] = "Scan one page"--]] 
--[[Translation missing --]]
--[[ L["Scan price mode"] = "Scan price mode"--]] 
--[[Translation missing --]]
--[[ L["Show disenchant info"] = "Show disenchant info"--]] 
--[[Translation missing --]]
--[[ L["Single price"] = "Single price"--]] 
--[[Translation missing --]]
--[[ L["Start auction:"] = "Start auction:"--]] 
--[[Translation missing --]]
--[[ L["Start price discount"] = "Start price discount"--]] 
--[[Translation missing --]]
--[[ L["Start scan"] = "Start scan"--]] 
--[[Translation missing --]]
--[[ L["Time"] = "Time"--]] 
--[[Translation missing --]]
--[[ L["Time different"] = "Time different"--]] 
--[[Translation missing --]]
--[[ L["Toggle column"] = "Toggle column"--]] 
--[[Translation missing --]]
--[[ L["Tooltip"] = "Tooltip"--]] 
--[[Translation missing --]]
--[[ L["TOOLTIP_FULLSCAN_DISABLED"] = "An unknown NPC (%s), tdAuction cannot determine whether the auction house is neutral or not."--]] 
--[[Translation missing --]]
--[[ L["TOOLTIP_PREFIX_AUCTION"] = "Auction"--]] 
--[[Translation missing --]]
--[[ L["TOOLTIP_PREFIX_DISENCHANT"] = "Disenchant"--]] 
--[[Translation missing --]]
--[[ L["TOOLTIP_PREFIX_VENDO"] = "Vendor"--]] 
--[[Translation missing --]]
--[[ L["Total price"] = "Total price"--]] 
--[[Translation missing --]]
--[[ L["Unit price"] = "Unit price"--]] 
--[[Translation missing --]]
--[[ L["Unknown"] = "Unknown"--]] 
--[[Translation missing --]]
--[[ L["Update"] = "Update"--]] 
--[[Translation missing --]]
--[[ L["Use history price"] = "Use history price"--]] 
--[[Translation missing --]]
--[[ L["Use merchant price x%d"] = "Use merchant price x%d"--]] 
--[[Translation missing --]]
--[[ L["When no price, use merchant price multiply by"] = "When no price, use merchant price multiply by"--]] 
--[[Translation missing --]]
--[[ L["When pressed SHIFT, to dislay ..."] = "When pressed SHIFT, to dislay ..."--]] 
--[[Translation missing --]]
--[[ L["You are sure to clear the database"] = "You are sure to clear the database"--]]
-- @end-locale@
end)

T('itIT', function(L)
-- @locale:language=itIT@
L = L or {}
--[[Translation missing --]]
--[[ L["1 Year"] = "1 Year"--]] 
--[[Translation missing --]]
--[[ L["180 Days"] = "180 Days"--]] 
--[[Translation missing --]]
--[[ L["30 Days"] = "30 Days"--]] 
--[[Translation missing --]]
--[[ L["7 Days"] = "7 Days"--]] 
--[[Translation missing --]]
--[[ L["90 Days"] = "90 Days"--]] 
--[[Translation missing --]]
--[[ L["Always"] = "Always"--]] 
--[[Translation missing --]]
--[[ L["Auction price"] = "Auction price"--]] 
--[[Translation missing --]]
--[[ L["Auction price time style"] = "Auction price time style"--]] 
--[[Translation missing --]]
--[[ L["Auto clean database"] = "Auto clean database"--]] 
--[[Translation missing --]]
--[[ L["Auto open price list"] = "Auto open price list"--]] 
--[[Translation missing --]]
--[[ L["Bid price"] = "Bid price"--]] 
--[[Translation missing --]]
--[[ L["Bid unit price"] = "Bid unit price"--]] 
--[[Translation missing --]]
--[[ L["Choose other price"] = "Choose other price"--]] 
--[[Translation missing --]]
--[[ L["Clear database"] = "Clear database"--]] 
--[[Translation missing --]]
--[[ L["Count"] = "Count"--]] 
--[[Translation missing --]]
--[[ L["Database"] = "Database"--]] 
--[[Translation missing --]]
--[[ L["Date"] = "Date"--]] 
--[[Translation missing --]]
--[[ L["Default auction duration"] = "Default auction duration"--]] 
--[[Translation missing --]]
--[[ L["Default stack size"] = "Default stack size"--]] 
--[[Translation missing --]]
--[[ L["Disenchant price"] = "Disenchant price"--]] 
--[[Translation missing --]]
--[[ L["Duration no deposit"] = "Duration no deposit"--]] 
--[[Translation missing --]]
--[[ L["Enable ALT to sell"] = "Enable ALT to sell"--]] 
--[[Translation missing --]]
--[[ L["Enable ALT-CTRL click to buyout"] = "Enable ALT-CTRL click to buyout"--]] 
--[[Translation missing --]]
--[[ L["Export"] = "Export"--]] 
--[[Translation missing --]]
--[[ L["EXPORT_HEADER"] = "\"Price\",\"Name\",\"\",\"\",\"Count\""--]] 
--[[Translation missing --]]
--[[ L["Full"] = "Full"--]] 
--[[Translation missing --]]
--[[ L["Full scan"] = "Full scan"--]] 
--[[Translation missing --]]
--[[ L["Full scaning, elapsed time: %s"] = "Full scaning, elapsed time: %s"--]] 
--[[Translation missing --]]
--[[ L["Ignore"] = "Ignore"--]] 
--[[Translation missing --]]
--[[ L["in about %s"] = "in about %s"--]] 
--[[Translation missing --]]
--[[ L["Merchant price"] = "Merchant price"--]] 
--[[Translation missing --]]
--[[ L["Nerver"] = "Nerver"--]] 
--[[Translation missing --]]
--[[ L["Never"] = "Never"--]] 
--[[Translation missing --]]
--[[ L["New"] = "New"--]] 
--[[Translation missing --]]
--[[ L["Next available time:"] = "Next available time:"--]] 
--[[Translation missing --]]
--[[ L["No price"] = "No price"--]] 
--[[Translation missing --]]
--[[ L["Now"] = "Now"--]] 
--[[Translation missing --]]
--[[ L["Pressed SHIFT"] = "Pressed SHIFT"--]] 
--[[Translation missing --]]
--[[ L["Price"] = "Price"--]] 
--[[Translation missing --]]
--[[ L["Processing data, elapsed time: %s"] = "Processing data, elapsed time: %s"--]] 
--[[Translation missing --]]
--[[ L["Scan all"] = "Scan all"--]] 
--[[Translation missing --]]
--[[ L["Scan one page"] = "Scan one page"--]] 
--[[Translation missing --]]
--[[ L["Scan price mode"] = "Scan price mode"--]] 
--[[Translation missing --]]
--[[ L["Show disenchant info"] = "Show disenchant info"--]] 
--[[Translation missing --]]
--[[ L["Single price"] = "Single price"--]] 
--[[Translation missing --]]
--[[ L["Start auction:"] = "Start auction:"--]] 
--[[Translation missing --]]
--[[ L["Start price discount"] = "Start price discount"--]] 
--[[Translation missing --]]
--[[ L["Start scan"] = "Start scan"--]] 
--[[Translation missing --]]
--[[ L["Time"] = "Time"--]] 
--[[Translation missing --]]
--[[ L["Time different"] = "Time different"--]] 
--[[Translation missing --]]
--[[ L["Toggle column"] = "Toggle column"--]] 
--[[Translation missing --]]
--[[ L["Tooltip"] = "Tooltip"--]] 
--[[Translation missing --]]
--[[ L["TOOLTIP_FULLSCAN_DISABLED"] = "An unknown NPC (%s), tdAuction cannot determine whether the auction house is neutral or not."--]] 
--[[Translation missing --]]
--[[ L["TOOLTIP_PREFIX_AUCTION"] = "Auction"--]] 
--[[Translation missing --]]
--[[ L["TOOLTIP_PREFIX_DISENCHANT"] = "Disenchant"--]] 
--[[Translation missing --]]
--[[ L["TOOLTIP_PREFIX_VENDO"] = "Vendor"--]] 
--[[Translation missing --]]
--[[ L["Total price"] = "Total price"--]] 
--[[Translation missing --]]
--[[ L["Unit price"] = "Unit price"--]] 
--[[Translation missing --]]
--[[ L["Unknown"] = "Unknown"--]] 
--[[Translation missing --]]
--[[ L["Update"] = "Update"--]] 
--[[Translation missing --]]
--[[ L["Use history price"] = "Use history price"--]] 
--[[Translation missing --]]
--[[ L["Use merchant price x%d"] = "Use merchant price x%d"--]] 
--[[Translation missing --]]
--[[ L["When no price, use merchant price multiply by"] = "When no price, use merchant price multiply by"--]] 
--[[Translation missing --]]
--[[ L["When pressed SHIFT, to dislay ..."] = "When pressed SHIFT, to dislay ..."--]] 
--[[Translation missing --]]
--[[ L["You are sure to clear the database"] = "You are sure to clear the database"--]]
-- @end-locale@
end)

T('koKR', function(L)
-- @locale:language=koKR@
L = L or {}
--[[Translation missing --]]
--[[ L["1 Year"] = "1 Year"--]] 
--[[Translation missing --]]
--[[ L["180 Days"] = "180 Days"--]] 
--[[Translation missing --]]
--[[ L["30 Days"] = "30 Days"--]] 
--[[Translation missing --]]
--[[ L["7 Days"] = "7 Days"--]] 
--[[Translation missing --]]
--[[ L["90 Days"] = "90 Days"--]] 
--[[Translation missing --]]
--[[ L["Always"] = "Always"--]] 
--[[Translation missing --]]
--[[ L["Auction price"] = "Auction price"--]] 
--[[Translation missing --]]
--[[ L["Auction price time style"] = "Auction price time style"--]] 
--[[Translation missing --]]
--[[ L["Auto clean database"] = "Auto clean database"--]] 
--[[Translation missing --]]
--[[ L["Auto open price list"] = "Auto open price list"--]] 
--[[Translation missing --]]
--[[ L["Bid price"] = "Bid price"--]] 
--[[Translation missing --]]
--[[ L["Bid unit price"] = "Bid unit price"--]] 
--[[Translation missing --]]
--[[ L["Choose other price"] = "Choose other price"--]] 
--[[Translation missing --]]
--[[ L["Clear database"] = "Clear database"--]] 
--[[Translation missing --]]
--[[ L["Count"] = "Count"--]] 
--[[Translation missing --]]
--[[ L["Database"] = "Database"--]] 
--[[Translation missing --]]
--[[ L["Date"] = "Date"--]] 
--[[Translation missing --]]
--[[ L["Default auction duration"] = "Default auction duration"--]] 
--[[Translation missing --]]
--[[ L["Default stack size"] = "Default stack size"--]] 
--[[Translation missing --]]
--[[ L["Disenchant price"] = "Disenchant price"--]] 
--[[Translation missing --]]
--[[ L["Duration no deposit"] = "Duration no deposit"--]] 
--[[Translation missing --]]
--[[ L["Enable ALT to sell"] = "Enable ALT to sell"--]] 
--[[Translation missing --]]
--[[ L["Enable ALT-CTRL click to buyout"] = "Enable ALT-CTRL click to buyout"--]] 
--[[Translation missing --]]
--[[ L["Export"] = "Export"--]] 
--[[Translation missing --]]
--[[ L["EXPORT_HEADER"] = "\"Price\",\"Name\",\"\",\"\",\"Count\""--]] 
--[[Translation missing --]]
--[[ L["Full"] = "Full"--]] 
--[[Translation missing --]]
--[[ L["Full scan"] = "Full scan"--]] 
--[[Translation missing --]]
--[[ L["Full scaning, elapsed time: %s"] = "Full scaning, elapsed time: %s"--]] 
--[[Translation missing --]]
--[[ L["Ignore"] = "Ignore"--]] 
--[[Translation missing --]]
--[[ L["in about %s"] = "in about %s"--]] 
--[[Translation missing --]]
--[[ L["Merchant price"] = "Merchant price"--]] 
--[[Translation missing --]]
--[[ L["Nerver"] = "Nerver"--]] 
--[[Translation missing --]]
--[[ L["Never"] = "Never"--]] 
--[[Translation missing --]]
--[[ L["New"] = "New"--]] 
--[[Translation missing --]]
--[[ L["Next available time:"] = "Next available time:"--]] 
--[[Translation missing --]]
--[[ L["No price"] = "No price"--]] 
--[[Translation missing --]]
--[[ L["Now"] = "Now"--]] 
--[[Translation missing --]]
--[[ L["Pressed SHIFT"] = "Pressed SHIFT"--]] 
--[[Translation missing --]]
--[[ L["Price"] = "Price"--]] 
--[[Translation missing --]]
--[[ L["Processing data, elapsed time: %s"] = "Processing data, elapsed time: %s"--]] 
--[[Translation missing --]]
--[[ L["Scan all"] = "Scan all"--]] 
--[[Translation missing --]]
--[[ L["Scan one page"] = "Scan one page"--]] 
--[[Translation missing --]]
--[[ L["Scan price mode"] = "Scan price mode"--]] 
--[[Translation missing --]]
--[[ L["Show disenchant info"] = "Show disenchant info"--]] 
--[[Translation missing --]]
--[[ L["Single price"] = "Single price"--]] 
--[[Translation missing --]]
--[[ L["Start auction:"] = "Start auction:"--]] 
--[[Translation missing --]]
--[[ L["Start price discount"] = "Start price discount"--]] 
--[[Translation missing --]]
--[[ L["Start scan"] = "Start scan"--]] 
--[[Translation missing --]]
--[[ L["Time"] = "Time"--]] 
--[[Translation missing --]]
--[[ L["Time different"] = "Time different"--]] 
--[[Translation missing --]]
--[[ L["Toggle column"] = "Toggle column"--]] 
--[[Translation missing --]]
--[[ L["Tooltip"] = "Tooltip"--]] 
--[[Translation missing --]]
--[[ L["TOOLTIP_FULLSCAN_DISABLED"] = "An unknown NPC (%s), tdAuction cannot determine whether the auction house is neutral or not."--]] 
--[[Translation missing --]]
--[[ L["TOOLTIP_PREFIX_AUCTION"] = "Auction"--]] 
--[[Translation missing --]]
--[[ L["TOOLTIP_PREFIX_DISENCHANT"] = "Disenchant"--]] 
--[[Translation missing --]]
--[[ L["TOOLTIP_PREFIX_VENDO"] = "Vendor"--]] 
--[[Translation missing --]]
--[[ L["Total price"] = "Total price"--]] 
--[[Translation missing --]]
--[[ L["Unit price"] = "Unit price"--]] 
--[[Translation missing --]]
--[[ L["Unknown"] = "Unknown"--]] 
--[[Translation missing --]]
--[[ L["Update"] = "Update"--]] 
--[[Translation missing --]]
--[[ L["Use history price"] = "Use history price"--]] 
--[[Translation missing --]]
--[[ L["Use merchant price x%d"] = "Use merchant price x%d"--]] 
--[[Translation missing --]]
--[[ L["When no price, use merchant price multiply by"] = "When no price, use merchant price multiply by"--]] 
--[[Translation missing --]]
--[[ L["When pressed SHIFT, to dislay ..."] = "When pressed SHIFT, to dislay ..."--]] 
--[[Translation missing --]]
--[[ L["You are sure to clear the database"] = "You are sure to clear the database"--]]
-- @end-locale@
end)

T('ptBR', function(L)
-- @locale:language=ptBR@
L = L or {}
--[[Translation missing --]]
--[[ L["1 Year"] = "1 Year"--]] 
--[[Translation missing --]]
--[[ L["180 Days"] = "180 Days"--]] 
--[[Translation missing --]]
--[[ L["30 Days"] = "30 Days"--]] 
--[[Translation missing --]]
--[[ L["7 Days"] = "7 Days"--]] 
--[[Translation missing --]]
--[[ L["90 Days"] = "90 Days"--]] 
--[[Translation missing --]]
--[[ L["Always"] = "Always"--]] 
--[[Translation missing --]]
--[[ L["Auction price"] = "Auction price"--]] 
--[[Translation missing --]]
--[[ L["Auction price time style"] = "Auction price time style"--]] 
--[[Translation missing --]]
--[[ L["Auto clean database"] = "Auto clean database"--]] 
--[[Translation missing --]]
--[[ L["Auto open price list"] = "Auto open price list"--]] 
--[[Translation missing --]]
--[[ L["Bid price"] = "Bid price"--]] 
--[[Translation missing --]]
--[[ L["Bid unit price"] = "Bid unit price"--]] 
--[[Translation missing --]]
--[[ L["Choose other price"] = "Choose other price"--]] 
--[[Translation missing --]]
--[[ L["Clear database"] = "Clear database"--]] 
--[[Translation missing --]]
--[[ L["Count"] = "Count"--]] 
--[[Translation missing --]]
--[[ L["Database"] = "Database"--]] 
--[[Translation missing --]]
--[[ L["Date"] = "Date"--]] 
--[[Translation missing --]]
--[[ L["Default auction duration"] = "Default auction duration"--]] 
--[[Translation missing --]]
--[[ L["Default stack size"] = "Default stack size"--]] 
--[[Translation missing --]]
--[[ L["Disenchant price"] = "Disenchant price"--]] 
--[[Translation missing --]]
--[[ L["Duration no deposit"] = "Duration no deposit"--]] 
--[[Translation missing --]]
--[[ L["Enable ALT to sell"] = "Enable ALT to sell"--]] 
--[[Translation missing --]]
--[[ L["Enable ALT-CTRL click to buyout"] = "Enable ALT-CTRL click to buyout"--]] 
--[[Translation missing --]]
--[[ L["Export"] = "Export"--]] 
--[[Translation missing --]]
--[[ L["EXPORT_HEADER"] = "\"Price\",\"Name\",\"\",\"\",\"Count\""--]] 
--[[Translation missing --]]
--[[ L["Full"] = "Full"--]] 
--[[Translation missing --]]
--[[ L["Full scan"] = "Full scan"--]] 
--[[Translation missing --]]
--[[ L["Full scaning, elapsed time: %s"] = "Full scaning, elapsed time: %s"--]] 
--[[Translation missing --]]
--[[ L["Ignore"] = "Ignore"--]] 
--[[Translation missing --]]
--[[ L["in about %s"] = "in about %s"--]] 
--[[Translation missing --]]
--[[ L["Merchant price"] = "Merchant price"--]] 
--[[Translation missing --]]
--[[ L["Nerver"] = "Nerver"--]] 
--[[Translation missing --]]
--[[ L["Never"] = "Never"--]] 
--[[Translation missing --]]
--[[ L["New"] = "New"--]] 
--[[Translation missing --]]
--[[ L["Next available time:"] = "Next available time:"--]] 
--[[Translation missing --]]
--[[ L["No price"] = "No price"--]] 
--[[Translation missing --]]
--[[ L["Now"] = "Now"--]] 
--[[Translation missing --]]
--[[ L["Pressed SHIFT"] = "Pressed SHIFT"--]] 
--[[Translation missing --]]
--[[ L["Price"] = "Price"--]] 
--[[Translation missing --]]
--[[ L["Processing data, elapsed time: %s"] = "Processing data, elapsed time: %s"--]] 
--[[Translation missing --]]
--[[ L["Scan all"] = "Scan all"--]] 
--[[Translation missing --]]
--[[ L["Scan one page"] = "Scan one page"--]] 
--[[Translation missing --]]
--[[ L["Scan price mode"] = "Scan price mode"--]] 
--[[Translation missing --]]
--[[ L["Show disenchant info"] = "Show disenchant info"--]] 
--[[Translation missing --]]
--[[ L["Single price"] = "Single price"--]] 
--[[Translation missing --]]
--[[ L["Start auction:"] = "Start auction:"--]] 
--[[Translation missing --]]
--[[ L["Start price discount"] = "Start price discount"--]] 
--[[Translation missing --]]
--[[ L["Start scan"] = "Start scan"--]] 
--[[Translation missing --]]
--[[ L["Time"] = "Time"--]] 
--[[Translation missing --]]
--[[ L["Time different"] = "Time different"--]] 
--[[Translation missing --]]
--[[ L["Toggle column"] = "Toggle column"--]] 
--[[Translation missing --]]
--[[ L["Tooltip"] = "Tooltip"--]] 
--[[Translation missing --]]
--[[ L["TOOLTIP_FULLSCAN_DISABLED"] = "An unknown NPC (%s), tdAuction cannot determine whether the auction house is neutral or not."--]] 
--[[Translation missing --]]
--[[ L["TOOLTIP_PREFIX_AUCTION"] = "Auction"--]] 
--[[Translation missing --]]
--[[ L["TOOLTIP_PREFIX_DISENCHANT"] = "Disenchant"--]] 
--[[Translation missing --]]
--[[ L["TOOLTIP_PREFIX_VENDO"] = "Vendor"--]] 
--[[Translation missing --]]
--[[ L["Total price"] = "Total price"--]] 
--[[Translation missing --]]
--[[ L["Unit price"] = "Unit price"--]] 
--[[Translation missing --]]
--[[ L["Unknown"] = "Unknown"--]] 
--[[Translation missing --]]
--[[ L["Update"] = "Update"--]] 
--[[Translation missing --]]
--[[ L["Use history price"] = "Use history price"--]] 
--[[Translation missing --]]
--[[ L["Use merchant price x%d"] = "Use merchant price x%d"--]] 
--[[Translation missing --]]
--[[ L["When no price, use merchant price multiply by"] = "When no price, use merchant price multiply by"--]] 
--[[Translation missing --]]
--[[ L["When pressed SHIFT, to dislay ..."] = "When pressed SHIFT, to dislay ..."--]] 
--[[Translation missing --]]
--[[ L["You are sure to clear the database"] = "You are sure to clear the database"--]]
-- @end-locale@
end)

T('ruRU', function(L)
-- @locale:language=ruRU@
L = L or {}
--[[Translation missing --]]
--[[ L["1 Year"] = "1 Year"--]] 
--[[Translation missing --]]
--[[ L["180 Days"] = "180 Days"--]] 
--[[Translation missing --]]
--[[ L["30 Days"] = "30 Days"--]] 
--[[Translation missing --]]
--[[ L["7 Days"] = "7 Days"--]] 
--[[Translation missing --]]
--[[ L["90 Days"] = "90 Days"--]] 
L["Always"] = "Всегда"
L["Auction price"] = "Цена аукциона"
L["Auction price time style"] = "Стиль аукционной цены по времени"
--[[Translation missing --]]
--[[ L["Auto clean database"] = "Auto clean database"--]] 
L["Auto open price list"] = "Автоматически открыть прайс-лист"
L["Bid price"] = "Цена предложения"
L["Bid unit price"] = "Цена за единицу предложения"
L["Choose other price"] = "Выбрать другую цену"
L["Clear database"] = "Очистить базу данных"
L["Count"] = "Считать"
L["Database"] = "База данных"
L["Date"] = "Дата"
L["Default auction duration"] = "Продолжительность аукциона по умолчанию"
L["Default stack size"] = "Размер стака по умолчанию"
L["Disenchant price"] = "Цена наложения чар"
L["Duration no deposit"] = "Продолжительность без депозита"
L["Enable ALT to sell"] = "Включить ALT для продажи"
L["Enable ALT-CTRL click to buyout"] = "Включить ALT-CTRL для выкупа"
L["Export"] = "Экспорт"
L["EXPORT_HEADER"] = "\"Цена\",\"Имя\",\"\",\"\",\"Количество\""
L["Full"] = "Полное"
L["Full scan"] = "Полное сканирование"
L["Full scaning, elapsed time: %s"] = "Полное сканирование, прошедшее время: %s"
L["Ignore"] = "Игнорировать"
L["in about %s"] = "примерно в %s"
L["Merchant price"] = "Цена торговца"
L["Nerver"] = "Никогда"
--[[Translation missing --]]
--[[ L["Never"] = "Never"--]] 
L["New"] = "Новый"
L["Next available time:"] = "Ближайшее доступное время:"
L["No price"] = "Нет цены"
L["Now"] = "Сейчас"
L["Pressed SHIFT"] = "Нажата клавиша SHIFT"
L["Price"] = "Цена"
L["Processing data, elapsed time: %s"] = "Обработка данных, прошедшее время: %s"
L["Scan all"] = "Сканировать все"
L["Scan one page"] = "Сканировать одну страницу"
L["Scan price mode"] = "Режим сканирования цен"
L["Show disenchant info"] = "Показать информацию о наложении чар"
L["Single price"] = "Единая цена"
L["Start auction:"] = "Начать аукцион:"
L["Start price discount"] = "Скидка на начальную цену"
L["Start scan"] = "Начать сканирование"
L["Time"] = "Время"
L["Time different"] = "Время другое"
L["Toggle column"] = "Переключить столбец"
L["Tooltip"] = "Подсказка"
L["TOOLTIP_FULLSCAN_DISABLED"] = "Неизвестный НПС (%s), tdAuction не может определить, является ли аукционный дом нейтральным или нет."
L["TOOLTIP_PREFIX_AUCTION"] = "Аукцион"
L["TOOLTIP_PREFIX_DISENCHANT"] = "Наложение чар"
L["TOOLTIP_PREFIX_VENDO"] = "Торговец"
L["Total price"] = "Общая стоимость"
L["Unit price"] = "Цена за единицу товара"
L["Unknown"] = "Неизвестно"
L["Update"] = "Обновить"
L["Use history price"] = "Использовать историю цен"
L["Use merchant price x%d"] = "Использовать цену продавца x%d"
L["When no price, use merchant price multiply by"] = "Если цены нет, используйте цену продавца, умноженную на"
L["When pressed SHIFT, to dislay ..."] = "При нажатии SHIFT для отображения ..."
L["You are sure to clear the database"] = "Обязательно очистите базу данных."
-- @end-locale@
end)

T('zhTW', function(L)
-- @locale:language=zhTW@
L = L or {}
--[[Translation missing --]]
--[[ L["1 Year"] = "1 Year"--]] 
--[[Translation missing --]]
--[[ L["180 Days"] = "180 Days"--]] 
--[[Translation missing --]]
--[[ L["30 Days"] = "30 Days"--]] 
--[[Translation missing --]]
--[[ L["7 Days"] = "7 Days"--]] 
--[[Translation missing --]]
--[[ L["90 Days"] = "90 Days"--]] 
--[[Translation missing --]]
--[[ L["Always"] = "Always"--]] 
--[[Translation missing --]]
--[[ L["Auction price"] = "Auction price"--]] 
--[[Translation missing --]]
--[[ L["Auction price time style"] = "Auction price time style"--]] 
--[[Translation missing --]]
--[[ L["Auto clean database"] = "Auto clean database"--]] 
--[[Translation missing --]]
--[[ L["Auto open price list"] = "Auto open price list"--]] 
--[[Translation missing --]]
--[[ L["Bid price"] = "Bid price"--]] 
--[[Translation missing --]]
--[[ L["Bid unit price"] = "Bid unit price"--]] 
--[[Translation missing --]]
--[[ L["Choose other price"] = "Choose other price"--]] 
--[[Translation missing --]]
--[[ L["Clear database"] = "Clear database"--]] 
--[[Translation missing --]]
--[[ L["Count"] = "Count"--]] 
--[[Translation missing --]]
--[[ L["Database"] = "Database"--]] 
--[[Translation missing --]]
--[[ L["Date"] = "Date"--]] 
--[[Translation missing --]]
--[[ L["Default auction duration"] = "Default auction duration"--]] 
--[[Translation missing --]]
--[[ L["Default stack size"] = "Default stack size"--]] 
--[[Translation missing --]]
--[[ L["Disenchant price"] = "Disenchant price"--]] 
--[[Translation missing --]]
--[[ L["Duration no deposit"] = "Duration no deposit"--]] 
--[[Translation missing --]]
--[[ L["Enable ALT to sell"] = "Enable ALT to sell"--]] 
--[[Translation missing --]]
--[[ L["Enable ALT-CTRL click to buyout"] = "Enable ALT-CTRL click to buyout"--]] 
--[[Translation missing --]]
--[[ L["Export"] = "Export"--]] 
--[[Translation missing --]]
--[[ L["EXPORT_HEADER"] = "\"Price\",\"Name\",\"\",\"\",\"Count\""--]] 
--[[Translation missing --]]
--[[ L["Full"] = "Full"--]] 
--[[Translation missing --]]
--[[ L["Full scan"] = "Full scan"--]] 
--[[Translation missing --]]
--[[ L["Full scaning, elapsed time: %s"] = "Full scaning, elapsed time: %s"--]] 
--[[Translation missing --]]
--[[ L["Ignore"] = "Ignore"--]] 
--[[Translation missing --]]
--[[ L["in about %s"] = "in about %s"--]] 
--[[Translation missing --]]
--[[ L["Merchant price"] = "Merchant price"--]] 
--[[Translation missing --]]
--[[ L["Nerver"] = "Nerver"--]] 
--[[Translation missing --]]
--[[ L["Never"] = "Never"--]] 
--[[Translation missing --]]
--[[ L["New"] = "New"--]] 
--[[Translation missing --]]
--[[ L["Next available time:"] = "Next available time:"--]] 
--[[Translation missing --]]
--[[ L["No price"] = "No price"--]] 
--[[Translation missing --]]
--[[ L["Now"] = "Now"--]] 
--[[Translation missing --]]
--[[ L["Pressed SHIFT"] = "Pressed SHIFT"--]] 
--[[Translation missing --]]
--[[ L["Price"] = "Price"--]] 
--[[Translation missing --]]
--[[ L["Processing data, elapsed time: %s"] = "Processing data, elapsed time: %s"--]] 
--[[Translation missing --]]
--[[ L["Scan all"] = "Scan all"--]] 
--[[Translation missing --]]
--[[ L["Scan one page"] = "Scan one page"--]] 
--[[Translation missing --]]
--[[ L["Scan price mode"] = "Scan price mode"--]] 
--[[Translation missing --]]
--[[ L["Show disenchant info"] = "Show disenchant info"--]] 
--[[Translation missing --]]
--[[ L["Single price"] = "Single price"--]] 
--[[Translation missing --]]
--[[ L["Start auction:"] = "Start auction:"--]] 
--[[Translation missing --]]
--[[ L["Start price discount"] = "Start price discount"--]] 
--[[Translation missing --]]
--[[ L["Start scan"] = "Start scan"--]] 
--[[Translation missing --]]
--[[ L["Time"] = "Time"--]] 
--[[Translation missing --]]
--[[ L["Time different"] = "Time different"--]] 
--[[Translation missing --]]
--[[ L["Toggle column"] = "Toggle column"--]] 
--[[Translation missing --]]
--[[ L["Tooltip"] = "Tooltip"--]] 
--[[Translation missing --]]
--[[ L["TOOLTIP_FULLSCAN_DISABLED"] = "An unknown NPC (%s), tdAuction cannot determine whether the auction house is neutral or not."--]] 
--[[Translation missing --]]
--[[ L["TOOLTIP_PREFIX_AUCTION"] = "Auction"--]] 
--[[Translation missing --]]
--[[ L["TOOLTIP_PREFIX_DISENCHANT"] = "Disenchant"--]] 
--[[Translation missing --]]
--[[ L["TOOLTIP_PREFIX_VENDO"] = "Vendor"--]] 
--[[Translation missing --]]
--[[ L["Total price"] = "Total price"--]] 
--[[Translation missing --]]
--[[ L["Unit price"] = "Unit price"--]] 
--[[Translation missing --]]
--[[ L["Unknown"] = "Unknown"--]] 
--[[Translation missing --]]
--[[ L["Update"] = "Update"--]] 
--[[Translation missing --]]
--[[ L["Use history price"] = "Use history price"--]] 
--[[Translation missing --]]
--[[ L["Use merchant price x%d"] = "Use merchant price x%d"--]] 
--[[Translation missing --]]
--[[ L["When no price, use merchant price multiply by"] = "When no price, use merchant price multiply by"--]] 
--[[Translation missing --]]
--[[ L["When pressed SHIFT, to dislay ..."] = "When pressed SHIFT, to dislay ..."--]] 
--[[Translation missing --]]
--[[ L["You are sure to clear the database"] = "You are sure to clear the database"--]]
-- @end-locale@
end)
