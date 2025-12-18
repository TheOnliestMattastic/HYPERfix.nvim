-- =============================================================================
-- LAZYDEV.NVIM: Lua Development Support
-- =============================================================================
-- WHAT: Provides type hints and completions for Neovim API and Lua libraries
-- WHY:  Enables IntelliSense for Vim objects (vim.api, vim.uv) and plugins
-- HOW:  Auto-loads on .lua files; integrates with blink.cmp for completion
-- NOTE: Library includes vim types, Snacks plugin types, and Luv async API
-- REFERENCE: https://github.com/folke/lazydev.nvim
-- RELATED: lua/plugins/blink-cmp.lua (provides completions), lua/plugins/lsp.lua
-- =============================================================================
return {
  'folke/lazydev.nvim',
  lazy = true,
  ft = 'lua',
  opts = {
    library = {
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      { path = 'snacks.nvim', words = { 'Snacks' } },
    },
  },
}
