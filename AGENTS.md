# AGENTS.md - HYPERfix.nvim Configuration Assistant Guide

This document defines how AI agents should assist with configuring and maintaining HYPERfix.nvim, a universally designed Neovim template built with neurodivergent developers in mind.

## Core Philosophy

HYPERfix.nvim follows **KISSME** principles:

- **Keep It Stupidly Simple** — Code is explicit and easy to understand. No unnecessary complexity.
- **Modularize Everything** — Each concern has its own file.

Every code block follows a **WHAT/WHY/HOW/NOTE** pattern—pick 1-3 keywords that add value:

```lua
-- =============================================================================
-- PLUGIN_NAME
-- -----------------------------------------------------------------------------
-- WHAT: Brief description of what this does
-- WHY:  Brief explanation of why it's needed
-- HOW:  Brief technical explanation of how it works
-- NOTE: Any gotchas, alternatives, or reminders
-- -----------------------------------------------------------------------------
```

Guidelines:
- Pick only keywords that add non-redundant information (1-3 typically)
- Keep comments brief (1-2 lines per section)
- Use section headers with dashes for visual breaks
- Avoid explanations that merely repeat the code itself

## Design Principles

HYPERfix is built on **universal design** principles—accessibility is the foundation, not an afterthought.

### Visual Design (WCAG AAA Compliant)

- **Line spacing:** 4px (reduces eye strain, improves readability)
- **Color contrast:** 7:1 minimum ratio (WCAG AAA standard)

### Interaction Design

- **Thoughtful pacing:** 500ms `timeoutlen` for key sequences (time to think)
- **Mnemonic keymaps:** Logical patterns (`<leader>f` = find, `<leader>g` = git)

### Code & Organization

- **Explicit comments:** Every block explains design decisions
- **Clear organization:** Plugins organized by type, config by concern
- **Single responsibility:** One plugin per file (unless tightly coupled)
- **Error handling:** Graceful degradation when optional dependencies unavailable

## Plugin Installation & Configuration Workflow

Before installing or modifying any plugin, **ALWAYS** follow this workflow:

### 1. Review the official source

- Check the plugin's GitHub repository
- Verify Neovim version compatibility
- Understand dependencies and conflicts
- Note required setup or initialization steps

### 2. Audit current configuration

- Search `/lua/plugins/` for overlapping features
- Review `/lua/config/keymaps.lua` for keymap conflicts
- Check `/lua/config/options.lua` for related settings
- Identify existing plugins with similar functionality
- Look for configuration dependencies between plugins

### 3. Explain your analysis

- Document potential conflicts discovered
- List overlapping features with existing plugins
- Identify any keymap collisions
- Explain the impact of proposed changes
- Suggest alternatives if conflicts are problematic

### 4. Propose the solution

- Provide exact configuration code to add
- Specify which file(s) to modify and exactly where
- Include ADHD-friendly WHAT/WHY/HOW/NOTE comments
- Show any new or modified keymaps with descriptions

### 5. Get confirmation before proceeding

- Show the exact changes
- Explain any keymap changes and their mnemonics
- Document any UI/menu changes
- Confirm user understanding

## Keymap Standards

When creating or modifying keymaps:

- Use **mnemonic** prefix patterns (`<leader>f` = "find", `<leader>g` = "git")
- Document the mnemonic in comments: `-- Find operations (f = find)`
- Avoid Alt+key combinations (easier to miss modifier keys)
- **Always** update KEYMAPS.md after making changes
- **Respect Vim conventions** — Keep standard keybindings (`gd`, `gr`, `[q`, `]q`, etc.)
- **Hybrid approach** — Remap only awkward/uncommon bindings
- **Consistent patterns** — New keymaps should follow existing mnemonic scheme

## Trade-offs Discussion

When suggesting plugins or configurations, always discuss:

- **Performance impact** — Will this slow down startup?
- **Feature overlap** — Does this duplicate existing functionality?
- **Complexity vs benefit** — Is added complexity worth it?
- **Learning curve** — How much must the user learn?
- **Accessibility impact** — Does this help or hinder accessibility?
- **KISSME alignment** — Does this keep things simple and modular?
