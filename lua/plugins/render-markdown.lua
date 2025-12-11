-- REFERENCE: https://github.com/MeanderingProgrammer/render-markdown.nvim/wiki
return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    lazy = true,
    event = { "BufRead", "BufNewFile", "VeryLazy" },
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter', lazy = true },
      { 'nvim-mini/mini.nvim', lazy = true }
    },

    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      debounce = 75,
      render_modes = true,
      pipe_table = { present = 'heavy' },
      completions = { lsp = { enabled = true } },
    },
    ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
    config = function(_, opts)
      require("render-markdown").setup(opts)
      Snacks.toggle({
        name = "Render Markdown",
        get = require("render-markdown").get,
        set = require("render-markdown").set,
      }):map("\\m")
    end,
  }
}