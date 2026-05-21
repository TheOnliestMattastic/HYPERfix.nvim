-- =============================================================================
-- SIDEKICK.NVIM: AI Sidekick & CLI Integration
-- -----------------------------------------------------------------------------
-- WHAT: Integrates GitHub Copilot's Next Edit Suggestions (NES) and provides
--       a terminal UI for various AI CLI tools (Claude, Gemini, etc.).
-- WHY:  Replaces amp-ai with a more modern, context-aware AI integration.
-- HOW:  Uses copilot.lua for NES and integrates with system AI CLIs.
-- NOTE: Tailored for Wezterm (mux disabled).
-- REFERENCE: https://github.com/folke/sidekick.nvim
-- -----------------------------------------------------------------------------
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false }, -- Managed by sidekick or blink
      panel = { enabled = false },
    },
  },
  {
    "folke/sidekick.nvim",
    cmd = { "Sidekick" },
    opts = {
      nes = {
        enabled = true,
        diff = { inline = "words" },
      },
      cli = {
        mux = { enabled = false }, -- Disabled to allow terminal emulator to handle multiplexing
      },
    },
    keys = {
      -- -----------------------------------------------------------------------
      -- AI Mnemonic Group (<leader>a)
      -- -----------------------------------------------------------------------
      {
        "<leader>aa",
        function() require("sidekick.cli").toggle() end,
        desc = "Toggle AI Sidekick",
      },
      {
        "<leader>as",
        function() require("sidekick.cli").select() end,
        desc = "Select AI Tool",
      },
      {
        "<leader>ap",
        function() require("sidekick.cli").prompt() end,
        mode = { "n", "x" },
        desc = "AI Prompts",
      },
      {
        "<leader>an",
        function() return require("sidekick").nes_jump_or_apply() end,
        desc = "NES Next Suggestion",
      },
    },
  },
}
