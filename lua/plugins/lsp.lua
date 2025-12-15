-- =============================================================================
-- NEOVIM LSP ECOSYSTEM CONFIGURATION
-- -----------------------------------------------------------------------------
-- WHAT: LSP (Language Server Protocol) provides intelligent code features:
--       completion, diagnostics, goto-definition, refactoring, and more.
--       This config integrates:
--         - Language servers via mason and lspconfig
--         - Code completion via blink.cmp
--         - Code formatting via conform.nvim
--         - Lua development support via lazydev.nvim
-- -----------------------------------------------------------------------------
return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre' },
    dependencies = {
      'mason-org/mason.nvim',
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'saghen/blink.cmp',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup(
          'hyperfix-lsp-attach',
          { clear = true }
        ),
        callback = function(event)
          -- Version-aware check: API changed in Nvim 0.11
          local function client_supports_method(client, method, bufnr)
            if vim.fn.has('nvim-0.11') == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          -- Highlight references under cursor (hover highlighting)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if
            client
            and client_supports_method(
              client,
              vim.lsp.protocol.Methods.textDocument_documentHighlight,
              event.buf
            )
          then
            local highlight_augroup = vim.api.nvim_create_augroup(
              'hyperfix-lsp-highlight',
              { clear = false }
            )
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
              group = vim.api.nvim_create_augroup(
                'hyperfix-lsp-detach',
                { clear = true }
              ),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({
                  group = 'hyperfix-lsp-highlight',
                  buffer = event2.buf,
                })
              end,
            })
          end
        end,
      })

      -- =======================================================================
      -- Diagnostic Config: error display, signs, and inline messages
      -- NOTE: See :help vim.diagnostic.Opts
      -- -----------------------------------------------------------------------
      vim.diagnostic.config({
        severity_sort = true, -- Sort by error > warn > info > hint
        float = { border = 'rounded', source = 'if_many' }, -- Hover window styling
        underline = { severity = vim.diagnostic.severity.ERROR }, -- Only underline errors
        -- Left-margin icons (gutters) — use Nerd Font icons if available
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰚑 ',
            [vim.diagnostic.severity.WARN] = '󰻍 ',
            [vim.diagnostic.severity.INFO] = '󱦄 ',
            [vim.diagnostic.severity.HINT] = '󱃏 ',
          },
        } or {},
        -- Inline error messages at end of line
        virtual_text = {
          source = 'if_many', -- Show source only if multiple diagnostics on line
          spacing = 2,
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
      })

      -- Merge blink.cmp's LSP capabilities with server config
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Language server-specific settings
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace', -- Auto-expand snippets on completion
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Extract server names and add formatters (tools, not LSPs)
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Lua formatter (managed by mason-tool-installer)
      })
      require('mason-tool-installer').setup({
        ensure_installed = ensure_installed, -- Auto-install tools
      })

      -- Auto-install LSPs and setup with lspconfig
      require('mason-lspconfig').setup({
        ensure_installed = {}, -- Empty: install all, not just listed servers
        automatic_installation = true, -- Auto-install on server attach
        handlers = {
          -- Generic handler: applies capabilities and custom settings
          function(server_name)
            local server = servers[server_name] or {}
            -- Merge blink.cmp capabilities into each server's config
            server.capabilities = vim.tbl_deep_extend(
              'force',
              {},
              capabilities,
              server.capabilities or {}
            )
            require('lspconfig')[server_name].setup(server)
          end,
        },
      })
    end,
  },
}
