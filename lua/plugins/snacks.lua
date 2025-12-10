  -- SNACKS.NVIM: The "Face"
  -- RESOURCE: https://github.com/folke/snacks.nvim
return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      indent = { enabled = true },
      scroll = { enabled = true },
      words = { enabled = true },
      statuscolumn = { enabled = true },
      lazygit = { enabled = true },
      terminal = { enabled = true },
      picker = {
        enabled = true,
        sources = { explorer = { enabled = false } }, -- Handeled by mini.files
      },
    },
    keys = {
      { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find" },
      { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>:", function() Snacks.picker.command_history() end, desc = "Cmd History" },
      { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
      { "<c-/>", function() Snacks.terminal() end, desc = "Toggle Terminal" },
    },
  },
}