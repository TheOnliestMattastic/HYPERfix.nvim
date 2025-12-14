-- =============================================================================
-- TREESITTER (Syntax Highlighting)
-- REFERENCE: https://github.com/nvim-treesitter/nvim-treesitter
--            https://github.com/nvim-treesitter/nvim-treesitter-textobjects
-- -----------------------------------------------------------------------------
return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    branch = "main",
    version = false,
    build = ":TSUpdate",
    event = { "BufRead", "BufNewFile", "BufEnter", "VeryLazy" },
    dependencies = {

      -- ======================================================================
      -- TREESITTER-TEXTOBJECTS
      -- ----------------------------------------------------------------------
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        lazy = true,
        event = { "BufRead", "BufNewFile", "BufEnter", "VeryLazy" },
        opts = {
          move = {
            enable = true,
            set_jumps = true,
          }
        }
      },

      -- ======================================================================
      -- TREESITTER-CONTEXT
      -- ----------------------------------------------------------------------
      {
        "nvim-treesitter/nvim-treesitter-context",
        lazy = true,
        event = { "BufRead", "BufNewFile", "BufEnter", "VeryLazy" },
        opts = function()
          local tsc = require("treesitter-context")
          Snacks.toggle({
            name = "[T]reesitter Context",
            get = tsc.enabled,
            set = function(state)
              if state then
                tsc.enable()
              else
                tsc.disable()
              end
            end,
          }):map("<leader>ut")
          return { mode = "cursor", max_lines = 3 }
        end,
      },
    },

    -- ========================================================================
    -- treesitter opts
    -- ------------------------------------------------------------------------
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      folds = { enable = true },
      sync_install = false,
      auto_install = true,
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gvv",
          node_incremental = "gvn",
          scope_incremental = "gvs",
          node_decremental = "gvp",
        },
      },
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },

      -- ======================================================================
      -- treesitter-textobjects config
      -- ----------------------------------------------------------------------
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V', -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },
          include_surrounding_whitespace = false,
        },
      },
    },

    -- ========================================================================
    -- setup treesitter
    -- ------------------------------------------------------------------------
    config = function(_, opts)
      require("nvim-treesitter").setup({opts})
    end,
  },
}
