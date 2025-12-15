-- =============================================================================
-- RENDER-MARKDOWN
-- REFERENCE: https://github.com/MeanderingProgrammer/render-markdown.nvim/wiki
-- -----------------------------------------------------------------------------
return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    lazy = true,
    event = { 'BufRead' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-mini/mini.nvim'
    },

    opts = {
      debounce = 75,
      render_modes = true,
      pipe_table = { present = 'heavy' },
      completions = { lsp = { enabled = true } },
    },
    ft = { 'markdown', 'norg', 'rmd', 'org', 'codecompanion' },
    config = function(_, opts)
      require('render-markdown').setup(opts)
      Snacks.toggle({
        name = 'Render [M]arkdown',
        get = require('render-markdown').get,
        set = require('render-markdown').set,
      }):map('<leader>um')
    end,
  },
}
