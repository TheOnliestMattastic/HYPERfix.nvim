-- MINI.NVIM: The "Brain"
-- RESOURCE: https://github.com/echasnovski/mini.nvim
return {
  {
    "echasnovski/mini.nvim",
    version = false,
    lazy = true,
    config = function()

      -- ======================================================================
      -- mini.ai
      -- ----------------------------------------------------------------------
      local ai = require("mini.ai")
      ai.setup({
        n_lines = 500,
        custom_textobjects = {

          -- code block
          o = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }),

          -- function
          f = ai.gen_spec.treesitter({
            a = "@function.outer",
            i = "@function.inner"
          }),

          -- class
          c = ai.gen_spec.treesitter({
            a = "@class.outer",
            i = "@class.inner"
          }),

          -- tags
          t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>",
            "^<.->().*()</[^/]->$"
          },

          -- digits
          d = { "%f[%d]%d+" },

          -- Word with case
          e = {{                               
            "%u[%l%d]+%f[^%l%d]",
            "%f[%S][%l%d]+%f[^%l%d]",
            "%f[%P][%l%d]+%f[^%l%d]",
            "^[%l%d]+%f[^%l%d]"},
            "^().*()$",
          },
        },
      })

      require("mini.bracketed").setup()
      require("mini.colors").setup()
      require("mini.files").setup()

      -- ======================================================================
      -- mini.hues: useful for generating colorschemes
      -- ----------------------------------------------------------------------
      -- require("mini.hues").setup({
      --   background = '#122030',
      --   foreground = '#A2FAA2',
      --   saturation = 'mediumhigh',
      --   accent = 'bg',
      -- })

      require("mini.surround").setup()
      require("mini.operators").setup()
      require("mini.move").setup()
      require("mini.pairs").setup()
      require("mini.visits").setup()

      -- ======================================================================
      -- Mini Files Keymap
      -- ----------------------------------------------------------------------
      vim.keymap.set("n", "<leader>e", function()
        if not require("mini.files").close() then require("mini.files").open() end
      end, { desc = "Toggle Mini Files" })
    end,
  },
}