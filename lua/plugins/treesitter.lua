-- TREESITTER (Syntax Highlighting)
-- RESOURCE: https://github.com/nvim-treesitter/nvim-treesitter
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "vimdoc", "markdown", "python", "javascript", "typescript", "go", "bash" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}