-- =============================================================================
-- MASON.NVIM: Package Manager for LSP Servers & Tools
-- =============================================================================
-- WHAT: Install and manage language servers, formatters, linters, and debuggers
-- WHY:  LSP servers must be installed separately from Neovim; Mason provides a UI
-- HOW:  <leader>nm to open Mason UI; browse, press 'i' to install. Auto-integrated with plugins.
-- NOTE: Works with lspconfig (auto-attach), conform (formatters), dap (debuggers)
-- KEYMAPS: <leader>nm to open Mason
-- REFERENCE: https://github.com/williamboman/mason.nvim
-- RELATED: lua/plugins/lsp.lua (lspconfig), lua/plugins/conform.lua, lua/plugins/dap.lua
-- =============================================================================-------------------------------------------------------------------
return {
  'mason-org/mason.nvim',
  lazy = true,
  keys = { { '<leader>nm', '<cmd>Mason<cr>', desc = '[M]ason' } },
  opts = {
    ui = {
      icons = {
        package_installed = '󰳈',
        package_pending = '󰇠',
        package_uninstalled = '󰞇',
      },
    },
  },
}
