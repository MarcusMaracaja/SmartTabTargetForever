-- SmartTabTargetForever.lua
-- Em zonas PvP, TAB mira no jogador inimigo mais proximo.
-- Janela de configuracoes: /smarttab (alias /stt) — aba "Sobre" com explicacao do addon.
local L = (_G["SmartTabTargetForever"] and _G["SmartTabTargetForever"].L) or {}

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")

local function IsInPvPZone()
    local inInstance, instanceType = IsInInstance()
    return inInstance and instanceType == "pvp"
end

local function UpdateOverride()
    if IsInPvPZone() then
        SetOverrideBinding(frame, true, "TAB", "TARGETNEARESTENEMYPLAYER")
        SetOverrideBinding(frame, true, "SHIFT-TAB", "TARGETPREVIOUSENEMYPLAYER")
        DEFAULT_CHAT_FRAME:AddMessage(L.pvp_zone)
    else
        ClearOverrideBindings(frame)
    end
end

frame:SetScript("OnEvent", UpdateOverride)

-- =====================================================
-- JANELA /smarttab — aba "Sobre"
-- =====================================================
local mainFrame = nil
local function CreateMainFrame()
    if mainFrame then return mainFrame end

    local f = CreateFrame("Frame", "SmartTabTargetForeverMainFrame", UIParent, "BackdropTemplate")
    f:SetSize(460, 520)
    f:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)
    f:SetClampedToScreen(true)
    f:SetFrameStrata("DIALOG")
    f:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 24,
        insets = { left = 8, right = 8, top = 8, bottom = 8 }
    })
    f:SetBackdropColor(0, 0, 0, 0.9)

    -- Barra de titulo
    local titleBg = f:CreateTexture(nil, "ARTWORK")
    titleBg:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
    titleBg:SetWidth(280)
    titleBg:SetHeight(48)
    titleBg:SetPoint("TOP", f, "TOP", 0, 12)

    local titleText = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    titleText:SetPoint("TOP", titleBg, "TOP", 0, -14)
    titleText:SetText("|cff33ff99SmartTabTargetForever|r")

    local closeBtn = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    closeBtn:SetPoint("TOPRIGHT", f, "TOPRIGHT", -4, -4)
    closeBtn:SetScript("OnClick", function() f:Hide() end)

    tinsert(UISpecialFrames, "SmartTabTargetForeverMainFrame")

    -- Barra de abas (uma aba: "Sobre" — igual ao padrao visual do SpellFlash Forever)
    local tabContainer = CreateFrame("Frame", nil, f)
    tabContainer:SetPoint("TOPLEFT", 12, -32)
    tabContainer:SetSize(436, 30)
    f.tabContainer = tabContainer

    local scroll = CreateFrame("ScrollFrame", "SmartTabTargetForeverMainFrameScroll", f, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", 12, -64)
    scroll:SetPoint("BOTTOMRIGHT", -12, 12)
    local content = CreateFrame("Frame", nil, scroll)
    content:SetSize(424, 900)
    scroll:SetScrollChild(content)
    f.content = content

    local aboutBtn = CreateFrame("Button", nil, tabContainer, "UIPanelButtonTemplate")
    aboutBtn:SetSize(110, 24)
    aboutBtn:SetPoint("TOPLEFT", tabContainer, "TOPLEFT", 0, 0)
    aboutBtn:SetText(L.about_tab)
    aboutBtn:Disable()

    -- =====================================================
    -- ABA SOBRE
    -- =====================================================
    local title = content:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText("|cff33ff99SmartTabTargetForever|r")

    local version = content:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    version:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -4)
    version:SetText(L.version)

    local function AddSection(anchorTo, yOffset, header, body)
        local h = content:CreateFontString(nil, "ARTWORK", "GameFontNormal")
        h:SetPoint("TOPLEFT", anchorTo, "BOTTOMLEFT", 0, yOffset)
        h:SetText("|cffffd700" .. header .. "|r")
        local b = content:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        b:SetPoint("TOPLEFT", h, "BOTTOMLEFT", 0, -4)
        b:SetWidth(392)
        b:SetJustifyH("LEFT")
        b:SetJustifyV("TOP")
        b:SetNonSpaceWrap(true)
        b:SetText(body)
        return b
    end

    local s1 = AddSection(version, -14, L.s1_header, L.s1_body)

    local s2 = AddSection(s1, -14, L.s2_header, L.s2_body)

    local s3 = AddSection(s2, -14, L.s3_header, L.s3_body)

    mainFrame = f
    f:Hide()
    return f
end

local function ToggleGUI()
    local gui = CreateMainFrame()
    if gui:IsShown() then
        gui:Hide()
    else
        gui:Show()
    end
end

SLASH_SMARTTABTARGET1 = "/smarttab"
SLASH_SMARTTABTARGET2 = "/stt"
SlashCmdList["SMARTTABTARGET"] = ToggleGUI

UpdateOverride()
DEFAULT_CHAT_FRAME:AddMessage(L.loaded)
