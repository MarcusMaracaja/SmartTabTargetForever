# SmartTabTargetForever

<p align="center">
  <img src="LogoSmartTabTargetForever.jpg" alt="SmartTabTargetForever" width="360">
</p>

> **[English](#english)** · **[Português (ptBR)](#português-ptbr)**

---

## English

One tiny job done well for **WoW Forever** (Interface `16001`): in **PvP zones**, the `TAB` key targets the **nearest enemy player** (and `SHIFT-TAB` the previous one), instead of cycling regular targets.

### New in 1.3.0 — bilingual EN/PT

The addon now **reads your client locale automatically**: ptBR clients see Portuguese; every other locale sees English. No configuration needed.

### What it does

- When entering a PvP instance (`IsInInstance() == "pvp"`), it activates key overrides:
  - `TAB` → `TARGETNEARESTENEMYPLAYER`
  - `SHIFT-TAB` → `TARGETPREVIOUSENEMYPLAYER`
- When leaving the PvP zone, it restores the normal `TAB` behavior.
- Reacts to `PLAYER_ENTERING_WORLD` and `ZONE_CHANGED_NEW_AREA`.

### Requirements

- WoW Forever (Interface `16001`). Any locale — ptBR shows Portuguese, all other locales show English.

### Installation

Extract the ZIP from the [Release](../../releases) into `World of Warcraft\_forever_\Interface\AddOns\`. It should become `AddOns\SmartTabTargetForever\`. `/reload`.

### `/smarttab` — menu

Use **`/smarttab`** (alias **`/stt`**) to open the configuration window
(`SmartTabTargetForeverMainFrame`). The window has one tab, **About**:

- **What it is** — what the addon does (TAB → nearest enemy player in PvP instances).
- **How to use** — nothing to configure; it tells you the command to open this window.
- **Credits** — Marcus (creation and direction) and Inkling 2 Small Free (OpenCode) as
  development partner; derived from SmartTabTarget (WotLK).

### Origin

Derived from SmartTabTarget (WotLK), rewritten for the modern Forever client. **Marcus** — creation and direction; developed with AI assistance.

### License

MIT — see `LICENSE`.

---

## Português (ptBR)

Uma única coisa, bem feita para o **WoW Forever** (Interface `16001`): em **zonas PvP**, a tecla `TAB` mira no **jogador inimigo mais próximo** (e `SHIFT-TAB` no anterior), em vez de ciclar alvos normais.

### Novidades na 1.3.0 — bilíngue EN/PT

O addon agora **lê o idioma do seu cliente automaticamente**: clientes ptBR veem português; todos os outros veem inglês. Sem configuração.

### O que faz

- Ao entrar em instância PvP (`IsInInstance() == "pvp"`), ativa os overrides de tecla:
  - `TAB` → `TARGETNEARESTENEMYPLAYER`
  - `SHIFT-TAB` → `TARGETPREVIOUSENEMYPLAYER`
- Ao sair da zona PvP, restaura o comportamento normal de `TAB`.
- Reage a `PLAYER_ENTERING_WORLD` e `ZONE_CHANGED_NEW_AREA`.

### Requisitos

- WoW Forever (Interface `16001`). Qualquer locale — ptBR mostra português, demais locales mostram inglês.

### Instalação

Extraia o ZIP da [Release](../../releases) em `World of Warcraft\_forever_\Interface\AddOns\`. Deve ficar `AddOns\SmartTabTargetForever\`. `/reload`.

### `/smarttab` — menu

Use **`/smarttab`** (alias **`/stt`**) para abrir a janela de configuração
(`SmartTabTargetForeverMainFrame`). Hoje a janela tem uma aba, **Sobre**:

- **O que é** — o que o addon faz (TAB → inimigo mais próximo em instâncias PvP).
- **Como usar** — nada a configurar; aba diz o comando para abrir esta janela.
- **Créditos** — Marcus (criação e direção) e Inkling 2 Small Free (OpenCode) como
  parceiro de desenvolvimento; derivado do SmartTabTarget (WotLK).

### Origem

Derivado do SmartTabTarget (WotLK), reescrito para o cliente moderno do Forever. **Marcus** — criação e direção; desenvolvido com assistência de IA.

### Licença

MIT — ver `LICENSE`.
