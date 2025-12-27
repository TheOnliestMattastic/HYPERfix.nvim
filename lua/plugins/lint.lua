-- =============================================================================
-- NVIM-LINT: Linting Integration
-- -----------------------------------------------------------------------------
-- WHAT: Runs linters (htmlhint, eslint, etc.) and shows diagnostics
-- WHY:  Catch code issues beyond what LSP provides (style, best practices)
-- HOW:  Auto-runs on BufWritePost or on-demand via :Lint command
-- NOTE: Works alongside LSP diagnostics; you can disable specific rules via config
-- REFERENCE: https://github.com/mfussenegger/nvim-lint
-- KEYMAPS: <leader>cl to lint current buffer
-- RELATED: lua/plugins/lsp.lua (LSP), lua/plugins/conform.lua (formatters)
-- -----------------------------------------------------------------------------
return {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPost", "BufWritePost" },
  keys = {
    {
      "<leader>cL",
      function() require("lint").try_lint() end,
      desc = "[L]int",
    },
  },
  config = function()
    local lint = require("lint")

    -- =========================================================================
    -- Linter Configurations
    -- -------------------------------------------------------------------------
    lint.linters_by_ft = {
      html = { "htmlhint" },
      javascript = { "eslint" },
      typescript = { "eslint" },
      javascriptreact = { "eslint" },
      typescriptreact = { "eslint" },
      python = { "pylint" },
      bash = { "shellcheck" },
      sh = { "shellcheck" },
      zsh = { "shellcheck" },
      markdown = { "markdownlint" },
    }

    -- =========================================================================
    -- htmlhint: Disable self-closing slash warning (HTML5 standard)
    -- -------------------------------------------------------------------------
    lint.linters.htmlhint = lint.linters.htmlhint or {}
    lint.linters.htmlhint.args = {
      "--rules",
      "void-elements:false", -- Don't warn about void elements without slashes
    }

    -- =========================================================================
    -- Auto-lint on save
    -- -------------------------------------------------------------------------
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function() require("lint").try_lint() end,
    })
  end,
}
