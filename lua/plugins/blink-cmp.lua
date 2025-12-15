-- =============================================================================
-- BLINK.CMP
-- -----------------------------------------------------------------------------
-- WHAT: Fast, minimal completion engine for Neovim (LSP, snippets, paths)
-- WHY:  Replaces built-in completion with Rust-powered fuzzy matching & docs
-- HOW:  Integrates LuaSnip for snippets, lazydev for Neovim API completions
-- NOTE: Lazy-loaded; auto-show documentation disabled to reduce visual clutter
-- -----------------------------------------------------------------------------
return {
  'saghen/blink.cmp',
  lazy = true,
  version = '1.*',
  dependencies = {
    -- =========================================================================
    -- Snippet Engine: LuaSnip
    -- -------------------------------------------------------------------------
    -- WHAT: Snippet engine supporting VSCode-style snippets
    -- WHY:  Enables snippet expansion (e.g., function templates, boilerplate)
    -- HOW:  Loads community snippets from friendly-snippets on startup
    -- -------------------------------------------------------------------------
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = 'make install_jsregexp', -- Required for regex support in snippets
      dependencies = {
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
      opts = {},
    },
    -- Neovim API completions & type hints
    'folke/lazydev.nvim',
  },
  opts = {
    -- =========================================================================
    -- Keymap Preset
    -- -------------------------------------------------------------------------
    keymap = {
      preset = 'default', -- Standard completion keybinds (C-n/C-p navigate)
    },

    -- =========================================================================
    -- Appearance
    -- -------------------------------------------------------------------------
    appearance = {
      nerd_font_variant = 'mono', -- Use monospace Nerd Font icons
    },

    -- =========================================================================
    -- Completion Behavior
    -- -------------------------------------------------------------------------
    completion = {
      -- Disable auto-show docs to reduce visual noise (user can view with C-y)
      documentation = { auto_show = false, auto_show_delay_ms = 500 },
    },

    -- =========================================================================
    -- Completion Sources & Priorities
    -- -------------------------------------------------------------------------
    sources = {
      default = { 'lsp', 'path', 'snippets', 'lazydev' },
      providers = {
        lazydev = {
          module = 'lazydev.integrations.blink',
          score_offset = 100, -- Boost Neovim API completions in priority
        },
      },
    },

    -- =========================================================================
    -- Snippets & Fuzzy Matching
    -- -------------------------------------------------------------------------
    snippets = { preset = 'luasnip' },
    fuzzy = { implementation = 'prefer_rust_with_warning' }, -- Use Rust impl if available
    signature = { enabled = true }, -- Show function signatures while typing
  },
}
