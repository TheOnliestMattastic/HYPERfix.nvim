-- =============================================================================
-- CONFORM.NVIM
-- REFERENCE: https://github.com/stevearc/conform.nvim
-- -----------------------------------------------------------------------------

return {
  'stevearc/conform.nvim',
  lazy = true,
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>cf',
      function()
        -- Format with fallback to LSP if conform formatter unavailable
        require('conform').format({ async = true, lsp_format = 'fallback' })
      end,
      mode = '',
      desc = '[F]ormat',
    },
  },
  opts = {
    notify_on_error = true,
    -- Per-filetype formatter configuration
    formatters_by_ft = {
      lua = { 'stylua' }, -- Lua: stylua formatter
    },
  },
}
