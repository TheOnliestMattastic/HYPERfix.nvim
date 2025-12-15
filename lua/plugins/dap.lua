return {
  {
    'mfussenegger/nvim-dap',
    lazy = true,
    -- event = { 'BufRead' },
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      {
        'jay-babu/mason-nvim-dap.nvim',
        -- lazy = true,
        dependencies = 'williamboman/mason.nvim',
        cmd = { 'DapInstall', 'DapUninstall' },
      },
    },
    config = function()
      local dap = require('dap')
      local ui = require('dapui')

      require('mason-nvim-dap').setup({
        automatic_installation = true,
        handlers = {
          -- ===================================================================
          -- LOCAL LUA DEBUGGER
          -- -------------------------------------------------------------------
          -- WHAT: Configures local-lua-debugger-vscode for debugging Lua files
          -- WHY:  Allows DAP to spawn and connect to the Lua debugger
          -- HOW:  Handler receives the debugger config from mason and applies defaults
          -- NOTE: Debugger listens on localhost:11411 by default
          -- ===================================================================
          function(config)
            config.args = config.args or {}
            dap.adapters.lua = config
          end,
        },
      })

      -- =======================================================================
      -- LUA DEBUG CONFIGURATION
      -- -----------------------------------------------------------------------
      -- WHAT: Tells DAP how to launch Lua debugging for .lua files
      -- WHY:  Without this, DAP doesn't know what to do when debugging Lua
      -- HOW:  Creates a debug config that specifies the adapter and entry point
      -- NOTE: Applies to all Lua filetype buffers
      -- =======================================================================
      dap.configurations.lua = {
        {
          type = 'lua',
          request = 'launch',
          name = 'Lua Debug',
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
