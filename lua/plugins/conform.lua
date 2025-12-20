-- =============================================================================
-- CONFORM.NVIM: Code Formatter Integration
-- =============================================================================
-- WHAT: Unified interface for running code formatters (stylua, prettier, etc.)
-- WHY:  Automatic code formatting ensures consistent style without manual effort
-- HOW:  Lazy-loads on save; uses `lsp_format = 'fallback'` to use LSP if no formatter
-- NOTE: Each language can have multiple formatters; Conform tries them in order
-- KEYMAPS: <leader>cf to format current buffer
-- REFERENCE: https://github.com/stevearc/conform.nvim
-- RELATED: lua/config/options.lua (formatoptions), lua/plugins/lsp.lua
-- =============================================================================

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
      lua = { 'stylua' },      -- Lua: stylua formatter
      markdown = { 'prettier' }, -- Markdown: prettier formatter
    },
  },
}
