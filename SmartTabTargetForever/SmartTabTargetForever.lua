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
        DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99SmartTabTargetForever:|r Zona PvP detectada. TAB -> inimigo mais proximo.")
    else
        ClearOverrideBindings(frame)
    end
end

frame:SetScript("OnEvent", UpdateOverride)
UpdateOverride()
DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99SmartTabTargetForever:|r carregado. TAB mira jogador em zonas PvP.")
