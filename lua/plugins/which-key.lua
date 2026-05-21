-- =============================================================================
-- WHICH-KEY.NVIM: Keymap Discover & Display
-- -----------------------------------------------------------------------------
-- WHAT: Shows available keymaps in a menu when you pause after pressing <leader>
-- WHY:  Prevents keymap amnesia—you can discover commands instead of memorizing them
-- HOW:  Press <leader> and wait 1.25s (timeoutlen); menu shows all available actions
-- NOTE: Uses mnemonic groups (f=find, g=git, c=code) to make patterns predictable
-- REFERENCE: https://github.com/folke/which-key.nvim
-- KEYMAPS: <leader>? to show all keymaps
-- RELATED: lua/config/keymaps.lua, lua/config/options.lua (timeoutlen setting)
-- -----------------------------------------------------------------------------
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts_extend = { "spec" }, -- Allow merging of spec arrays instead of replacing
  opts = {
    preset = "helix", -- Use helix-style keybinding help UI
    delay = 0,
    defaults = {},
    icons = {
      breadcrumb = "󰯙 ", -- Active key combo breadcrumb
      separator = "", -- Key/label separator
      group = "", -- Group prefix
      ellipsis = "…",
    },
    -- Keymap groups and bindings with mnemonic organization
    spec = {
      {
        mode = { "n", "x" },
        -- =====================================================================
        -- Standalone Commands
        -- ---------------------------------------------------------------------
        {
          "<leader>?",
          function() require("which-key").show({ global = true }) end,
          desc = "Keymaps",
          icon = "󱕴",
        },
        {
          "<leader>\\",
          desc = "Explorer",
          icon = "",
        },
        {
          "<leader>ss",
          desc = "Smart Search",
          icon = "󰬯",
        },
        {
          "<leader><space>",
          desc = "Flash Search",
          icon = "󰍈",
        },
        {
          "<leader>:",
          desc = "Command History",
          icon = "󱦟",
        },
        {
          "<leader>.",
          desc = "Scratch Buffer",
          icon = "󰑷",
        },
        {
          "<leader>t",
          desc = "Terminal",
          icon = "",
        },

        -- =====================================================================
        -- Keymap Groups (submenu prefixes)
        -- ---------------------------------------------------------------------
        {
          "<leader><tab>",
          group = "Tabs",
          icon = "",
        },
        {
          "<leader>a",
          group = "AI",
          icon = "󱨚",
        },
        {
          "<leader>b",
          group = "Buffers",
          icon = "󰯃",
        },
        {
          "<leader>c",
          group = "Code",
          icon = "󰓥",
        },
        {
          "<leader>f",
          group = "Files",
          icon = "󱄯",
        },
        {
          "<leader>g",
          group = "Git",
          icon = "󰊢",
        },
        {
          "<leader>h",
          group = "Help",
          icon = "",
        },
        {
          "<leader>n",
          group = "Notifications",
          icon = "󰷠",
        },
        {
          "<leader>q",
          group = "Quit & Sessions",
          icon = "󰋣",
        },
        {
          "<leader>s",
          group = "Search",
          icon = "",
        },
        {
          "<leader>u",
          group = "UI",
          icon = "󱞠",
        },

        -- =====================================================================
        -- Motion Groups (built-in vim motions)
        -- ---------------------------------------------------------------------
        { "[", group = "Prev" },
        { "]", group = "Next" },
        {
          "g",
          group = "Goto",
          icon = "󱡮",
        },
        {
          "z",
          group = "Fold",
          icon = "󱉋",
        },

        -- =====================================================================
        -- Dynamic Groups (auto-expanded based on buffer state)
        -- ---------------------------------------------------------------------
        {
          "<leader>w",
          group = "Windows",
          proxy = "<c-w>", -- Proxy to Vim's window commands
          expand = function() return require("which-key.extras").expand.win() end,
          icon = "󰮕",
        },
      },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
  end,
}
