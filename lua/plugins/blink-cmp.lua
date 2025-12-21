-- =============================================================================
-- BLINK.CMP: Lightning-Fast Code Completion
-- =============================================================================
-- WHAT: Intelligent completion with LSP, snippets, paths, and ripgrep searches
-- WHY:  Rust-powered fuzzy matching is faster and more accurate than built-in completion
-- HOW:  Lazy-loads on first insert; integrates LSP, LuaSnip, lazydev, and ripgrep
-- NOTE: Auto-show documentation disabled to reduce cognitive load; press C-y to view
-- KEYMAPS: C-space (show), C-e (hide), C-y (accept), C-n/p (navigate), C-f/b (scroll docs)
-- REFERENCE: https://github.com/saghen/blink.cmp
-- RELATED: lua/plugins/lsp.lua, lua/plugins/lazydev.lua
-- =============================================================================
return {
  'saghen/blink.cmp',
  lazy = true,
  version = '1.*',
  dependencies = {
    'folke/lazydev.nvim', -- Neovim API completions & type hints

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
      opts = {},
      dependencies = {
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
    },

    -- =========================================================================
    -- Project-wide code discovery via ripgrep/git grep
    -- -------------------------------------------------------------------------
    -- WHAT: Adds project codebase search to completion suggestions
    -- WHY:  Reduces typos, discovers patterns you've used, improves consistency
    -- HOW:  Searches tracked files (git grep) or entire project (ripgrep)
    -- NOTE: Configurable prefix length to avoid excessive searches
    -- -------------------------------------------------------------------------
    {
      'mikavilpas/blink-ripgrep.nvim',
      version = '*',
    },
  },
  opts = {
    keymap = {
      preset = 'default', -- Standard completion keybinds (C-n/C-p navigate)
    },
    appearance = {
      nerd_font_variant = 'mono', -- Use monospace Nerd Font icons
    },
    completion = {
      -- Disable auto-show docs to reduce visual noise (user can view with C-y)
      documentation = { auto_show = false, auto_show_delay_ms = 500 },
      -- Auto-select and auto-insert first completion match (faster workflow)
      list = {
        selection = {
          preselect = true, -- Automatically select first item
          auto_insert = true, -- Automatically insert selected item
        },
      },
    },
    sources = {
      default = { 'buffer', 'lsp', 'path', 'snippets', 'lazydev', 'ripgrep' },
      providers = {
        lazydev = {
          module = 'lazydev.integrations.blink',
          score_offset = 100, -- Boost Neovim API completions in priority
        },
        ripgrep = {
          module = 'blink-ripgrep',
          name = 'Ripgrep',
          opts = {
            -- Smart: prefer git grep, fallback to ripgrep
            backend = { use = 'gitgrep-or-ripgrep' },
          },
        },
      },
    },
    snippets = { preset = 'luasnip' },
    fuzzy = { implementation = 'prefer_rust_with_warning' }, -- Use Rust impl if available
    signature = { enabled = true }, -- Show function signatures while typing
  },
}
