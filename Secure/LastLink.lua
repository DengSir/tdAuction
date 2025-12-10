-- LastLink.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 12/10/2025, 7:38:58 PM
--
---@type ns
local ns = select(2, ...)

---@class LastLink: AceModule, AceEvent-3.0, AceHook-3.0
local LastLink = ns.Addon:NewModule('LastLink', 'AceEvent-3.0', 'AceHook-3.0')
LastLink:Disable()

function LastLink:OnEnable()
    self:SecureHook('ChatEdit_InsertLink')

    self:SecureHook(BrowseName, 'SetText', 'BrowseNameSetText')
    self:HookScript(BrowseName, 'OnTextChanged', 'BrowseNameOnTextChanged')
end

function LastLink:OnDisable()
    self.lastLink = nil
    self.lastEdit = nil
end

function LastLink:GetLastLink()
    return self.lastLink
end

function LastLink:ChatEdit_InsertLink(link)
    if not BrowseName:IsVisible() then
        return
    end

    if GetTime() - (self.lastEdit or 0) > 0.1 then
        return
    end

    local text = BrowseName:GetText()
    local name = C_Item.GetItemInfo(link)
    if not name then
        return
    end
    if text ~= '"' .. name .. '"' then
        return
    end

    self.lastLink = link
end

function LastLink:BrowseNameSetText(edit, text)
    self.lastEdit = GetTime()
end

function LastLink:BrowseNameOnTextChanged(edit, text, userInput)
    self.lastEdit = GetTime()

    if userInput or text == '' then
        self.lastLink = nil
    end
end
