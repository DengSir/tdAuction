local L = LibStub('AceLocale-3.0'):NewLocale('tdAuction', 'enUS', true)
if not L then
    return
end

-- @locale:language=enUS@
L = L or {}
L["|cff00fffftdAuction|r cannot detect the source of the link, this may cause taint, so you need to manually enter the search text."] = true
L["1 Year"] = true
L["180 Days"] = true
L["30 Days"] = true
L["7 Days"] = true
L["90 Days"] = true
L["Always"] = true
L["Auction price"] = true
L["Auction price time style"] = true
L["Auto clean database"] = true
L["Auto open price list"] = true
L["Bid price"] = true
L["Bid unit price"] = true
L["Cannot perform this action while the search is locked."] = true
L["Choose other price"] = true
L["Clear database"] = true
L["Count"] = true
L["Database"] = true
L["Date"] = true
L["Default auction duration"] = true
L["Default number of stacks"] = true
L["Default stack size"] = true
L["Disenchant price"] = true
L["Duration no deposit"] = true
L["Enable %s to sell"] = true
L["Enable ALT-CTRL click to buyout"] = true
L["Export"] = true
L["EXPORT_HEADER"] = "\"Price\",\"Name\",\"\",\"\",\"Count\""
L["Full"] = true
L["Full scan"] = true
L["Full scaning, elapsed time: %s"] = true
L["I found that some addons prevent quick search and quick selling from working."] = true
L["Ignore"] = true
L["in about %s"] = true
L["Insecure Input"] = true
L["Items with random enchantments cannot be searched correctly on the Chinese client, |cff00fffftdAuction|r have fixed this issue, but you need to manually enter the search text in TITAN realm."] = true
L["Merchant price"] = true
L["Nerver"] = true
L["Never"] = true
L["New"] = true
L["Next available time:"] = true
L["No price"] = true
L["Now"] = true
L["Please press |cff00ff00CTRL-X|r, then press |cff00ff00CTRL-V|r and |cff00ff00Enter|r to search."] = true
L["Pressed SHIFT"] = true
L["Price"] = true
L["Processing data, elapsed time: %s"] = true
L["Scan all"] = true
L["Scan one page"] = true
L["Scan price mode"] = true
L["Show disenchant info"] = true
L["Single price"] = true
L["Start auction:"] = true
L["Start price discount"] = true
L["Start scan"] = true
L["Support me"] = true
L["Time"] = true
L["Time different"] = true
L["Toggle column"] = true
L["Tooltip"] = true
L["TOOLTIP_FULLSCAN_DISABLED"] = "An unknown NPC (%s), tdAuction cannot determine whether the auction house is neutral or not."
L["TOOLTIP_PREFIX_AUCTION"] = "Auction"
L["TOOLTIP_PREFIX_DISENCHANT"] = "Disenchant"
L["TOOLTIP_PREFIX_VENDO"] = "Vendor"
L["Total price"] = true
L["Unit price"] = true
L["Unknown"] = true
L["Update"] = true
L["Use history price"] = true
L["Use merchant price x%d"] = true
L["When no price, use merchant price multiply by"] = true
L["When pressed SHIFT, to dislay ..."] = true
L["You are sure to clear the database"] = true
-- @end-locale@

-- @debug@
-- @import:language=enUS@
L['Enable ALT-CTRL click to buyout'] = true
L['Auto open price list'] = true
L['Scan price mode'] = true
L['Scan all'] = true
L['Scan one page'] = true
--[====[ never used ]====]
--[====[ L['Enable ALT to sell'] = true ]====]
L['Default stack size'] = true
L['Full'] = true
L['Default auction duration'] = true
L['Ignore'] = true
L['Duration no deposit'] = true
L['When no price, use merchant price multiply by'] = true
L['Start price discount'] = true
L['Database'] = true
L['Clear database'] = true
L['You are sure to clear the database'] = true
L['Tooltip'] = true
L['Merchant price'] = true
L['Auction price'] = true
L['Disenchant price'] = true
L['When pressed SHIFT, to dislay ...'] = true
L['Total price'] = true
L['Single price'] = true
L['Time'] = true
L['Bid price'] = true
L['Unit price'] = true
L['Bid unit price'] = true

L['Show disenchant info'] = true
L['Nerver'] = true
L['Pressed SHIFT'] = true
L['Always'] = true

L['Full scan'] = true
L['Start scan'] = true
L['Next available time:'] = true
L['in about %s'] = true
L['Full scaning, elapsed time: %s'] = true
L['Processing data, elapsed time: %s'] = true
L['Now'] = true
L['Unknown'] = true
L['New'] = true
L['Update'] = true

L['Count'] = true
L['Price'] = true
L['Use merchant price x%d'] = true
L['No price'] = true
L['Use history price'] = true
L['Choose other price'] = true

L['Start auction:'] = true
L['Toggle column'] = true
L['Auction price time style'] = true
L['Date'] = true
L['Time different'] = true
L['Export'] = true

L.TOOLTIP_PREFIX_VENDO = 'Vendor'
L.TOOLTIP_PREFIX_AUCTION = 'Auction'
L.TOOLTIP_PREFIX_DISENCHANT = 'Disenchant'
L.TOOLTIP_FULLSCAN_DISABLED =
    [[An unknown NPC (%s), tdAuction cannot determine whether the auction house is neutral or not.]]

L.EXPORT_HEADER = [["Price","Name","","","Count"]]
L['1 Year'] = true
L['180 Days'] = true
L['30 Days'] = true
L['7 Days'] = true
L['90 Days'] = true
L['Auto clean database'] = true
L.Never = true
L['Cannot perform this action while the search is locked.'] = true
L['I found that some addons prevent quick search and quick selling from working.'] = true
L['Insecure Input'] = true
L['Items with random enchantments cannot be searched correctly on the Chinese client, |cff00fffftdAuction|r have fixed this issue, but you need to manually enter the search text in TITAN realm.'] = true
L['Please press |cff00ff00CTRL-X|r, then press |cff00ff00CTRL-V|r and |cff00ff00Enter|r to search.'] = true
L['|cff00fffftdAuction|r cannot detect the source of the link, this may cause taint, so you need to manually enter the search text.'] = true
L['Enable %s to sell'] = true
L['Support me'] = true
L['Default number of stacks'] = true
L['Narrow item class filter list'] = true
L['Need reload UI, continue?'] = true
-- @locale-fill@
-- @end-import@
-- @end-debug@
