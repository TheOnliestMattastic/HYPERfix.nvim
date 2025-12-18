-- =============================================================================
-- WHICH-KEY.NVIM: Keymap Discover & Display
-- =============================================================================
-- WHAT: Shows available keymaps in a menu when you pause after pressing <leader>
-- WHY:  Prevents keymap amnesia—you can discover commands instead of memorizing them
-- HOW:  Press <leader> and wait 1.25s (timeoutlen); menu shows all available actions
-- NOTE: Uses mnemonic groups (f=find, g=git, c=code) to make patterns predictable
-- KEYMAPS: <leader>? to show all keymaps
-- REFERENCE: https://github.com/folke/which-key.nvim
-- RELATED: lua/config/keymaps.lua, lua/config/options.lua (timeoutlen setting)
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
          icon = '󱕴', -- Show keymaps
        },
        {
          '<leader>e',
          icon = '󰨁', -- File explorer toggle
        },
        {
          '<leader><space>',
          desc = 'Smart Search',
          icon = '󰬯',
        },
        {
          '<leader>/',
          desc = 'Grep',
          icon = '󰍈',
        },
        {
          '<leader>:',
          desc = 'Command History',
          icon = '󱦟',
        },
        {
          '<leader>.',
          desc = 'Scratch Buffer',
          icon = '󰑷',
        },
        {
          '<leader>t',
          desc = '[T]erminal',
          icon = '󱃏',
        },

        -- =======================================================================
        -- Keymap Groups (submenu prefixes)
        -- =======================================================================
        {
          '<leader><tab>',
          group = '[TAB]',
          icon = '',
        },
        {
          '<leader>c',
          group = '[C]ode',
          icon = '󰓥',
        },
        {
          '<leader>d',
          group = '[D]ebug',
          icon = '󱇫',
        },
        {
          '<leader>f',
          group = '[F]ile/Find',
          icon = '󰆌',
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
          icon = '',
        },
        {
          '<leader>u',
          group = '[U]I',
          icon = '󱞠',
        },
        {
          '<leader>x',
          group = 'Inde[x]',
          icon = '󰴮',
        },

        -- =======================================================================
        -- Motion Groups (built-in vim motions)
        -- =======================================================================
        { '[', group = 'Prev' },
        { ']', group = 'Next' },
        {
          'g',
          group = '[G]oto',
          icon = '󱡮',
        },
        {
          'gs',
          group = '[S]urround',
          icon = '󰟫',
        },
        {
          'z',
          group = 'Fold',
          icon = '󱉋',
        },

        -- =======================================================================
        -- Dynamic Groups (auto-expanded based on buffer state)
        -- =======================================================================
        {
          '<leader>b',
          group = '[B]uffer',
          expand = function() return require('which-key.extras').expand.buf() end,
          icon = '󰯃',
        },
        {
          '<leader>w',
          group = '[W]indows',
          proxy = '<c-w>', -- Proxy to Vim's window commands
          expand = function() return require('which-key.extras').expand.win() end,
          icon = '󰮕',
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
