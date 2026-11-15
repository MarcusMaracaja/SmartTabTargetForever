-- SmartTabTargetForever / Locales.lua
-- Localização do addon (ptBR / English). Carregado ANTES de SmartTabTargetForever.lua
-- (ver SmartTabTargetForever.toc). O idioma é escolhido pelo locale do cliente:
-- ptBR -> português; qualquer outro locale -> inglês.

local addonName = "SmartTabTargetForever"
local L = {}

local ptBR = {
    -- Chat
    pvp_zone   = "|cff33ff99SmartTabTargetForever:|r Zona PvP detectada. TAB -> inimigo mais proximo.",
    loaded     = "|cff33ff99SmartTabTargetForever:|r carregado. /smarttab abre o menu.",

    -- GUI
    about_tab      = "Sobre",
    version        = "Versão 1.3.0 · WoW Forever (Interface 16001)",
    s1_header      = "O que é",
    s1_body        = "O SmartTabTargetForever é um addon minimalista para o WoW Forever. Dentro de **zonas PvP** (instâncias PvP / BGs), ele troca o comportamento da tecla TAB: em vez de ciclar alvos comuns, passa a mirar diretamente no **jogador inimigo mais próximo** (dando ao jogador uma mira tática para combate PvP).\n\nAo sair da zona PvP, o TAB volta ao comportamento normal — tudo automático, sem precisar configurar nada.",
    s2_header      = "Como usar",
    s2_body        = "Nada a fazer: entre numa instância PvP e pressione TAB. Se quiser abrir esta janela, use **/smarttab** ou **/stt**. Em zonas PvE (no aberto de mundo), o comportamento é o padrão do jogo.",
    s3_header      = "Créditos — criação",
    s3_body        = "|cffffffffMarcus|r — criação e direção do SmartTabTargetForever.\n\n|cffffffffInkling 2 Small Free (OpenCode)|r — parceiro de tecnologia e desenvolvimento: inteligência artificial usada como par de programação.\n\nDerivado do SmartTabTarget (WotLK), com lógica adaptada para o cliente moderno do WoW Forever.",
}

local enUS = {}
for k, v in pairs(ptBR) do enUS[k] = v end

enUS.pvp_zone   = "|cff33ff99SmartTabTargetForever:|r PvP zone detected. TAB -> nearest enemy player."
enUS.loaded     = "|cff33ff99SmartTabTargetForever:|r loaded. /smarttab opens the menu."
enUS.about_tab  = "About"
enUS.version    = "Version 1.3.0 · WoW Forever (Interface 16001)"
enUS.s1_header  = "What it is"
enUS.s1_body    = "SmartTabTargetForever is a minimalist addon for WoW Forever. In **PvP zones** (PvP instances / BGs), it overrides the TAB key: instead of cycling regular targets, it targets directly the **nearest enemy player** (giving you a tactical aim for PvP combat).\n\nWhen you leave the PvP zone, TAB returns to its normal behavior — fully automatic, nothing to configure."
enUS.s2_header  = "How to use"
enUS.s2_body    = "Nothing to do: enter a PvP instance and press TAB. To open this window, use **/smarttab** or **/stt**. In PvE zones (open world), the default game behavior applies."
enUS.s3_header  = "Credits — creation"
enUS.s3_body    = "|cffffffffMarcus|r — creation and direction of SmartTabTargetForever.\n\n|cffffffffInkling 2 Small Free (OpenCode)|r — technology and development partner: artificial intelligence used as a pair programmer.\n\nDerived from SmartTabTarget (WotLK), adapted to the modern WoW Forever client."

if GetLocale() == "ptBR" then
    for k, v in pairs(ptBR) do L[k] = v end
else
    for k, v in pairs(enUS) do L[k] = v end
end

-- Fallback: qualquer chave ausente devolve a própria chave (nunca nil)
setmetatable(L, { __index = function(_, key) return key end })

-- Exporta no global do addon (a .lua principal lê daqui)
local s = _G[addonName] or {}
s.L = L
_G[addonName] = s
