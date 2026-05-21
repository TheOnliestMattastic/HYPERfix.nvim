-- =============================================================================
-- MINI.NVIM: The "Brain" - Collection of Small Modular Plugins
-- -----------------------------------------------------------------------------
-- WHAT: Collection of 20+ small, independent plugins (files, surround, AI, align, etc.)
-- WHY:  Replaces many single-purpose plugins with one consistent, well-documented package
-- HOW:  Enable/disable individual modules in config; each module handles one concern
-- NOTE: Includes mini.sessions for session management; extremely modular and lightweight
-- REFERENCE: https://github.com/echasnovski/mini.nvim
-- MODULES: ai (text objects), files (explorer), sessions, align, surround, operators, etc.
-- -----------------------------------------------------------------------------
return {
  {
    "echasnovski/mini.nvim",
    version = false,
    event = { "VeryLazy" },
    config = function()
      -- =======================================================================
      -- mini.ai
      -- -----------------------------------------------------------------------
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
            i = "@function.inner",
          }),

          -- class
          c = ai.gen_spec.treesitter({
            a = "@class.outer",
            i = "@class.inner",
          }),

          -- tags
          t = {
            "<([%p%w]-)%f[^<%w][^<>]->.-</%1>",
            "^<.->().*()</[^/]->$",
          },

          -- digits
          d = { "%f[%d]%d+" },

          -- Word with case
          e = {
            {
              "%u[%l%d]+%f[^%l%d]",
              "%f[%S][%l%d]+%f[^%l%d]",
              "%f[%P][%l%d]+%f[^%l%d]",
              "^[%l%d]+%f[^%l%d]",
            },
            "^().*()$",
          },
        },
      })

      -- =======================================================================
      -- mini.files
      -- -----------------------------------------------------------------------
      require("mini.files").setup({
        windows = { preview = true },
      })
      -- keymap
      local mini_files_toggle = function()
        if not require("mini.files").close() then
          require("mini.files").open()
        end
      end
      vim.keymap.set("n", "<leader>fe", mini_files_toggle, { desc = "Explorer" })
      vim.keymap.set("n", "<leader>\\", mini_files_toggle, { desc = "Explorer" })

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesActionRename",
        callback = function(event)
          Snacks.rename.on_rename_file(event.data.from, event.data.to)
        end,
      })

      -- =======================================================================
      -- mini.hues: useful for generating colorschemes
      -- -----------------------------------------------------------------------
      -- require("mini.hues").setup({
      --   background = '#122030',
      --   foreground = '#A2FAA2',
      --   saturation = 'mediumhigh',
      --   accent = 'bg',
      -- })

      -- =======================================================================
      -- mini.sessions: Session management
      -- -----------------------------------------------------------------------
      require("mini.sessions").setup({
        autoread = false, -- Don't auto-restore on startup
        autowrite = false, -- Don't auto-save on exit
        directory = vim.fn.stdpath("data") .. "/sessions", -- ~/.local/share/nvim/sessions
      })

      require("mini.align").setup()
      require("mini.bracketed").setup()
      require("mini.colors").setup()
      require("mini.icons").setup()
      require("mini.move").setup()
      require("mini.operators").setup()
      require("mini.pairs").setup()
      require("mini.splitjoin").setup()
      require("mini.statusline").setup()
      require("mini.surround").setup()
      require("mini.tabline").setup()
      require("mini.visits").setup()
    end,
  },
}
