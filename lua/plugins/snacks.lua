-- SNACKS.NVIM: The "Face"
-- RESOURCE: https://github.com/folke/snacks.nvim
local dashboard = require("snacks-dashboard")
return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile =             { enabled = true },
      quickfile =           { enabled = true },
      scroll =              { enabled = true },
      statuscolumn =        { enabled = true },
      terminal =            { enabled = true },
      words =               { enabled = true },
      indent =              { enabled = true },
      input =               { enabled = true },
      lazygit =             { enabled = true },
      notifier =            { enabled = true },

      dashboard =           { enabled = true,
        preset =            { header = dashboard.header },
        sections =            dashboard.sections, },

      picker =              { enabled = true,
        sources =
        { explorer =        { enabled = false } } },
    },

    -- ========================================================================
    -- keymaps
    -- ------------------------------------------------------------------------
    keys = {
      { "<leader><space>",  function() Snacks.picker.smart() end,           desc = "Smart Find" },
      { "<leader>.",        function() Snacks.scratch() end,                desc = "Scratch Buffer" },
      { "<leader>,",        function() Snacks.picker.buffers() end,         desc = "Buffers" },
      { "<leader>/",        function() Snacks.picker.grep() end,            desc = "Grep" },
      { "<leader>:",        function() Snacks.picker.command_history() end, desc = "Cmd History" },
      { "<leader>gg",       function() Snacks.lazygit() end,                desc = "Lazygit" },
      { "<c-/>",            function() Snacks.terminal() end,               desc = "Terminal" },
    },
  },
}
