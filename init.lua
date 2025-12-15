--[[ ==========================================================================
          ▄ ▄
        █ ▀ ▀ █     ██████ ▄▄ ▄▄  ▄▄▄  ▄▄  ▄▄ ▄▄ ▄▄   ██  ██ ▄▄▄  ▄▄ ▄▄
       █       █      ██   ██▄██ ██▀██ ███▄██ ██▄█▀    ▀██▀ ██▀██ ██ ██
      █  ▄▄▄▄▄  █     ██   ██ ██ ██▀██ ██ ▀██ ██ ██     ██  ▀███▀ ▀███▀
    ▄ ▄         ▄ ▄              for using
  █ ▀ ▀ █     █ ▀ ▀ █   ██  ██ ██  ██ █████▄ ██████ █████▄  ▄▄▄▄▄ ▄▄ ▄▄ ▄▄
 █       █   █       █  ██████  ▀██▀  ██▄▄█▀ ██▄▄   ██▄▄██▄ ██▄▄  ██ ▀█▄█▀
█  ▄▄▄▄▄  █ █  ▄▄▄▄▄  █ ██  ██   ██   ██     ██▄▄▄▄ ██   ██ ██    ██ ██ ██
========================================================================== --]]

-- WHAT: HYPERfix.nvim entry point - loads configuration in order
-- WHY: Ensures predictable startup: options, plugins, keymaps
-- HOW: Requires Lua modules in dependency order
-- NOTE: Colorscheme set before lazy.nvim to avoid initial flash
-- REFERENCE: See README.md for quick start and philosophy
--            See KEYMAPS.md for complete keymap reference

-- ============================================================================
-- Load core editor options and settings
-- ----------------------------------------------------------------------------
require("config.options")

-- ============================================================================
-- Colorschemes
-- ----------------------------------------------------------------------------
-- local colorschemes = require("colorschemes")
-- colorschemes.kakariko.setup()

-- Alternative colorscheme generated with mini.hues and mini.colors
vim.cmd.colorscheme("kokiri")

-- ============================================================================
-- Load plugin manager and remaining configurations
-- ----------------------------------------------------------------------------
require("config.lazy")
require("config.keymaps")
require("config.autocmds")
