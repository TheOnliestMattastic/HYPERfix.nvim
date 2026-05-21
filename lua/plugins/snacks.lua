-- =============================================================================
-- SNACKS.NVIM - The "Face" (UI/UX)
-- -----------------------------------------------------------------------------
-- WHAT: Collection of small QoL UI plugins (picker, dashboard, terminal, etc.)
-- WHY:  Replaces multiple plugins with unified, lightweight alternatives
-- HOW:  Each snack is a modular plugin (dashboard, picker, terminal, etc.)
--       Enable/disable as needed in opts. Keymaps trigger snacks features.
-- NOTE: Priority 1000 ensures it loads early. Lazy = false for immediate load.
-- REFERENCE: https://github.com/folke/snacks.nvim
-- -----------------------------------------------------------------------------

local dashboard = require("snacks-dashboard")

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  -- ===========================================================================
  -- OPTIONS CONFIGURATION
  -- ---------------------------------------------------------------------------
  opts = {
    -- Dashboard: Home screen on startup
    dashboard = {
      enabled = true,
      preset = { header = dashboard.header },
      sections = dashboard.sections,
      formats = dashboard.formats,
    },

    -- Picker: Fuzzy finder / file/buffer/grep picker
    picker = {
      enabled = true,
      sources = { explorer = { enabled = false } },
    },

    -- Styles: Notification and UI styling
    styles = {
      enabled = true,
      notification = { wo = { wrap = true } },
    },

    -- =========================================================================
    -- Individual Snacks: Enable/disable by feature
    -- -------------------------------------------------------------------------
    -- stylua: ignore start
    animate      = { enabled = true }, -- Smooth animations & transitions
    bigfile      = { enabled = true }, -- Optimize performance for large files
    bufdelete    = { enabled = true }, -- Smart buffer deletion
    debug        = { enabled = true }, -- Pretty inspect & backtrace
    dim          = { enabled = true }, -- Dim inactive scopes
    explorer     = { enabled = false }, -- File explorer (handled by mini.files)
    image        = { enabled = true }, -- Image viewer (Kitty/Wezterm/Ghostty)
    indent       = { enabled = true }, -- Indent guides
    input        = { enabled = true }, -- Better vim.ui.input
    layout       = { enabled = true }, -- Window layouts
    lazygit      = { enabled = true }, -- LazyGit integration
    notifier     = { enabled = true }, -- Pretty notifications
    notify       = { enabled = true }, -- vim.notify utilities
    profiler     = { enabled = true }, -- Lua profiler
    quickfile    = { enabled = true }, -- Fast file rendering
    rename       = { enabled = true }, -- File renaming with LSP support
    scope        = { enabled = true }, -- Scope detection & jumping
    scratch      = { enabled = true }, -- Persistent scratch buffers
    scroll       = { enabled = true }, -- Smooth scrolling
    statuscolumn = { enabled = true }, -- Pretty status column
    terminal     = { enabled = true }, -- Floating/split terminals
    toggle       = { enabled = true }, -- Toggle keymaps
    util         = { enabled = true }, -- Utilities (library)
    words        = { enabled = true }, -- LSP reference highlighting
    zen          = { enabled = true }, -- Zen mode (distraction-free)
  },
  -- stylua: ignore end

  -- ===========================================================================
  -- KEYMAPS
  -- ---------------------------------------------------------------------------
  keys = {
    -- -------------------------------------------------------------------------
    -- SMART/FAST SEARCH (<leader>ss)
    -- -------------------------------------------------------------------------
    {
      "<leader>ss",
      function() Snacks.picker.smart() end,
      desc = "Smart Search",
    },
    {
      "<leader>:",
      function() Snacks.picker.command_history() end,
      desc = "Command History",
    },
    {
      "<leader>.",
      function() Snacks.scratch() end,
      desc = "Scratch Buffer",
    },
    {
      "<leader>t",
      function() Snacks.terminal() end,
      desc = "Terminal",
    },

    -- -------------------------------------------------------------------------
    -- BUFFER: Buffer operations (<leader>b)
    -- -------------------------------------------------------------------------
    {
      "<leader>bb",
      function() Snacks.picker.buffers() end,
      desc = "Buffer List",
    },
    {
      "<leader>bg",
      function() Snacks.picker.grep_buffers() end,
      desc = "Grep Buffers",
    },
    {
      "<leader>bd",
      function() Snacks.bufdelete() end,
      desc = "Delete Buffer",
    },
    {
      "<leader>bS",
      function() Snacks.scratch.select() end,
      desc = "Select Scratch Buffer",
    },

    -- -------------------------------------------------------------------------
    -- FILE: File & project navigation (<leader>f)
    -- -------------------------------------------------------------------------
    {
      "<leader>ff",
      function() Snacks.picker.files() end,
      desc = "Find Files",
    },
    {
      "<leader>fp",
      function() Snacks.picker.projects() end,
      desc = "Find Projects",
    },
    {
      "<leader>fr",
      function() Snacks.picker.recent() end,
      desc = "Find Recent",
    },
    {
      "<leader>fR",
      function() Snacks.rename.rename_file() end,
      desc = "Rename File",
    },

    -- -------------------------------------------------------------------------
    -- GIT: Git operations (<leader>g)
    -- -------------------------------------------------------------------------
    {
      "<leader>gg",
      function() Snacks.lazygit() end,
      desc = "LazyGit",
    },
    {
      "<leader>gs",
      function() Snacks.picker.git_status() end,
      desc = "Git Status",
    },
    {
      "<leader>gl",
      function() Snacks.picker.git_log() end,
      desc = "Git Log",
    },
    {
      "<leader>gd",
      function() Snacks.picker.git_diff() end,
      desc = "Git Diff (Hunks)",
    },
    {
      "<leader>gb",
      function() Snacks.picker.git_branches() end,
      desc = "Git Branches",
    },
    {
      "<leader>gB",
      function() Snacks.gitbrowse() end,
      desc = "Git Browser",
      mode = { "n", "v" },
    },

    -- -------------------------------------------------------------------------
    -- SEARCH: Extended search (<leader>s)
    -- -------------------------------------------------------------------------
    {
      "<leader>sg",
      function() Snacks.picker.grep() end,
      desc = "Grep Search",
    },
    {
      "<leader>sw",
      function() Snacks.picker.grep_word() end,
      desc = "Grep Word",
      mode = { "n", "x" },
    },
    {
      "<leader>sh",
      function() Snacks.picker.search_history() end,
      desc = "Search History",
    },
    {
      "<leader>sr",
      function() Snacks.picker.resume() end,
      desc = "Resume Search",
    },
    {
      "<leader>su",
      function() Snacks.picker.undo() end,
      desc = "Undo History",
    },

    -- -------------------------------------------------------------------------
    -- CODE: LSP & Diagnostics (<leader>c)
    -- -------------------------------------------------------------------------
    {
      "<leader>ca",
      vim.lsp.buf.code_action,
      desc = "Code Action",
      mode = { "n", "x" },
    },
    {
      "<leader>cr",
      vim.lsp.buf.rename,
      desc = "Rename Symbol",
    },
    {
      "<leader>cs",
      function() Snacks.picker.lsp_symbols() end,
      desc = "LSP Symbols",
    },
    {
      "<leader>cd",
      function() Snacks.picker.diagnostics() end,
      desc = "Diagnostics",
    },
    {
      "<leader>cl",
      function() Snacks.picker.lsp_config() end,
      desc = "LSP Info",
    },

    -- -------------------------------------------------------------------------
    -- UI: Interface toggles (<leader>u)
    -- -------------------------------------------------------------------------
    {
      "<leader>uz",
      function() Snacks.zen() end,
      desc = "Zen Mode",
    },
    {
      "<leader>uZ",
      function() Snacks.zen.zoom() end,
      desc = "Zoom Window",
    },

    -- -------------------------------------------------------------------------
    -- HELP: Documentation (<leader>h)
    -- -------------------------------------------------------------------------
    {
      "<leader>hh",
      function() Snacks.picker.help() end,
      desc = "Help Pages",
    },
    {
      "<leader>hk",
      function() Snacks.picker.keymaps() end,
      desc = "Keymaps",
    },

    -- -------------------------------------------------------------------------
    -- NOTIFICATIONS (<leader>n)
    -- -------------------------------------------------------------------------
    {
      "<leader>nn",
      function() Snacks.picker.notifications() end,
      desc = "Notification History",
    },
    {
      "<leader>nN",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    },

    -- -------------------------------------------------------------------------
    -- NAVIGATION
    -- -------------------------------------------------------------------------
    {
      "]]",
      function() Snacks.words.jump(vim.v.count1) end,
      desc = "Next Reference",
      mode = { "n", "t" },
    },
    {
      "[[",
      function() Snacks.words.jump(-vim.v.count1) end,
      desc = "Prev Reference",
      mode = { "n", "t" },
    },
    {
      "<leader>qd",
      function() Snacks.dashboard() end,
      desc = "Dashboard",
    },

    -- -------------------------------------------------------------------------
    -- LSP NAVIGATION (Standard g-prefixes)
    -- -------------------------------------------------------------------------
    {
      "gd",
      function() Snacks.picker.lsp_definitions() end,
      desc = "Definition",
    },
    {
      "gD",
      function() Snacks.picker.lsp_declarations() end,
      desc = "Declaration",
    },
    {
      "gI",
      function() Snacks.picker.lsp_implementations() end,
      desc = "Implementation",
    },
    {
      "gR",
      function() Snacks.picker.lsp_references() end,
      nowait = true,
      desc = "References",
    },
    {
      "gy",
      function() Snacks.picker.lsp_type_definitions() end,
      desc = "T[y]pe Definition",
    },
  },

  -- ---------------------------------------------------------------------------
  -- INIT: Setup & configuration (runs at VeryLazy)
  -- ---------------------------------------------------------------------------
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Debug Utilities: Global functions for pretty debugging
        _G.dd = function(...) Snacks.debug.inspect(...) end
        _G.bt = function() Snacks.debug.backtrace() end

        -- Override print to use snacks for `:=` command
        if vim.fn.has("nvim-0.11") == 1 then
          vim._print = function(_, ...) dd(...) end
        else
          vim.print = _G.dd
        end

        -- ---------------------------------------------------------------------
        -- Toggle Mappings: Create toggles for UI features (with <leader>u)
        -- ---------------------------------------------------------------------
        Snacks.toggle.animate():map("<leader>ua")
        Snacks.toggle.diagnostics({ name = "Diagnostics" }):map("<leader>ud")
        Snacks.toggle.dim():map("<leader>uD", { desc = "Dim" })
        Snacks.toggle.indent():map("<leader>ug", { desc = "Indent Guides" })
        Snacks.toggle.line_number({ name = "Line Numbers" }):map("<leader>ul")
        Snacks.toggle.inlay_hints({ name = "Inlay Hints" }):map("<leader>uh")
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.scroll():map("<leader>uS")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")

        Snacks.toggle
          .option("conceallevel", {
            name = "Conceal",
            off = 0,
            on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2,
          })
          :map("<leader>uc")

        Snacks.toggle
          .option("relativenumber", { name = "Relative Numbers" })
          :map("<leader>uL")

        Snacks.toggle
          .treesitter({ name = "Treesitter Highlights" })
          :map("<leader>uT")
      end,
    })
  end,
}
