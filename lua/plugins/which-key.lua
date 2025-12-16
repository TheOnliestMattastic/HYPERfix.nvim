-- =============================================================================
-- WHICH-KEY.NVIM
-- REFERENCE: https://github.com/folke/which-key.nvim
-- =============================================================================

return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts_extend = { 'spec' }, -- Allow merging of spec arrays instead of replacing
  opts = {
    preset = 'helix', -- Use helix-style keybinding help UI
    delay = 0,
    defaults = {},
    -- Nerd Font icons for visual clarity
    icons = {
      breadcrumb = '󰯙 ', -- Active key combo breadcrumb
      separator = '', -- Key/label separator
      group = '', -- Group prefix
      ellipsis = '…',
    },
    -- Keymap groups and bindings with mnemonic organization
    spec = {
      {
        mode = { 'n', 'x' },
        -- =======================================================================
        -- Standalone Commands
        -- =======================================================================
        {
          '<leader>?',
          icon = '󰌓', -- Show keymaps
        },
        {
          '<leader>e',
          icon = '󰆌', -- File explorer toggle
        },
        {
          '<leader><space>',
          desc = 'Smart Search',
          icon = '',
        },
        {
          '<leader>/',
          desc = 'Grep',
          icon = '',
        },
        {
          '<leader>:',
          desc = 'Command History',
          icon = '󰋚',
        },
        {
          '<leader>.',
          desc = 'Scratch Buffer',
          icon = '󱧃',
        },
        {
          '<leader>t',
          desc = '[T]erminal',
          icon = '󰞷',
        },

        -- =======================================================================
        -- Keymap Groups (submenu prefixes)
        -- =======================================================================
        {
          '<leader><tab>',
          group = '[Tabs]',
          icon = '󰓩',
        },
        {
          '<leader>c',
          group = '[C]ode',
          icon = '',
        },
        {
          '<leader>d',
          group = '[D]ebug',
          icon = '󱇫',
        },
        {
          '<leader>f',
          group = '[F]ile/Find',
          icon = '󰑷',
        },
        {
          '<leader>g',
          group = '[G]it',
          icon = '󰊢',
        },
        {
          '<leader>h',
          group = '[H]elp',
          icon = '',
        },
        {
          '<leader>n',
          group = '[N]otification',
          icon = '󰷠',
        },
        {
          '<leader>q',
          group = '[Q]uit/Session',
          icon = '󰋣',
        },
        {
          '<leader>s',
          group = '[S]earch',
          icon = '',
        },
        {
          '<leader>u',
          group = '[U]I',
          icon = '󰆍',
        },
        {
          '<leader>x',
          group = 'Inde[x]',
          icon = '󰉹',
        },

        -- =======================================================================
        -- Motion Groups (built-in vim motions)
        -- =======================================================================
        { '[', group = 'Prev' },
        { ']', group = 'Next' },
        {
          'g',
          group = '[G]oto',
          icon = '󱓷'
        },
        {
          'gs',
          group = '[S]urround',
          icon = '󰅩'
        },
        {
          'z',
          group = 'Fold',
          icon = '󰘺'
        },

        -- =======================================================================
        -- Dynamic Groups (auto-expanded based on buffer state)
        -- =======================================================================
        {
          '<leader>b',
          group = '[B]uffer',
          expand = function() return require('which-key.extras').expand.buf() end,
          icon = '󰘓'
        },
        {
          '<leader>w',
          group = 'windows',
          proxy = '<c-w>', -- Proxy to Vim's window commands
          expand = function() return require('which-key.extras').expand.win() end,
          icon = '󰖲'
        },
      },
    },
  },
  keys = {
    {
      '<leader>?',
      function() require('which-key').show({ global = false }) end,
      desc = 'Keymaps',
    },
  },
  config = function(_, opts)
    local wk = require('which-key')
    wk.setup(opts)
  end,
}
