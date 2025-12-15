-- =============================================================================
-- LAZY.NVIM BOOTSTRAP & SETUP
-- =============================================================================
-- WHAT: lazy.nvim is a modern, fast plugin manager for Neovim
--
-- WHY:  Plugins are loaded lazily (on-demand) instead of at startup,
--       which dramatically improves startup time. It also handles
--       plugin installation, updates, and dependency management.
--
-- HOW:  This section bootstraps lazy.nvim (installs it if missing),
--       configures loading behavior, and imports all plugins from
--       the `lua/plugins/` directory.
--
-- Setup:
--   - Add plugins in `lua/plugins/` (one plugin per file)
--   - Each plugin should return a table with plugin spec
--   - Use `lazy = true` to manually control when plugins load
--   - Use `cmd`, `event`, `keys` to trigger lazy-loading
--   - Run `:Lazy sync` to install/update all plugins
--   - Use `:Lazy` to open the plugin manager UI
--
-- REFERENCE: https://github.com/folke/lazy.nvim
-- -----------------------------------------------------------------------------
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
-- ============================================================================
-- Configuration:
--   spec:     Plugin specifications to load from `lua/plugins/`
--   checker:  Automatically check for plugin updates in background
--   performance: Disable unused Neovim plugins to improve startup time
-- ============================================================================
require('lazy').setup({
  spec = {
    -- import your plugins
    { import = 'plugins' },
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = {
        'netrwPlugin',
        'gzip',
        'tarPlugin',
        'zipPlugin',
        'tohtml',
      },
    },
  },
})
