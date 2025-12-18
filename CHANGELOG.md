# Changelog

All notable changes to HYPERfix.nvim are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
