-- =============================================================================
-- SNACKS.NVIM - The "Face" (UI/UX)
-- =============================================================================
-- WHAT: Collection of small QoL UI plugins (picker, dashboard, terminal, etc.)
-- WHY:  Replaces multiple plugins with unified, lightweight alternatives
-- HOW:  Each snack is a modular plugin (dashboard, picker, terminal, etc.)
--       Enable/disable as needed in opts. Keymaps trigger snacks features.
-- NOTE: Priority 1000 ensures it loads early. Lazy = false for immediate load.
--
-- REFERENCE: https://github.com/folke/snacks.nvim
-- =============================================================================

local dashboard = require('snacks-dashboard')

return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,

  -- ===========================================================================
  -- OPTIONS CONFIGURATION
  -- ===========================================================================
  opts = {
    -- =========================================================================
    -- Dashboard: Home screen on startup
    -- =========================================================================
    dashboard = {
      enabled = true,
      preset = { header = dashboard.header },
      sections = dashboard.sections,
      formats = dashboard.formats,
    },

    -- =========================================================================
    -- Picker: Fuzzy finder / file/buffer/grep picker
    -- =========================================================================
    picker = {
      enabled = true,
      sources = { explorer = { enabled = false } },
    },

    -- =========================================================================
    -- Styles: Notification and UI styling
    -- =========================================================================
    styles = {
      enabled = true,
      notification = { wo = { wrap = true } },
    },

    -- =========================================================================
    -- Individual Snacks: Enable/disable by feature
    -- =========================================================================
    -- stylua: ignore start
    animate =       { enabled = true }, -- Smooth animations & transitions
    bigfile =       { enabled = true }, -- Optimize performance for large files
    bufdelete =     { enabled = true }, -- Smart buffer deletion
    debug =         { enabled = true }, -- Pretty inspect & backtrace
    dim =           { enabled = true }, -- Dim inactive scopes
    explorer =      { enabled = false }, -- File explorer (handled by mini.files)
    image =         { enabled = true }, -- Image viewer (Kitty/Wezterm/Ghostty)
    indent =        { enabled = true }, -- Indent guides
    input =         { enabled = true }, -- Better vim.ui.input
    layout =        { enabled = true }, -- Window layouts
    lazygit =       { enabled = true }, -- LazyGit integration
    notifier =      { enabled = true }, -- Pretty notifications
    notify =        { enabled = true }, -- vim.notify utilities
    profiler =      { enabled = true }, -- Lua profiler
    quickfile =     { enabled = true }, -- Fast file rendering
    rename =        { enabled = true }, -- File renaming with LSP support
    scope =         { enabled = true }, -- Scope detection & jumping
    scratch =       { enabled = true }, -- Persistent scratch buffers
    scroll =        { enabled = true }, -- Smooth scrolling
    statuscolumn =  { enabled = true }, -- Pretty status column
    terminal =      { enabled = true }, -- Floating/split terminals
    toggle =        { enabled = true }, -- Toggle keymaps
    util =          { enabled = true }, -- Utilities (library)
    words =         { enabled = true }, -- LSP reference highlighting
    zen =           { enabled = true }, -- Zen mode (distraction-free)
    -- stylua: ignore end
  },

  -- ===========================================================================
  -- KEYMAPS
  -- ===========================================================================
  keys = {
    -- =========================================================================
    -- Top Level: Global navigation & utilities
    -- =========================================================================
    {
      '<leader><space>',
      function() Snacks.picker.smart() end,
      desc = 'Smart Search',
    },
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
      '<leader>t',
      function() Snacks.terminal() end,
      desc = '[T]erminal',
    },

    -- =========================================================================
    -- Buffer: Buffer operations
    -- =========================================================================
    {
      '<leader>bb',
      function() Snacks.picker.buffers() end,
      desc = 'Select [B]uffer',
    },
    {
      '<leader>bg',
      function() Snacks.picker.grep_buffers() end,
      desc = '[G]rep Buffers',
    },
    {
      '<leader>bq',
      function() Snacks.bufdelete() end,
      desc = '[Q]uit Buffer ',
    },
    {
      '<leader>bS',
      function() Snacks.scratch.select() end,
      desc = '[S]elect Scratch Buffer',
    },

    -- =========================================================================
    -- Find/File: File & project navigation
    -- =========================================================================
    {
      '<leader>ff',
      function() Snacks.picker.files() end,
      desc = 'Find [F]iles',
    },
    {
      '<leader>fp',
      function() Snacks.picker.projects() end,
      desc = 'Find [P]rojects',
    },
    {
      '<leader>fr',
      function() Snacks.picker.recent() end,
      desc = 'Find [R]ecent',
    },
    {
      '<leader>fR',
      function() Snacks.rename.rename_file() end,
      desc = '[R]ename File',
    },
    {
      '<leader>fw',
      function() Snacks.picker.grep_word() end,
      desc = 'Find/Grep [W]ord',
      mode = { 'n', 'x' },
    },

    -- =========================================================================
    -- Git: Git operations & GitHub integration
    -- =========================================================================
    {
      '<leader>gb',
      function() Snacks.picker.git_branches() end,
      desc = '[B]ranches',
    },
    {
      '<leader>gB',
      function() Snacks.gitbrowse() end,
      desc = 'Open [B]rowser',
      mode = { 'n', 'v' },
    },
    {
      '<leader>gd',
      function() Snacks.picker.git_diff() end,
      desc = '[D]iff (Hunks)',
    },
    {
      '<leader>gf',
      function() Snacks.picker.git_files() end,
      desc = 'Git [F]iles',
    },
    {
      '<leader>gF',
      function() Snacks.picker.git_log_file() end,
      desc = 'Git Log [F]ile',
    },
    {
      '<leader>gg',
      function() Snacks.lazygit() end,
      desc = 'Lazy[g]it',
    },
    {
      '<leader>gi',
      function() Snacks.picker.gh_issue() end,
      desc = 'GitHub [I]ssues (open)',
    },
    {
      '<leader>gI',
      function() Snacks.picker.gh_issue({ state = 'all' }) end,
      desc = 'GitHub [I]ssues (all)',
    },
    {
      '<leader>gl',
      function() Snacks.picker.git_log() end,
      desc = 'Git [L]og',
    },
    {
      '<leader>gL',
      function() Snacks.picker.git_log_line() end,
      desc = 'Git Log [L]ine',
    },
    {
      '<leader>gp',
      function() Snacks.picker.gh_pr() end,
      desc = 'GitHub [P]ull Requests (open)',
    },
    {
      '<leader>gP',
      function() Snacks.picker.gh_pr({ state = 'all' }) end,
      desc = 'GitHub [P]ull Requests (all)',
    },
    {
      '<leader>gs',
      function() Snacks.picker.git_status() end,
      desc = '[S]tatus',
    },
    {
      '<leader>gS',
      function() Snacks.picker.git_stash() end,
      desc = '[S]tash',
    },

    -- =========================================================================
    -- Help: Documentation & configuration
    -- =========================================================================
    {
      '<leader>ha',
      function() Snacks.picker.autocmds() end,
      desc = 'Explore [A]utocmds',
    },
    {
      '<leader>hc',
      function()
        Snacks.picker.files({
          cwd = vim.fn.stdpath('config'),
        })
      end,
      desc = 'HYPERfix [C]onfig Files',
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
      '<leader>nn',
      function() Snacks.picker.notifications() end,
      desc = '[N]otification History',
    },
    {
      '<leader>nN',
      desc = '[N]eovim News',
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
    -- Search: Search & inspection utilities
    -- =========================================================================
    {
      '<leader>sc',
      function() Snacks.picker.commands() end,
      desc = '[C]ommands',
    },
    {
      '<leader>sd',
      function() Snacks.picker.diagnostics() end,
      desc = '[D]iagnostics',
    },
    {
      '<leader>sD',
      function() Snacks.picker.diagnostics_buffer() end,
      desc = 'Buffer [D]iagnostics',
    },
    {
      '<leader>sh',
      function() Snacks.picker.search_history() end,
      desc = '[H]istory',
    },
    {
      '<leader>sH',
      function() Snacks.picker.highlights() end,
      desc = '[H]ighlights',
    },
    {
      '<leader>si',
      function() Snacks.picker.icons() end,
      desc = '[I]cons',
    },
    {
      '<leader>sj',
      function() Snacks.picker.jumps() end,
      desc = '[J]umps',
    },
    {
      '<leader>sl',
      function() Snacks.picker.lines() end,
      desc = '[L]ines',
    },
    {
      '<leader>sL',
      function() Snacks.picker.loclist() end,
      desc = '[L]ocation',
    },
    {
      '<leader>sm',
      function() Snacks.picker.marks() end,
      desc = '[M]arks',
    },
    {
      '<leader>sx',
      function() Snacks.picker.registers() end,
      desc = 'Register Inde[x]',
    },
    {
      '<leader>sR',
      function() Snacks.picker.resume() end,
      desc = '[R]esume Search',
    },
    {
      '<leader>su',
      function() Snacks.picker.undo() end,
      desc = '[U]ndo History',
    },
    {
      '<leader>sq',
      function() Snacks.picker.qflist() end,
      desc = '[Q]uickfix',
    },
    {
      '<leader>ss',
      function() Snacks.picker.lsp_symbols() end,
      desc = 'LSP [S]ymbols',
    },
    {
      '<leader>sS',
      function() Snacks.picker.lsp_workspace_symbols() end,
      desc = 'LSP Workspace [S]ymbols',
    },

    -- =========================================================================
    -- UI: Interface toggles & settings
    -- =========================================================================
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
    -- Other: Navigation & reference jumping
    -- =========================================================================
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
    {
      '<leader>qD',
      function() Snacks.dashboard() end,
      desc = '[D]ashboard',
    },

    -- =========================================================================
    -- LSP: Language server operations
    -- =========================================================================
    {
      'gd',
      function() Snacks.picker.lsp_definitions() end,
      desc = '[D]efinition',
    },
    {
      'gD',
      function() Snacks.picker.lsp_declarations() end,
      desc = '[D]eclaration',
    },
    {
      'gr',
      function() Snacks.picker.lsp_references() end,
      nowait = true,
      desc = '[R]eferences',
    },
    {
      'gI',
      function() Snacks.picker.lsp_implementations() end,
      desc = '[I]mplementation',
    },
    {
      'gy',
      function() Snacks.picker.lsp_type_definitions() end,
      desc = 'T[y]pe Definition',
    },
    {
      'gi',
      function() Snacks.picker.lsp_incoming_calls() end,
      desc = 'Calls [I]ncoming',
    },
    {
      'go',
      function() Snacks.picker.lsp_outgoing_calls() end,
      desc = 'Calls [O]utgoing',
    },
    {
      '<leader>cl',
      function() Snacks.picker.lsp_config() end,
      desc = '[L]sp Info',
    },
    {
      '<leader>ca',
      vim.lsp.buf.code_action,
      desc = 'Code [A]ction',
      mode = { 'n', 'x' },
    },
    {
      '<leader>cc',
      vim.lsp.codelens.run,
      desc = 'Run [C]odelens',
      mode = { 'n', 'x' },
    },
    {
      '<leader>cC',
      vim.lsp.codelens.refresh,
      desc = 'Refresh & Display [C]odelens',
      mode = { 'n' },
    },
    {
      '<leader>cr',
      vim.lsp.buf.rename,
      desc = '[R]ename',
    },
  },

  -- ===========================================================================
  -- INIT: Setup & configuration (runs at VeryLazy)
  -- ===========================================================================
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- =====================================================================
        -- Debug Utilities: Global functions for pretty debugging
        -- =====================================================================
        _G.dd = function(...) Snacks.debug.inspect(...) end
        _G.bt = function() Snacks.debug.backtrace() end

        -- Override print to use snacks for `:=` command
        if vim.fn.has('nvim-0.11') == 1 then
          vim._print = function(_, ...) dd(...) end
        else
          vim.print = _G.dd
        end

        -- =====================================================================
        -- Toggle Mappings: Create toggles for UI features (with <leader>u)
        -- =====================================================================
        Snacks.toggle.animate():map('<leader>ua')

        Snacks.toggle
          .option('conceallevel', {
            name = '[C]onceal',
            off = 0,
            on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2,
          })
          :map('<leader>uc')

        Snacks.toggle.diagnostics({ name = '[D]iagnostics' }):map('<leader>ud')

        Snacks.toggle.dim():map('<leader>uD', { desc = 'Dim' })
        Snacks.toggle.indent():map('<leader>ug', { desc = 'Indent Guides' })

        Snacks.toggle
          .option('relativenumber', { name = 'Re[l]ative Number' })
          :map('<leader>uL')

        Snacks.toggle.line_number({ name = '[L]ine number' }):map('<leader>ul')

        Snacks.toggle
          .treesitter({ name = '[T]reesitter Highlights' })
          :map('<leader>uT')

        Snacks.toggle.inlay_hints({ name = 'Inlay [H]ints' }):map('<leader>uh')

        Snacks.toggle.option('spell', { name = '[S]pelling' }):map('<leader>us')

        Snacks.toggle.scroll():map('<leader>uS')
        Snacks.toggle.option('wrap', { name = '[W]rap' }):map('<leader>uw')
      end,
    })
  end,
}
