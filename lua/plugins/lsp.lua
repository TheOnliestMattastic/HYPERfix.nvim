return {
  {
    'folke/lazydev.nvim',
    lazy = true,
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        { path = "snacks.nvim", words = { "Snacks" } },
        { path = "lazy.nvim", words = { "LazyVim" } },
      },
    },
  },

  -- ==========================================================================
  -- NVIM-LSPCONFIG
  -- --------------------------------------------------------------------------
  {
    'neovim/nvim-lspconfig',
    lazy = true,
    dependencies = {
      -- ======================================================================
      -- MASON.NVIM
      -- ----------------------------------------------------------------------
      {
        "mason-org/mason.nvim",
        lazy = true,
        cmd = "Mason",
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
        build = ":MasonUpdate",
        opts_extend = { "ensure_installed" },
        opts = { ensure_installed = { "stylua" } },
        config = function(_, opts)
          require("mason").setup(opts)
          local mr = require("mason-registry")
          mr:on("package:install:success", function()
            vim.defer_fn(function()
              -- trigger FileType event to possibly load this newly installed LSP server
              require("lazy.core.handler.event").trigger({
                event = "FileType",
                buf = vim.api.nvim_get_current_buf(),
              })
            end, 100)
          end)

          mr.refresh(function()
            for _, tool in ipairs(opts.ensure_installed) do
              local p = mr.get_package(tool)
              if not p:is_installed() then
                p:install()
              end
            end
          end)
        end,
      },
      { 'mason-org/mason-lspconfig.nvim', config = function() end },
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'saghen/blink.cmp',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('hyperfix-lsp-attach', { clear = true }),
        callback = function(event)

          -- ==================================================================
          -- keymaps
          -- ------------------------------------------------------------------
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('<leader>cr', vim.lsp.buf.rename,                                '[R]ename')
          map('<leader>ca', vim.lsp.buf.code_action,                           'Code [A]ction', { 'n', 'x' })
          map('glr', require('Snacks.picker').lsp_references,                  '[R]eferences')
          map('gli', require('Snacks.picker').lsp_implementations,             '[I]mplementation')
          map('gld', require('Snacks.picker').lsp_definitions,                 '[D]efinition')
          map('glD', vim.lsp.buf.declaration,                                  '[D]eclaration')
          map('gls', require('Snacks.picker').lsp_document_symbols,            'Document [S]ymbols')
          map('glS', require('Snacks.picker').lsp_dynamic_workspace_symbols,   'Workspace [S]ymbols')
          map('glt', require('Snacks.picker').lsp_type_definitions,            '[T]ype Definition')

          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('hyperfix-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('hyperfix-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'hyperfix-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- ==================================================================
          -- toggle keymap
          -- ------------------------------------------------------------------
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>\\H', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, 'Toggle Inlay [H]ints')
          end
        end,
      })
      -- ======================================================================
      -- Diagnostic Config; See :help vim.diagnostic.Opts
      -- ----------------------------------------------------------------------
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 4,
          prefix = "icons",
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }

      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua',
      })

      require('mason-tool-installer').setup { ensure_installed = ensure_installed }
      require('mason-lspconfig').setup {
        ensure_installed = {},
        automatic_installation = true,
        handlers = { function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,},
      }
    end,
  },

  -- ==========================================================================
  -- CONFORM.NVIM
  -- --------------------------------------------------------------------------
  {
    'stevearc/conform.nvim',
    lazy = true,
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    -- keys = {
    --   {
    --     '<leader>cf',
    --     function()
    --       require('conform').format { async = true, lsp_format = 'fallback' }
    --     end,
    --     mode = '',
    --     desc = '[F]ormat buffer',
    --   },
    -- },
    opts = {
      notify_on_error = true,
      format_on_save = false,
      formatters_by_ft = {
        lua = { 'stylua' },
      },
    },
  },

  -- ==========================================================================
  -- BLINK.CMP
  -- --------------------------------------------------------------------------
  {
    'saghen/blink.cmp',
    lazy = true,
    event = { 'InsertEnter', "CmdLineEnter" },
    version = '1.*',
    build = "cargo build --release",
    dependencies = {
      'folke/lazydev.nvim',
      -- ======================================================================
      -- Snippet Engine
      -- ----------------------------------------------------------------------
      {
        "rafamadriz/friendly-snippets",
        {
          "saghen/blink.compat",
          opts = {},
          version = "*",
        },
      },

    },

    opts = {
      keymap = { preset = 'default' },
      appearance = { nerd_font_variant = 'mono' },
      completion = { documentation = { auto_show = false } },
      sources = {
        per_filetype = {
          lua = { inherit_defaults = true, "lazydev" },
        },
        default = { 'lsp', 'path', 'snippets', 'lazydev' },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = 'lazydev.integrations.blink',
            score_offset = 100
          },
        },
      },
      snippets = { preset = 'default' },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
      signature = { enabled = true },
    },

    config = function(_, opts)
      require('blink.cmp').setup(opts)
    end
  },
}
