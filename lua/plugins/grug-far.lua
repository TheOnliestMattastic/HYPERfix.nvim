-- =============================================================================
-- GRUG-FAR.NVIM: Advanced Find and Replace
-- =============================================================================
-- WHAT: Full-featured search & replace with live preview and safety checks
-- WHY:  Built-in substitute command is error-prone; grug-far shows changes before commit
-- HOW:  Opens dedicated buffer for search patterns; preview updates in real-time
-- NOTE: File-type auto-filtering helps avoid accidentally changing wrong file types
-- KEYMAPS: <leader>sr to open dialog (or GrugFar/GrugFarWithin commands)
-- REFERENCE: https://github.com/MagicDuck/grug-far.nvim
-- =============================================================================-------------------------------------------------------------------
return {
  {
    'MagicDuck/grug-far.nvim',
    lazy = true,
    event = { 'BufRead' },
    opts = { headerMaxWidth = 80 },
    cmd = { 'GrugFar', 'GrugFarWithin' },
    keys = {
      {
        '<leader>sr',
        function()
          local grug = require('grug-far')
          local ext = vim.bo.buftype == '' and vim.fn.expand('%:e')
          grug.open({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= '' and '*.' .. ext or nil,
            },
          })
        end,
        mode = { 'n', 'x' },
        desc = 'Search and [R]eplace',
      },
    },
  },
}
