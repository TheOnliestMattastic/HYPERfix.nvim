-- =============================================================================
-- FLASH.NVIM - Smart Character-Based Navigation
-- -----------------------------------------------------------------------------
-- WHAT: Fast navigation with intelligent character labels across visible text
-- WHY:  Motions like `w`, `f`, and `b` require multiple keystrokes to reach
--       distant targets. Flash provides 1-2 keystrokes to jump anywhere visible.
-- HOW:  Press 's' to activate Flash. Type any visible character and Flash will
--       label all matches with keyboard shortcuts. Press the shortcut to jump.
-- NOTE: Works in normal, visual, and operator-pending modes. Respects Vim's
--       language and motion semantics (can be used with operators like 'd', 'c').
--
-- REFERENCE: https://github.com/folke/flash.nvim
-- -----------------------------------------------------------------------------
--
-- QUICK START
-- -----------
-- • s    : Search and jump to any visible character (normal/visual/op-pending)
-- • S    : Search within syntax tree (jump to language constructs)
-- • r    : Remote motion (use with operators: 'd', 'c', 'y', etc.)
-- • R    : Search syntax tree for operators
-- • C-s  : Toggle Flash search (e.g., disable if activated on accident)
--
-- EXAMPLE USAGE
-- -----------
-- Normal mode:
--   • Press 's', then type 'f' to highlight all 'f' characters and their labels.
--   • Type the label (e.g., 'a') to jump to that location.
--   • Repeat: 'sfe' jumps to nearest 'e' that matches your label.
--
-- Operator-pending (delete/change/yank):
--   • Press 'ds' (delete with Flash motion) to delete up to your target.
--   • Flash prompts: select label to delete.
--   • Works with 'c' (change), 'y' (yank), and other operators.
--
-- Visual mode:
--   • Enter visual mode with 'v' or 'V'.
--   • Use 's' to extend selection to a target character.
--   • Useful for multi-line selections without counting lines.
-- =============================================================================
return {
  {
    'folke/flash.nvim',
    lazy = true,
    opts = {},
    keys = {
      {
        's',
        mode = { 'n', 'x', 'o' },
        function() require('flash').jump() end,
        desc = 'Flash [S]earch',
      },

      {
        'S',
        mode = { 'n', 'x', 'o' },
        function() require('flash').treesitter() end,
        desc = 'Flash Tree[s]itter',
      },

      {
        'r',
        mode = 'o',
        function() require('flash').remote() end,
        desc = '[R]emote Flash',
      },

      {
        'R',
        mode = { 'o', 'x' },
        function() require('flash').treesitter_search() end,
        desc = 'T[r]eesitter Search',
      },

      {
        '<c-s>',
        mode = { 'c' },
        function() require('flash').toggle() end,
        desc = 'Toggle Flash [S]earch',
      },
    },
  },
}
