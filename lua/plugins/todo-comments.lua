-- =============================================================================
-- TODO-COMMENTS.NVIM: Highlight & Navigate Code Comments
-- =============================================================================
-- WHAT: Highlights, colors, and provides nav for TODO, FIX, HACK, NOTE, and custom comments
-- WHY:  Makes it easy to spot and track work-in-progress annotations across codebase
-- HOW:  Parses comments with keywords; integrates with Trouble sidebar and Snacks picker
-- NOTE: Treesitter-aware (only matches in comment syntax, not code), supports custom keywords
-- KEYMAPS: ]t/[t (jump comments), <leader>st/<leader>sT (search), <leader>xt/<leader>xT (sidebar)
-- REFERENCE: https://github.com/folke/todo-comments.nvim
-- RELATED: lua/plugins/trouble.lua (sidebar view), lua/plugins/snacks.lua (picker)
-- =============================================================================
return {
  {
    'folke/todo-comments.nvim',
    lazy = true,
    cmd = { 'TodoTrouble', 'TodoTelescope' },
    event = { 'BufRead' },
    dependencies = { 'nvim-lua/plenary.nvim', lazy = true },

    -- =========================================================================
    -- CONFIGURATION: Default + Custom Keywords
    -- WHAT: Extends default with custom keywords (WHAT, WHY, HOW, REFERENCE)
    -- HOW:  Merges custom keywords with defaults (merge_keywords = true).
    -- -------------------------------------------------------------------------
    opts = {
      keywords = {
        WHAT = {
          color = 'info',
          icon = '󰽴',
        },
        HOW = {
          color = 'info',
          icon = '󰝚',
        },
        WHY = {
          color = 'info',
          icon = '󰎇',
        },
        REF = {
          icon = '󰯙',
          color = 'default',
          alt = { 'REFERENCE' },
        },
        FIX = {
          icon = '󱇫',
          color = 'error',
          alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' },
        },
        TODO = {
          icon = '󰳈',
          color = 'info',
        },
        HACK = {
          icon = '󰣈',
          color = 'warning',
        },
        WARN = {
          icon = '󰚑',
          color = 'warning',
          alt = { 'WARNING', 'XXX' },
        },
        PERF = {
          icon = '󱁞',
          alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' },
        },
        NOTE = {
          icon = '󰷠',
          color = 'hint',
          alt = { 'INFO' },
        },
        TEST = {
          icon = '󱄳',
          color = 'test',
          alt = { 'TESTING', 'PASSED', 'FAILED' },
        },
      },
    },

    -- =========================================================================
    -- KEYMAPS
    -- =========================================================================
    keys = {
      -- =====================================================================
      -- Navigation: Jump between todo comments
      -- =====================================================================
      -- WHAT: Move cursor to next/previous todo comment in current buffer
      -- WHY:  Quick navigation through todos without using picker/search
      -- HOW:  ]t and [t are mnemonic (] = next, [ = previous, t = todo)
      {
        ']t',
        function() require('todo-comments').jump_next() end,
        desc = 'Next [T]odo Comment',
      },
      {
        '[t',
        function() require('todo-comments').jump_prev() end,
        desc = 'Prev [T]odo Comment',
      },

      -- =====================================================================
      -- Trouble Integration: Sidebar view of all todos
      -- =====================================================================
      -- WHAT: Show all project todos in Trouble (sidebar UI) with filtering
      -- WHY:  Get an overview of all todos organized in a sidebar window
      -- HOW:  Trouble parses todo-comments output and displays in a list
      {
        '<leader>xt',
        '<cmd>Trouble todo toggle<cr>',
        desc = '[T]odo',
      },
      {
        '<leader>xT',
        '<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>',
        desc = '[T]odo/Fix/Fixme',
      },

      -- =====================================================================
      -- Snacks Picker: Grep-based search through todos
      -- =====================================================================
      -- WHAT: Search project todos using Snacks picker (grep-based fuzzy search)
      -- WHY:  Fast, live-preview search through todos with fuzzy matching
      -- HOW:  Uses ripgrep pattern matching instead of telescope
      --       `<leader>st` searches all common todo keywords
      --       `<leader>sT` searches only critical todos (TODO|FIX|FIXME)
      {
        '<leader>st',
        function() Snacks.picker.grep({ pattern = 'TODO|HACK|NOTE|PERF|TEST' }) end,
        desc = '[T]odo',
      },
      {
        '<leader>sT',
        function() Snacks.picker.grep({ pattern = 'TODO|FIX|FIXME' }) end,
        desc = '[T]odo/Fix/Fixme',
      },
    },
  },
}
