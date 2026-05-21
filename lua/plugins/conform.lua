-- =============================================================================
-- CONFORM.NVIM: Code Formatter Integration
-- -----------------------------------------------------------------------------
-- WHAT: Unified interface for running code formatters (stylua, prettier, etc.)
-- WHY:  Automatic code formatting ensures consistent style without manual effort
-- HOW:  Lazy-loads on save; uses `lsp_format = 'fallback'` to use LSP if no formatter
-- NOTE: Each language can have multiple formatters; Conform tries them in order
-- REFERENCE: https://github.com/stevearc/conform.nvim
-- KEYMAPS: <leader>cf to format current buffer
-- RELATED: lua/config/options.lua (formatoptions), lua/plugins/lsp.lua
-- -----------------------------------------------------------------------------
return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cc",
      function()
        -- Format with fallback to LSP if conform formatter unavailable
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "Format Code",
    },
  },
  opts = {
    notify_on_error = true,
    formatters_by_ft = {
      -- stylua: ignore start
      lua             = { "stylua" },

      -- Web & Markup
      markdown        = { "prettier" },
      json            = { "prettier" },
      jsonc           = { "prettier" },
      yaml            = { "prettier" },
      html            = { "superhtml" },
      css             = { "prettier" },
      scss            = { "prettier" },
      less            = { "prettier" },

      -- JavaScript/TypeScript
      javascript      = { "prettier" },
      typescript      = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },

      -- Shell
      bash            = { "shfmt" },
      sh              = { "shfmt" },
      zsh             = { "shfmt" },

      -- Python
      python          = { "black" },

      -- Go
      go              = { "gofmt" },

      -- C/C++
      c               = { "clang_format" },
      cpp             = { "clang_format" },

      -- Rust
      rust            = { "rustfmt" },
    },
  },
}
