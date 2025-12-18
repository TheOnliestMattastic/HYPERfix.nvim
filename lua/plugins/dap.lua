-- =============================================================================
-- NVIM-DAP: Debugging Support
-- =============================================================================
-- WHAT: Debug Adapter Protocol integration for code debugging
-- WHY:  Step through code, inspect variables, set breakpoints without leaving editor
-- HOW:  Lazy-loads on file read; mason-nvim-dap auto-installs debug adapters
-- NOTE: Lua debugging requires manual setup; other languages via Mason
-- KEYMAPS: <leader>db (breakpoint), <leader>dc (continue), <leader>di (step), <leader>dd (toggle UI)
-- REFERENCE: https://github.com/mfussenegger/nvim-dap, https://github.com/rcarriga/nvim-dap-ui
-- RELATED: lua/plugins/mason.lua
-- =============================================================================
return {
  {
    'mfussenegger/nvim-dap',
    lazy = true,
    event = 'BufRead',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      {
        'jay-babu/mason-nvim-dap.nvim',
        dependencies = 'williamboman/mason.nvim',
        cmd = { 'DapInstall', 'DapUninstall' },
      },
    },
    config = function()
      local dap = require('dap')
      local ui = require('dapui')

      require('mason-nvim-dap').setup({
        ensure_installed = {},
        automatic_installation = true,
        handlers = {
          -- ===================================================================
          -- DEFAULT HANDLER: All other adapters (auto-configured by mason)
          -- ===================================================================
          function(config) require('mason-nvim-dap').default_setup(config) end,
        },
      })

      -- =======================================================================
      -- LUA ADAPTER: Manual setup (not provided by mason-nvim-dap by default)
      -- -----------------------------------------------------------------------
      -- WHAT: Configures DAP for Lua debugging (currently disabled/stub)
      -- WHY:  Lua debugging requires local-lua-debugger, which requires setup
      -- HOW:  Provides a stub adapter that gracefully informs user of setup
      -- NOTE: Users can install lua debugger if needed (complex setup required)
      -- =======================================================================
      dap.adapters.lua = {
        type = 'executable',
        command = 'lua-dbg', -- Install via: luarocks install lua-dbg
        args = {},
      }

      -- =======================================================================
      -- LUA DEBUG CONFIGURATION: Stub (requires lua-dbg installation)
      -- -----------------------------------------------------------------------
      -- WHAT: Tells DAP how to launch Lua debugging (currently informational)
      -- WHY:  Provides placeholder until user installs Lua debugger
      -- HOW:  Creates a debug config that specifies the adapter and entry point
      -- NOTE: Users should install lua-dbg via luarocks for full functionality
      -- =======================================================================
      dap.configurations.lua = {
        {
          type = 'lua',
          request = 'launch',
          name = 'Lua (requires lua-dbg)',
          program = {
            lua = 'lua',
            args = {},
          },
          stopOnEntry = false,
        },
      }

      ui.setup()

      -- Auto open/close UI
      dap.listeners.before.attach.dapui_config = function() ui.open() end
      dap.listeners.before.launch.dapui_config = function() ui.open() end
      dap.listeners.before.event_terminated.dapui_config = function() ui.close() end
      dap.listeners.before.event_exited.dapui_config = function() ui.close() end

      -- =======================================================================
      -- Keymaps
      -- -----------------------------------------------------------------------
      vim.keymap.set(
        'n',
        '<leader>db',
        dap.toggle_breakpoint,
        { desc = '[B]reakpoint' }
      )
      vim.keymap.set('n', '<leader>dc', dap.continue, { desc = '[C]ontinue' })
      vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Step [I]nto' })
      vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'Step [O]ver' })
      vim.keymap.set('n', '<leader>dd', ui.toggle, { desc = '[D]AP Menu' })
    end,
  },
}
