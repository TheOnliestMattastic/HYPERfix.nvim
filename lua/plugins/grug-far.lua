-- =============================================================================
-- REFERENCE: https://github.com/MagicDuck/grug-far.nvim
-- WHAT: Advanced search and replace with live preview
-- -----------------------------------------------------------------------------
return {
  {
    'MagicDuck/grug-far.nvim',
    lazy = true,
    event = { 'BufRead', 'VeryLazy' },
    opts = { headerMaxWidth = 80 },
    cmd = { 'GrugFar', 'GrugFarWithin' },
    keys = {
      {
        '<leader>sR',
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
