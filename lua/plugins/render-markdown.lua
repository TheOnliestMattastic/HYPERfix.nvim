-- =============================================================================
-- RENDER-MARKDOWN.NVIM: Beautiful Markdown Rendering
-- =============================================================================
-- WHAT: Renders markdown beautifully with colors, icons, and enhanced formatting
-- WHY:  Plain markdown is hard to read; rendered view improves readability & focus
-- HOW:  Auto-loads for markdown files; can be toggled with <leader>um
-- NOTE: Uses Treesitter for syntax; works with Nerd Fonts for icons
-- KEYMAPS: <leader>um to toggle markdown rendering
-- REFERENCE: https://github.com/MeanderingProgrammer/render-markdown.nvim
-- RELATED: lua/plugins/treesitter.lua (syntax highlighting), lua/config/options.lua
-- =============================================================================-------------------------------------------------------------------
return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    lazy = true,
    event = { 'BufRead' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-mini/mini.nvim',
    },

    opts = {
      debounce = 75,
      render_modes = true,
      pipe_table = { preset = 'heavy' }, -- Changed from 'heavy' to boolean
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
