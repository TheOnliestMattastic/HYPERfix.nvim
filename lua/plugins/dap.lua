return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      local dap = require("dap")
      local ui = require("dapui")

      require("mason-nvim-dap").setup({
        automatic_installation = true,
        handlers = {},
      })

      ui.setup()

      -- Auto open/close UI
      dap.listeners.before.attach.dapui_config = function() ui.open() end
      dap.listeners.before.launch.dapui_config = function() ui.open() end
      dap.listeners.before.event_terminated.dapui_config = function() ui.close() end
      dap.listeners.before.event_exited.dapui_config = function() ui.close() end

      -- Keymaps
      vim.keymap.set("n",   "<leader>db",   dap.toggle_breakpoint,  { desc = "[B]reakpoint" })
      vim.keymap.set("n",   "<leader>dc",   dap.continue,           { desc = "[C]ontinue" })
      vim.keymap.set("n",   "<leader>di",   dap.step_into,          { desc = "Step [I]nto" })
      vim.keymap.set("n",   "<leader>do",   dap.step_over,          { desc = "Step [O]ver" })
      vim.keymap.set("n",   "<leader>du",   ui.toggle,              { desc = "DAP [U]I" })
    end,
  },
}
