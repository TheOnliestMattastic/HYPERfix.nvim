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
  end,
}
