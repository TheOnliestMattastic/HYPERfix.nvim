return {
  {
    "folke/trouble.nvim",
    lazy = true,
    cmd = { "Trouble" },
    event = { "BufRead", "BufNewFile", "VeryLazy" },
    opts = {
      modes = {
        lsp = {
          win = { position = "right" },
        },
      },
    },
    keys = {
      { "<leader>xd", "<cmd>Trouble diagnostics toggle<cr>", desc = "[D]iagnostics" },
      { "<leader>xD", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer [D]iagnostics" },
      { "<leader>xs", "<cmd>Trouble symbols toggle<cr>", desc = "[S]ymbols" },
      { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "[L]ocation List" },
      { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "[Q]uickfix List" },
      {
        "[q",
        function()
          if require("trouble").is_open() then
            require("trouble").prev({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cprev)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = "Prev Quickfix Item",
      },
      {
        "]q",
        function()
          if require("trouble").is_open() then
            require("trouble").next({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = "Next Quickfix Item",
      },
    },
  }
}
