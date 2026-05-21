# ⚔️ HyperFix.nvim

![welcome](assets/welcome.png)

![preview](assets/preview.png)

![preview_2](assets/preview_2.png)

<a href="https://dotfyle.com/TheOnliestMattastic/hyperfixnvim"><img src="https://dotfyle.com/TheOnliestMattastic/hyperfixnvim/badges/plugins?style=for-the-badge" /></a>
<a href="https://dotfyle.com/TheOnliestMattastic/hyperfixnvim"><img src="https://dotfyle.com/TheOnliestMattastic/hyperfixnvim/badges/leaderkey?style=for-the-badge" /></a>
<a href="https://dotfyle.com/TheOnliestMattastic/hyperfixnvim"><img src="https://dotfyle.com/TheOnliestMattastic/hyperfixnvim/badges/plugin-manager?style=for-the-badge" /></a>
<a href="https://neovim.io/"><img src="https://img.shields.io/badge/Neovim-v0.11+-27C45E?style=for-the-badge&labelColor=2342AE&logo=neovim" /></a>
<a href="https://github.com/theonliestmattastic/hyperfix.nvim/actions"><img src="https://img.shields.io/github/actions/workflow/status/theonliestmattastic/hyperfix.nvim/lint-and-test.yml?branch=master&style=for-the-badge&labelColor=2342AE&color=27C45E" /></a>
<a href="https://github.com/theonliestmattastic/hyperfix.nvim"><img src="https://img.shields.io/github/languages/code-size/theonliestmattastic/hyperfix.nvim?style=for-the-badge&labelColor=2342AE&color=27C45E&logo=lua" /></a>
<a href="https://www.w3.org/WAI/WCAG21/quickref/"><img src="https://img.shields.io/badge/Accessibility-WCAG%20AAA-27C45E?style=for-the-badge&labelColor=2342AE" /></a>

> **A universally designed Neovim template for neurodivergent developers.** Built for brains that work differently—and think that's awesome.

## What Is This?

**HyperFix.nvim** is a Neovim configuration template that prioritizes **accessibility, clarity, and neurodivergent-friendly design** from the ground up.

**Built for learning.** HyperFix is designed to help new Neovim users (and anyone new to coding) learn by configuring and personalizing their setup. Extensive comments explain WHAT/WHY/HOW for every decision so you understand the system.

**AI-powered by design.** HyperFix integrates **[Sidekick.nvim](https://github.com/folke/sidekick.nvim)**, a modern AI assistant that provides **Next Edit Suggestions (NES)** via GitHub Copilot and an integrated terminal for AI CLI tools like Claude, Gemini, and Grok. AI isn't a distraction—it's a feature that reduces cognitive load and automates routine tasks.

### Core Philosophy: KISSME

- **Keep It Stupidly Simple** — Code that's explicit and easy to understand. No magic.
- **Modularize Everything** — Each concern lives in its own file. Find what you need fast.

### Neurodivergent-First Design

HyperFix is built around principles that help **ADHD, autism, dyslexia, and other neurodivergent folks**:

- **Clear visual hierarchy** — 4px line spacing + WCAG AAA contrast ratios.
- **Thoughtful pacing** — Longer timeouts (1250ms) for key sequences—time to think.
- **Mnemonic-Centric Keymaps** — `<leader>f` = files, `<leader>b` = buffers, `<leader>s` = search, `<leader>g` = git. Patterns you can predict.
- **Double-Tap Logic** — Most common actions use a double-tap for speed and simplicity (e.g., `<leader>gg` for LazyGit, `<leader>cc` for Format Code, `<leader>ss` for Smart Search).
- **Thematic Context** — A cohesive Legend of Zelda theme provides visual anchors and a sense of adventure.
- **Explicit documentation** — Every code block explains WHAT/WHY/HOW.

## The Kokiri Forest: A Personalized Zelda Theme

> _It's dangerous to go alone! Take this._
> 🔥 🧙‍♂️ 🔥
>    ⌨️

HyperFix embraces the **Legend of Zelda** universe as its thematic foundation. The Kokiri colorscheme, icons, and naming conventions create a **cohesive, immersive experience** that makes learning to code feel like an adventure.

## What's Inside?

- [folke/snacks.nvim](https://github.com/folke/snacks.nvim) — Dashboard, picker, and developer utilities.
- [echasnovski/mini.nvim](https://github.com/echasnovski/mini.nvim) — The "brain" of HyperFix. Modules for alignment, surround, file navigation, and more.
- [folke/sidekick.nvim](https://github.com/folke/sidekick.nvim) — AI sidekick with Next Edit Suggestions and CLI terminal.
- [zbirenbaum/copilot.lua](https://github.com/zbirenbaum/copilot.lua) — GitHub Copilot integration for AI features.
- [folke/flash.nvim](https://github.com/folke/flash.nvim) — Lightning-fast motion and Treesitter integration.
- [folke/which-key.nvim](https://github.com/folke/which-key.nvim) — Discoverable keymaps with clean descriptions.
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) — Advanced syntax highlighting and text objects.
- [saghen/blink.cmp](https://github.com/saghen/blink.cmp) — Lightning-fast completion engine.
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) — Language server setup.
- [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) — Consistent code formatting.

## Install Guide

### Dependencies

> Requires **Neovim 0.11+**. Always review the code before installing a configuration.

- **Neovim 0.11+**
- **Git**, **Ripgrep**, and **fd**
- **GitHub Copilot Subscription** (for NES features)
- **Node.js** (for AI CLIs and LSP support)
- **Nerd Font**: Atkinson Mono is recommended for optimal readability.

### Quick Install

Replace your Neovim config with HyperFix in one command:

**Linux/macOS:**

```bash
# Back up your current config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone HyperFix
git clone https://github.com/TheOnliestMattastic/hyperfix.nvim ~/.config/nvim

# Launch Neovim
nvim
```

### What Happens Next

1. **lazy.nvim** bootstraps itself automatically.
2. Plugins install on first launch.
3. **Mason** installs LSPs and formatters for your languages.

## Quick Start

1. **Explore keymaps**: Press `<leader>?` to discover all mappings.
2. **Open the file explorer**: Press `<leader>\` or `<leader>fe`.
3. **Smart Search**: Press `<leader>ss` to find anything.
4. **AI Sidekick**: Press `<leader>aa` to toggle the AI terminal.

All keymaps are **mnemonic** — if you remember the letter, you remember the command.

## Customization

HyperFix is designed to be personalized. Make it your own:

- **Keymaps**: `lua/config/keymaps.lua`
- **Editor settings**: `lua/config/options.lua`
- **Plugins**: `lua/plugins/` (one file per plugin; delete what you don't need)

## Philosophy & Design

### Why KISSME?

Neurodivergent brains often struggle with cognitive load and context-switching. HyperFix solves this by:
1. Keeping each piece **single-responsibility**.
2. Making every decision **explicit** with comments.
3. Removing **unnecessary complexity** to prevent decision paralysis.

### Accessibility First

HyperFix sets options with accessibility in mind: 4px line spacing (WCAG AAA), 1250ms timeouts, and centered scrolling. This helps everyone, especially those with ADHD, dyslexia, or motor challenges.

---

> _Time passes, people move... Like a river's flow, it never ends... A childish mind will turn to noble ambition... Young love will become deep affection... The clear water's surface reflects growth..._
>
> Shiek
