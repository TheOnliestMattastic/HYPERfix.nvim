return {
  "mason-org/mason.nvim",
  lazy = true,
  event = { 'BufRead', 'BufNewFile', 'BufEnter', 'VeryLazy' },
  keys = { { '<leader>cm', '<cmd>Mason<cr>', desc = 'Mason' } },
  opts = {
    ui = {
      -- TODO: change icons
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  }
}
