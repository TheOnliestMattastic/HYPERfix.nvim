# v1.0.0 Release Notes

**HYPERfix.nvim — A universally designed Neovim template for neurodivergent developers.**

## What is HYPERfix?

HYPERfix is a complete Neovim configuration built from the ground up with accessibility and clarity in mind. It's designed for developers whose brains work differently—whether you have ADHD, autism, dyslexia, or simply benefit from explicit, well-organized systems.

## Key Features

✨ **Neurodivergent-First Design**
- Clear visual hierarchy (4px line spacing, WCAG AAA contrast)
- Thoughtful pacing (1250ms timeouts for key sequences)
- Mnemonic keymaps that make sense (`<leader>f` = find, `<leader>g` = git)
- Explicit documentation explaining WHAT/WHY/HOW for every decision

🎯 **Built for Learning**
- Modular architecture (one file = one feature)
- Extensive inline comments
- Easy to customize without understanding everything first
- Safe to delete plugins you don't need

⚔️ **Immersive Zelda Theme**
- Kokiri colorscheme with custom icons
- Cohesive, adventure-inspired experience
- Fully customizable

🚀 **Powerful Out of the Box**
- Mini.nvim for text operations and navigation
- Snacks.nvim for dashboard and picker
- Flash.nvim for lightning-fast motion
- LSP, DAP, and formatting pre-configured
- AMP AI integration (optional)

## Getting Started

### Quick Install

```bash
# Back up your current config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone HYPERfix
git clone https://github.com/theonliestmattastic/hyperfix.nvim ~/.config/nvim

# Launch Neovim
nvim
```

Lazy.nvim will automatically install all plugins on first launch.

### Dependencies

- Neovim 0.11+
- Git
- Ripgrep (for search)
- fd (for file finding)
- Optional: AMP CLI for AI-assisted configuration

See [INSTALL](README.md#install-guide) for platform-specific instructions.

## What's Inside

- **13 core plugins** carefully selected for accessibility and power
- **Mnemonic keymaps** across find, git, code, debug operations
- **Graceful degradation** — missing tools won't break your editor
- **Mason integration** — automatic LSP and formatter installation
- **CI/CD ready** — GitHub Actions workflow included

## Philosophy: KISSME

- **Keep It Stupidly Simple** — Explicit, easy-to-understand code
- **Modularize Everything** — Each concern has its own file

This keeps cognitive load low and makes customization intuitive.

## For Neurodivergent Developers

HYPERfix is built around evidence-based principles for ADHD, autism, dyslexia, and other neurodivergent needs:

- **External structure** as cognitive support (not a limitation)
- **Mnemonic patterns** to reduce working memory load
- **Pacing and time** to think (1250ms timeouts)
- **Clear visual hierarchy** to reduce decision fatigue
- **Explicit documentation** to enable independent learning

These principles benefit *everyone*, not just neurodivergent folks.

## Documentation

- **[README.md](README.md)** — Overview, philosophy, customization guide
- **[KEYMAPS.md](KEYMAPS.md)** — Complete keymap reference
- **[AGENTS.md](AGENTS.md)** — AI-assisted configuration guidelines
- **[CHANGELOG.md](CHANGELOG.md)** — Version history and features

## Community & Support

- Found a bug? Open an issue
- Have an accessibility suggestion? We'd love to hear it
- Want to improve documentation? PRs welcome

This is a personal project, but feedback and contributions are appreciated.

## License

GNU General Public License v3.0 — [See LICENSE](LICENSE)

---

**Made with ⚔️ and 💚 by someone who understands that neurodivergent brains are a feature, not a bug.**
