-- =============================================================================
-- TROUBLE.NVIM: Diagnostics & Quickfix Panel
-- =============================================================================
-- WHAT: Unified sidebar for viewing diagnostics, symbols, quickfix, and location lists
-- WHY:  Makes errors/warnings easier to scan and navigate than inline diagnostics alone
-- HOW:  Toggle sidebar with <leader>x? commands; navigate with <leader>x? or [q/]q
-- NOTE: Auto-integrates with LSP diagnostics and location lists; also shows symbols
-- KEYMAPS: <leader>xd/xD (diagnostics), <leader>xs (symbols), <leader>xl (location), <leader>xq (quickfix)
-- REFERENCE: https://github.com/folke/trouble.nvim
-- RELATED: lua/plugins/lsp.lua (diagnostics), lua/plugins/snacks.lua (picker integration)
-- =============================================================================-------------------------------------------------------------------
return {
  'folke/trouble.nvim',
  lazy = true,
  cmd = { 'Trouble' },
  opts = {
    modes = {
      lsp = {
        win = { position = 'right' }, -- LSP symbols appear on right side
      },
    },
  },
  keys = {
    {
      '<leader>xd',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = '[D]iagnostics',
    },
    {
      '<leader>xD',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer [D]iagnostics',
    },
    { '<leader>xs', '<cmd>Trouble symbols toggle<cr>', desc = '[S]ymbols' },
    {
      '<leader>xl',
      '<cmd>Trouble loclist toggle<cr>',
      desc = '[L]ocation List',
    },
    {
      '<leader>xq',
      '<cmd>Trouble qflist toggle<cr>',
      desc = '[Q]uickfix List',
    },
    {
      '[q',
      function()
        -- If Trouble is open, use Trouble navigation; otherwise use quickfix
        if require('trouble').is_open() then
          require('trouble').prev({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then vim.notify(err, vim.log.levels.ERROR) end
        end
      end,
      desc = 'Prev [Q]uickfix Item',
    },
    {
      ']q',
      function()
        -- If Trouble is open, use Trouble navigation; otherwise use quickfix
        if require('trouble').is_open() then
          require('trouble').next({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then vim.notify(err, vim.log.levels.ERROR) end
        end
      end,
      desc = 'Next [Q]uickfix Item',
    },
  },
}
