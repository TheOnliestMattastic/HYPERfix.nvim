-- =============================================================================
-- MASON.NVIM - Package Manager for Language Servers
-- =============================================================================
-- WHAT: Install and manage language servers, formatters, and linters
-- WHY:  LSP servers and tools must be installed separately from Neovim.
--       Mason provides a unified UI to install/update them without terminal.
-- HOW:  Press '<leader>nm' to open Mason. Browse packages, press 'i' to install.
--       Installed tools are automatically used by LSP, conform, and other plugins.
-- NOTE: Works with nvim-lspconfig to automatically attach servers to buffers.
--
-- REFERENCE: https://github.com/williamboman/mason.nvim
-- -----------------------------------------------------------------------------
return {
  "mason-org/mason.nvim",
  lazy = true,
  event = { 'BufRead', 'BufNewFile', 'BufEnter', 'VeryLazy' },
  keys = { { '<leader>nm', '<cmd>Mason<cr>', desc = '[M]ason' } },
  opts = {
    ui = {
      icons = {
        package_installed = "󰳈",
        package_pending = "󰇠",
        package_uninstalled = "󰞇"
      }
    }
  }
}
