-- =============================================================================
-- FLASH.NVIM: Lightning-Fast Motion Navigation
-- =============================================================================
-- WHAT: Jump anywhere visible using intuitive two-keystroke motions with labels
-- WHY:  Standard Vim motions (w, f, b) require multiple keypresses for distant targets.
--       Flash labels all matches so you jump in one or two keystrokes (neurodivergent-friendly!)
-- HOW:  Activate with 's' and type the target character; Flash labels each match
-- NOTE: Works in normal, visual, and operator modes. Integrates with d/c/y operators.
-- REFERENCE: https://github.com/folke/flash.nvim
-- =============================================================================-------------------------------------------------------------------
--
-- KEYMAPS AND USAGE
-- ==================
-- • s    : Search and jump to any visible character (normal/visual/op-pending)
-- • S    : Search within syntax tree (jump to language constructs)
-- • r    : Remote motion (use with operators: 'd', 'c', 'y', etc.)
-- • R    : Search syntax tree for operators
-- • C-s  : Toggle Flash search (e.g., disable if activated on accident)
--
-- EXAMPLES: 's' + 'f' = jump to next f, 'ds' + label = delete to target, 'c2s' = change
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
