  -- ===========================================================================
  -- LAZYDEV.NVIM: Lua Development Support
  -- https://github.com/folke/lazydev.nvim
  -- WHAT: Provides Lua type hints for nvim/luv/plugin libraries
  -- WHY:  Enables completion and type checking in Neovim config files
  -- ---------------------------------------------------------------------------
return  {
  'folke/lazydev.nvim',
  lazy = true,
  -- event = { "BufRead", "BufNewFile", "BufEnter", "VeryLazy" },
  ft = 'lua',
  opts = {
    library = {
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      { path = 'snacks.nvim', words = { 'Snacks' } },
    }
  }
}
