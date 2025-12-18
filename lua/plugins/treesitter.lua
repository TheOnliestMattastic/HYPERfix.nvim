-- =============================================================================
-- TREESITTER: Advanced Syntax Highlighting & Text Objects
-- =============================================================================
-- WHAT: Parse-tree based syntax highlighting + smart text objects for code navigation
-- WHY:  Treesitter understands language structure (not just regexes), enabling precise highlighting & selections
-- HOW:  Auto-installs parsers on first use; integrates with textobjects and context plugins
-- NOTE: Includes textobjects (af, if, ac, ic), context panel, and text folding
-- REFERENCE: https://github.com/nvim-treesitter/nvim-treesitter
-- RELATED: lua/plugins/mini.lua (mini.ai for text objects), lua/config/keymaps.lua
-- =============================================================================-------------------------------------------------------------------
return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    branch = 'main',
    version = false,
    build = ':TSUpdate',
    event = { 'BufRead', 'BufNewFile' },
    dependencies = {

      -- ======================================================================
      -- TREESITTER-TEXTOBJECTS
      -- ----------------------------------------------------------------------
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = 'main',
        opts = {
          move = {
            enable = true,
            set_jumps = true,
          },
        },
      },

      -- ======================================================================
      -- TREESITTER-CONTEXT
      -- ----------------------------------------------------------------------
      {
        'nvim-treesitter/nvim-treesitter-context',
        opts = function()
          local tsc = require('treesitter-context')
          Snacks.toggle({
            name = '[T]reesitter Context',
            get = tsc.enabled,
            set = function(state)
              if state then
                tsc.enable()
              else
                tsc.disable()
              end
            end,
          }):map('<leader>ut')
          return { mode = 'cursor', max_lines = 3 }
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
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'jsonc',
        'lua',
        'luadoc',
        'luap',
        'markdown',
        'markdown_inline',
        'printf',
        'python',
        'query',
        'regex',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'xml',
        'yaml',
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
    config = function(_, opts) require('nvim-treesitter').setup({ opts }) end,
  },
}
