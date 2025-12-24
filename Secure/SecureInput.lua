-- SecureInput.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 12/18/2025, 1:00:56 AM
--
---@type 'tdAuction', ns
local ADDON, ns = ...

local L = ns.L

---@class UI.SecureInput : Frame
local SecureInput = ns.Addon:NewClass('UI.SecureInput', 'Frame')

function SecureInput:Constructor()
    self.HeaderText:SetText(L['Insecure Input'])

    self.Input:SetScript('OnTextChanged', function(editBox, userInput)
        if not editBox:IsVisible() then
            return
        end
        if userInput or editBox:GetText() == '' then
            editBox:GetParent():Hide()
            BrowseName:SetText('')
            BrowseName:SetFocus()
        end
    end)
    self.Input:SetScript('OnEditFocusLost', function()
        self:Hide()
    end)

    self.Support:SetText(L['Support me'])
end

function SecureInput:SetText(text, fix)
    self.Input:SetText(text)
    self.Input:HighlightText()

    local help = fix and
                     L['Items with random enchantments cannot be searched correctly on the Chinese client, |cff00fffftdAuction|r have fixed this issue, but you need to manually enter the search text in TITAN realm.'] or
                     L['|cff00fffftdAuction|r cannot detect the source of the link, this may cause taint, so you need to manually enter the search text.']

    help = help .. '\n\n' ..
               L['Please press |cff00ff00CTRL-X|r, then press |cff00ff00CTRL-V|r and |cff00ff00Enter|r to search.']

    self.Text:SetText(help)
end

function SecureInput:ShowText(text)
    local itemLink = ns.LastLink:GetLastLink()
    local fix = false
    if itemLink then
        local searchText, exact = ns.Querier:ParseSearchText(itemLink)
        if searchText then
            searchText = '"' .. searchText .. '"'
            if text ~= searchText then
                text = searchText
                fix = true
            end
        end
    end

    self:SetText(text, fix)
    self:Show()
end
