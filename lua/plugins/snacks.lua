-- =============================================================================
-- SNACKS.NVIM: The "Face"
-- REFERENCE: https://github.com/folke/snacks.nvim
-- -----------------------------------------------------------------------------
local dashboard = require('snacks-dashboard')
return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    -- =========================================================================
    -- dashboard
    -- -------------------------------------------------------------------------
    dashboard = {
      enabled = true,
      preset = { header = dashboard.header },
      sections = dashboard.sections,
    },

    -- =========================================================================
    -- picker
    -- -------------------------------------------------------------------------
    picker = {
      enabled = true,
      sources = { explorer = { enabled = false } },
    },

    -- =========================================================================
    -- styles
    -- -------------------------------------------------------------------------
    styles = {
      enabled = true,
      notification = { wo = { wrap = true } },
    },

    -- stylua: ignore start
    animate =       { enabled = true },
    bigfile =       { enabled = true },
    bufdelete =     { enabled = true },
    debug =         { enabled = true },
    dim =           { enabled = true },
    explorer =      { enabled = false }, -- handled by mini.files
    image =         { enabled = true },
    indent =        { enabled = true },
    input =         { enabled = true },
    layout =        { enabled = true },
    lazygit =       { enabled = true },
    notifier =      { enabled = true },
    notify =        { enabled = true },
    profiler =      { enabled = true },
    quickfile =     { enabled = true },
    rename =        { enabled = true },
    scope =         { enabled = true },
    scratch =       { enabled = true },
    scroll =        { enabled = true },
    statuscolumn =  { enabled = true },
    terminal =      { enabled = true },
    toggle =        { enabled = true },
    util =          { enabled = true },
    words =         { enabled = true },
    zen =           { enabled = true },
  },
  -- stylua: ignore end

  -- ===========================================================================
  -- keymaps
  -- ---------------------------------------------------------------------------
  keys = {
    -- =========================================================================
    -- Top Level
    -- -------------------------------------------------------------------------
    {
      '<leader>/',
      function() Snacks.picker.grep() end,
      desc = 'Grep',
    },
    {
      '<leader>:',
      function() Snacks.picker.command_history() end,
      desc = 'Command History',
    },
    {
      '<leader>.',
      function() Snacks.scratch() end,
      desc = 'Scratch Buffer',
    },
    {
      '<leader>`',
      function() Snacks.terminal() end,
      desc = 'Toggle Terminal',
    },
    {
      '<c-_>',
      function() Snacks.terminal() end,
      desc = 'which_key_ignore',
    },

    -- =========================================================================
    -- buffer
    -- -------------------------------------------------------------------------
    {
      '<leader>bb',
      function() Snacks.picker.buffers() end,
      desc = '[B]uffers',
    },
    {
      '<leader>bd',
      function() Snacks.bufdelete() end,
      desc = '[B]uffer [D]elete',
    },
    {
      '<leader>bg',
      function() Snacks.picker.grep_buffers() end,
      desc = 'Grep [B]uffers',
    },

    -- =========================================================================
    -- find/file
    -- -------------------------------------------------------------------------
    {
      '<leader>ff',
      function() Snacks.picker.files() end,
      desc = '[F]ind [F]iles',
    },
    {
      '<leader>fp',
      function() Snacks.picker.projects() end,
      desc = '[F]ind [P]rojects',
    },
    {
      '<leader>fr',
      function() Snacks.picker.recent() end,
      desc = '[F]ind [R]ecent',
    },
    {
      '<leader>fR',
      function() Snacks.rename.rename_file() end,
      desc = '[F]ile: [R]ename',
    },
    {
      '<leader>fw',
      function() Snacks.picker.grep_word() end,
      desc = '[F]ind/Grep [W]ord',
      mode = { 'n', 'x' },
    },

    -- =========================================================================
    -- git
    -- -------------------------------------------------------------------------
    {
      '<leader>gb',
      function() Snacks.picker.git_branches() end,
      desc = '[G]it [B]ranches',
    },
    {
      '<leader>gB',
      function() Snacks.gitbrowse() end,
      desc = '[G]it [B]rowse',
      mode = { 'n', 'v' },
    },
    {
      '<leader>gd',
      function() Snacks.picker.git_diff() end,
      desc = '[G]it [D]iff (Hunks)',
    },
    {
      '<leader>gf',
      function() Snacks.picker.git_files() end,
      desc = '[G]it [F]iles',
    },
    {
      '<leader>gF',
      function() Snacks.picker.git_log_file() end,
      desc = '[G]it Log [F]ile',
    },
    {
      '<leader>gg',
      function() Snacks.lazygit() end,
      desc = 'Lazy[g]it',
    },
    {
      '<leader>gi',
      function() Snacks.picker.gh_issue() end,
      desc = '[G]itHub [I]ssues (open)',
    },
    {
      '<leader>gI',
      function() Snacks.picker.gh_issue({ state = 'all' }) end,
      desc = '[G]itHub [I]ssues (all)',
    },
    {
      '<leader>gl',
      function() Snacks.picker.git_log() end,
      desc = '[G]it [L]og',
    },
    {
      '<leader>gL',
      function() Snacks.picker.git_log_line() end,
      desc = '[G]it Log [L]ine',
    },
    {
      '<leader>gp',
      function() Snacks.picker.gh_pr() end,
      desc = '[G]itHub [P]ull Requests (open)',
    },
    {
      '<leader>gP',
      function() Snacks.picker.gh_pr({ state = 'all' }) end,
      desc = '[G]itHub [P]ull Requests (all)',
    },
    {
      '<leader>gs',
      function() Snacks.picker.git_status() end,
      desc = '[G]it [S]tatus',
    },
    {
      '<leader>gS',
      function() Snacks.picker.git_stash() end,
      desc = '[G]it [S]tash',
    },

    -- =========================================================================
    -- help
    -- -------------------------------------------------------------------------
    {
      '<leader>ha',
      function() Snacks.picker.autocmds() end,
      desc = '[A]utocmds',
    },
    {
      '<leader>hc',
      function()
        Snacks.picker.files({
          cwd = vim.fn.stdpath('config'),
        })
      end,
      desc = '[C]onfig Files',
    },
    {
      '<leader>hh',
      function() Snacks.picker.help() end,
      desc = '[H]elp Pages',
    },
    {
      '<leader>hk',
      function() Snacks.picker.keymaps() end,
      desc = '[K]eymaps',
    },
    {
      '<leader>hm',
      function() Snacks.picker.man() end,
      desc = '[M]an Pages',
    },
    {
      '<leader>hp',
      function() Snacks.picker.lazy() end,
      desc = '[P]lugin Spec',
    },

    -- =========================================================================
    -- Notification
    -- -------------------------------------------------------------------------
    {
      '<leader>nd',
      function() Snacks.notifier.hide() end,
      desc = '[D]ismiss Notifications',
    },
    {
      '<leader>nh',
      function() Snacks.picker.notifications() end,
      desc = '[N]otification [H]istory',
    },
    {
      '<leader>nn',
      function() Snacks.notifier.show_history() end,
      desc = '[N]otificatio[n] History',
    },
    {
      '<leader>nN',
      desc = '[N]eovim [N]ews',
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file('doc/news.txt', false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = 'yes',
            statuscolumn = ' ',
            conceallevel = 3,
          },
        })
      end,
    },

    -- =========================================================================
    -- search
    -- -------------------------------------------------------------------------
    {
      '<leader>sc',
      function() Snacks.picker.commands() end,
      desc = '[S]earch [C]ommands',
    },
    {
      '<leader>sh',
      function() Snacks.picker.search_history() end,
      desc = '[S]earch [H]istory',
    },
    {
      '<leader>sH',
      function() Snacks.picker.highlights() end,
      desc = '[S]earch [H]ighlights',
    },
    {
      '<leader>si',
      function() Snacks.picker.icons() end,
      desc = '[S]earch [I]cons',
    },
    {
      '<leader>sj',
      function() Snacks.picker.jumps() end,
      desc = '[S]earch [J]umps',
    },
    {
      '<leader>sl',
      function() Snacks.picker.lines() end,
      desc = '[S]earch [L]ines',
    },
    {
      '<leader>sr',
      function() Snacks.picker.registers() end,
      desc = '[S]earch [R]egisters',
    },
    {
      '<leader>sR',
      function() Snacks.picker.resume() end,
      desc = '[S]earch [R]esume',
    },
    {
      '<leader><space>',
      function() Snacks.picker.smart() end,
      desc = 'Smart Search',
    },
    {
      '<leader>su',
      function() Snacks.picker.undo() end,
      desc = '[S]earch [U]ndo History',
    },
    -- { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    -- { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    -- { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
    -- { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
    -- { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },

    -- =========================================================================
    -- UI
    -- -------------------------------------------------------------------------
    {
      '<leader>uC',
      function() Snacks.picker.colorschemes() end,
      desc = '[C]olorschemes',
    },
    {
      '<leader>uz',
      function() Snacks.zen() end,
      desc = '[Z]en Mode',
    },
    {
      '<leader>uZ',
      function() Snacks.zen.zoom() end,
      desc = '[Z]oom',
    },

    -- =========================================================================
    -- Other
    -- -------------------------------------------------------------------------
    {
      ']]',
      function() Snacks.words.jump(vim.v.count1) end,
      desc = 'Next Reference',
      mode = { 'n', 't' },
    },
    {
      '[[',
      function() Snacks.words.jump(-vim.v.count1) end,
      desc = 'Prev Reference',
      mode = { 'n', 't' },
    },
    -- {"<leader>bS", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer"},

    -- =========================================================================
    -- LSP
    -- -------------------------------------------------------------------------
    -- { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    -- { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    -- { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    -- { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    -- { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    -- { "gai", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming" },
    -- { "gao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing" },
    -- { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    -- { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
  },

  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...) Snacks.debug.inspect(...) end
        _G.bt = function() Snacks.debug.backtrace() end

        -- Override print to use snacks for `:=` command
        if vim.fn.has('nvim-0.11') == 1 then
          vim._print = function(_, ...) dd(...) end
        else
          vim.print = _G.dd
        end

        -- Create some toggle mappings
        Snacks.toggle.option('spell', { name = '[S]pelling' }):map('<leader>us')
        Snacks.toggle.option('wrap', { name = '[W]rap' }):map('<leader>uw')
        Snacks.toggle
          .option('relativenumber', { name = 'Re[l]ative Number' })
          :map('<leader>uL')
        Snacks.toggle.diagnostics():map('<leader>ud')
        Snacks.toggle.line_number():map('<leader>ul')
        Snacks.toggle
          .option(
            'conceallevel',
            { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }
          )
          :map('<leader>uc')
        Snacks.toggle.treesitter():map('<leader>uT')
        -- Snacks.toggle
        --   .option(
        --     'background',
        --     { off = 'light', on = 'dark', name = 'Dark Background' }
        --   )
        --   :map('<leader>ub')
        Snacks.toggle.inlay_hints():map('<leader>uh')
        Snacks.toggle.indent():map('<leader>ug')
        Snacks.toggle.dim():map('<leader>uD')
      end,
    })
  end,
}
