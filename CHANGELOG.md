# Changelog

All notable changes to HyperFix.nvim are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2026-05-21

### 🚀 Major Changes

- **Renamed to HyperFix.nvim** — Updated project identity to a more standardized and polished format
- **Integrated sidekick.nvim** — Replaced legacy `amp-ai` with Folke's `sidekick.nvim`, featuring GitHub Copilot Next Edit Suggestions (NES) and an integrated AI CLI terminal
- **Mnemonic-Centric Keybinding System** — Complete reorganization of leader mappings into intuitive categories (Files, Buffers, Search, Git, Code, AI, UI, Quit)
- **Double-Tap Logic** — Optimized common actions with double-tap mnemonics: `<leader>gg` (LazyGit), `<leader>cc` (Format Code), `<leader>ss` (Smart Search), `<leader>qq` (Quit All)
- **Redundant Plugin Cleanup** — Slimmed down the configuration by removing `dap.lua`, `trouble.lua`, and `grug-far.lua` for a more focused, minimalistic experience

### ✨ Added

- **Thematic Visuals** — Integrated Legend of Zelda visual anchors.
- **Explorer Redundancy** — Added `<leader>\` as a secondary, fast access key for the File Explorer (`mini.files`)

### 🔧 Fixed

- **Visual Consistency** — Cleaned up all `which-key` menus and descriptions, removing legacy bracketed mnemonics for a professional UI
- **Behavioral Cleanup** — Removed rapid `jk`/`kj` escape mappings to prevent accidental mode switches
- **Standardized Comments** — Final sweep of ADHD-friendly WHAT/WHY/HOW comments across all configuration files

---

## [1.0.3] - 2025-12-31

### ✨ Added

- **Smart keyword skipping** — `<C-;>` now skips language keywords (lua: `then`, `do`, `end`, `else`, `elseif`) in addition to closing punctuation; filetype-aware for easy extension to other languages
- **Insert mode exit** — `<S-BS>` (Shift+Backspace) to exit insert mode faster than Esc
- **CAPS LOCK detection** — Overrode `J` keymap to warn when likely CAPS LOCK is on instead of joining lines (use `:join` if you need the original behavior)

### 📚 Documentation

- **KEYMAPS.md update** — Added new keymaps to "Smart Skip", "Insert Mode Control", and "Normal Mode Utilities" sections

---

## [1.0.2] - 2025-12-27

### 🔧 Fixed

- **Code comment standardization** — Refactored all config files to follow consistent WHAT/WHY/HOW pattern for clarity and learning
- **Lint plugin integration** — Added dedicated `lint.lua` plugin file for nvim-lint configuration
- **Configuration cleanup** — Removed duplicate stylua config from `.stylua.toml`
- **Formatter/linter consolidation** — Improved consistency across plugin specifications

---

## [1.0.1] - 2025-12-20

### ✨ Added

- **Markdown formatting** — Prettier integration for Conform
- **LSP inlay hints** — Function parameters and type hints inline for better code readability
- **C/C++ semantic tokens** — Clangd configuration with inlay hints enabled
- **Auto-install formatters** — Mason now auto-installs prettier, black, shfmt, and clang-format
- **Diagnostics toggle** — `<leader>uv` to show/hide virtual text diagnostics for focus

### 🔧 Fixed

- **Autocmd event** — Fixed wrap/colorcolumn toggle using `OptionSet` event instead of non-existent `Wrap` event
- **Blink.cmp configuration** — Corrected completion list selection structure (table with `preselect`/`auto_insert` instead of string)
- **Completion behavior** — Improved with auto-select and auto-insert of first match for faster workflow

### 🛠️ Infrastructure

- **CI workflow** — Removed stylua check due to missing luarocks dependency; kept startup validation

---

## [1.0.0] - 2025-12-18

### ✨ Added

- **Continuous Integration (CI/CD)** — Automated GitHub Actions workflow testing code formatting and config startup on every push
- **Status badges** — Visual indicators for CI status and code size in README
- **Comprehensive documentation** — AGENTS.md guidelines for AI-assisted configuration and customization
- **Neurodivergent-first design** — Built with accessibility principles (WCAG AAA contrast, 4px line spacing, 1250ms timeouts)
- **Mnemonic keymaps** — Predictable keymap patterns (`<leader>f` = find, `<leader>g` = git, `<leader>c` = code, `<leader>d` = debug)
- **Explicit code comments** — WHAT/WHY/HOW pattern on all code blocks for clarity and learning
- **Modular plugin architecture** — One plugin per file; easy to understand, customize, or remove
- **Kokiri Zelda theme** — Immersive visual theme with custom colorscheme and icons
- **Essential plugins**:
  - `mini.nvim` — Text alignment, surround, indentation, completion, file navigation
  - `snacks.nvim` — Dashboard, picker, and developer utilities
  - `flash.nvim` — Lightning-fast motion with Treesitter integration
  - `which-key.nvim` — Discoverable keymaps with descriptions
  - `trouble.nvim` — Beautiful diagnostic and search results viewer
  - `grug-far.nvim` — Find and replace with previews
  - `render-markdown.nvim` — Markdown rendering
  - `nvim-treesitter` — Syntax highlighting and text objects
  - `blink.cmp` — Fast completion engine
  - `nvim-lspconfig` — Language server setup
  - `nvim-dap` — Debugging support
  - `conform.nvim` — Code formatting
- **Mason integration** — Automated LSP and formatter installation
- **AMP integration** — AI-powered codebase understanding (optional, can be disabled)
- **Graceful degradation** — Missing optional dependencies won't break the editor
- **Cross-platform support** — macOS, Linux, Windows

### 🛠️ Infrastructure

- **GitHub Actions workflow** — Automated stylua formatting checks and config startup tests
- **Lua formatting** — Integrated with StyLua for consistent code style
- **Editor configuration** — `.editorconfig` for consistent indentation across tools
- **Linting configuration** — `.stylua.toml` and `selene.toml` for code quality

### 📚 Documentation

- **Comprehensive README** — Installation guide, quick start, customization instructions
- **Inline comments** — Every configuration file explains WHAT/WHY/HOW
- **KEYMAPS.md** — Complete keymap reference with mnemonics and descriptions
- **AGENTS.md** — Guidelines for AI-assisted configuration and universal design principles

### 🎯 Design Philosophy

- **KISSME principles** — Keep It Stupidly Simple, Modularize Everything
- **Accessibility first** — WCAG AAA compliance, thoughtful pacing, inclusive design
- **Learning-focused** — Built for newcomers to understand and customize their setup
- **Neurodivergent-friendly** — Reduces cognitive load with clear structure and explicit documentation

---

## Version History

**v1.0.0** is the first stable release of HYPERfix.nvim.

This represents the completion of the core feature set: a fully functional, well-documented Neovim configuration template that prioritizes accessibility and clarity for neurodivergent developers.
