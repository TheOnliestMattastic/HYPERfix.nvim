return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts_extend = { 'spec' },
  opts = {
    preset = 'helix',
    defaults = {},
    icons = {
      breadcrumb = '󰯙 ', -- symbol used in the command line area that shows your active key combo
      separator = '', -- symbol used between a key and it's label
      group = '', -- symbol prepended to a group
      ellipsis = '…',
      keys = {
        Up = '󱨊 ',
        Down = '󱨉 ',
        Left = ' ',
        Right = ' ',
        C = '󰘴 ',
        M = '󰘵 ',
        D = '󰘳 ',
        S = '󰘶 ',
        CR = '󰌑 ',
        Esc = '󱊷 ',
        NL = '󰌑 ',
        BS = '󰭜',
        Space = '󱁐 ',
        Tab = '󰌒 ',
      },
    },
    spec = {
      {
        mode = { 'n', 'x' },
        {
          '<leader>?',
          icon = '󰌓',
        },
        {
          '<leader>e',
          icon = '󰆌',
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
        {
          '<leader>b',
          group = '[B]uffer',
          expand = function() return require('which-key.extras').expand.buf() end,
          icon = '󰘓'
        },
        {
          '<leader>w',
          group = 'windows',
          proxy = '<c-w>',
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
