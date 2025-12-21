-- =============================================================================
-- KEYMAPS: Custom Vim key bindings and remaps
-- =============================================================================
-- WHAT: Define custom keyboard shortcuts for common editor actions
-- WHY:  Faster workflow with mnemonic patterns (<leader>f = find, <leader>g = git)
-- HOW:  Use vim.keymap.set() with mode, key, action, and description
-- NOTE: Full reference in KEYMAPS.md; most keymaps come from plugins
-- REFERENCE: KEYMAPS.md for complete keymap documentation
-- =============================================================================

local map = vim.keymap.set
-- =============================================================================
-- Window navigation
-- -----------------------------------------------------------------------------
-- stylua: ignore start
map('n',  '<C-h>',                '<C-w>h',               { desc = 'Window Left' })
map('n',  '<C-j>',                '<C-w>j',               { desc = 'Window Down' })
map('n',  '<C-k>',                '<C-w>k',               { desc = 'Window Up' })
map('n',  '<C-l>',                '<C-w>l',               { desc = 'Window Right' })

-- =============================================================================
-- BUFFER MANAGEMENT
-- -----------------------------------------------------------------------------
map('n', '<leader>bn',             '<cmd>bnext<cr>',       { desc = '[N]ext Buffer' })
map('n', '<leader>bp',             '<cmd>bprevious<cr>',   { desc = '[P]rev Buffer' })


-- =============================================================================
-- TAB MANAGEMENT
-- -----------------------------------------------------------------------------
map('n',  '<leader><tab><tab>',   '<cmd>tabnew<cr>',      { desc = 'New [T]ab' })
map('n',  '<leader><tab>n',       '<cmd>tabnext<cr>',     { desc = '[N]ext' })
map('n',  '<leader><tab>p',       '<cmd>tabprevious<cr>', { desc = '[P]rev' })
map('n',  '<leader><tab>f',       '<cmd>tabfirst<cr>',    { desc = '[F]irst' })
map('n',  '<leader><tab>l',       '<cmd>tablast<cr>',     { desc = '[L]ast' })
map('n',  '<leader><tab>q',       '<cmd>tabclose<cr>',    { desc = '[Q]uit' })
map('n',  '<leader><tab>o',       '<cmd>tabonly<cr>',     { desc = 'Close [O]thers' })
-- stylua: ignore end

-- =============================================================================
-- MOVEMENT - Enhanced up/down navigation
-- -----------------------------------------------------------------------------
-- WHAT: Smart j/k movement (respects wrapped lines)
-- WHY: Lines that wrap shouldn't count as multiple "down" presses (gj/gk)
-- HOW: Uses expression mapping to choose between j/gj based on count
-- -----------------------------------------------------------------------------
map(
  { 'n', 'x' },
  'j',
  "v:count == 0 ? 'gj' : 'j'",
  { desc = 'Down', expr = true, silent = true }
)
map(
  { 'n', 'x' },
  '<Down>',
  "v:count == 0 ? 'gj' : 'j'",
  { desc = 'Down', expr = true, silent = true }
)
map(
  { 'n', 'x' },
  'k',
  "v:count == 0 ? 'gk' : 'k'",
  { desc = 'Up', expr = true, silent = true }
)
map(
  { 'n', 'x' },
  '<Up>',
  "v:count == 0 ? 'gk' : 'k'",
  { desc = 'Up', expr = true, silent = true }
)

-- =============================================================================
-- SEARCH NAVIGATION
-- -----------------------------------------------------------------------------
-- WHAT: Smart n/N search navigation (always goes forward/backward)
-- WHY: Default Vim n/N behavior reverses if you started search with '/' then used '?'
-- HOW: Uses expression mapping to intelligently choose forward or backward based on context
-- REFERENCE: https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- NOTE: 'zv' in normal mode opens folds to show matched line
-- -----------------------------------------------------------------------------
map(
  'n',
  'n',
  "'Nn'[v:searchforward].'zv'",
  { expr = true, desc = 'Next Search Result' }
)
map(
  'x',
  'n',
  "'Nn'[v:searchforward]",
  { expr = true, desc = 'Next Search Result' }
)
map(
  'o',
  'n',
  "'Nn'[v:searchforward]",
  { expr = true, desc = 'Next Search Result' }
)
map(
  'n',
  'N',
  "'nN'[v:searchforward].'zv'",
  { expr = true, desc = 'Prev Search Result' }
)
map(
  'x',
  'N',
  "'nN'[v:searchforward]",
  { expr = true, desc = 'Prev Search Result' }
)
map(
  'o',
  'N',
  "'nN'[v:searchforward]",
  { expr = true, desc = 'Prev Search Result' }
)

-- =============================================================================
-- UNDO BREAK-POINTS
-- -----------------------------------------------------------------------------
-- WHAT: Create undo boundaries after punctuation in insert mode
-- WHY: Allows undoing text after specific punctuation without losing everything
-- HOW: <c-g>u creates an undo point without moving cursor
-- -----------------------------------------------------------------------------
-- stylua: ignore start
map('i',    ',',    ',<c-g>u')
map('i',    '.',    '.<c-g>u')
map('i',    ';',    ';<c-g>u')
-- stylua: ignore end

-- =============================================================================
-- SMART CLOSING PUNCTUATION SKIP
-- =============================================================================
-- WHAT: Skip past closing punctuation in insert mode
-- WHY:  Streamlines workflow—jump over ) } ] ' " without arrow keys
-- HOW:  Checks if next character is closing punctuation, moves cursor forward
-- =============================================================================
map('i', '<C-;>', function()
  local line = vim.api.nvim_get_current_line()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local next_char = line:sub(col + 1, col + 1)

  if next_char:match('[)%]}\'" ]') then
    vim.api.nvim_win_set_cursor(0, { row, col + 1 })
  end
end, { noremap = true, silent = true, desc = 'Skip past closing punctuation' })

-- =============================================================================
-- FILE MANAGEMENT
-- -----------------------------------------------------------------------------
map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })
map('n', '<leader>fn', '<cmd>enew<cr>', { desc = '[N]ew File' })

-- =============================================================================
-- INDENTATION
-- -----------------------------------------------------------------------------
-- WHAT: Re-indent selection when using < or > in visual mode
-- HOW: gv reselects previous visual selection after the indent
-- -----------------------------------------------------------------------------
-- stylua: ignore start
map('x',    '<',            '<gv')
map('x',    '>',            '>gv')

-- =============================================================================
-- PLUGIN MANAGEMENT
-- -----------------------------------------------------------------------------
map('n',    '<leader>nl',   '<cmd>Lazy<cr>',  { desc = '[L]azy' })
-- stylua: ignore end

-- =============================================================================
-- DIAGNOSTICS TOGGLE
-- =============================================================================
-- WHAT: Toggle virtual text diagnostics on/off
-- WHY:  Reduces visual clutter when you need focus or enables diagnostics when needed
-- HOW:  Uses vim.diagnostic.config to toggle virtual_text on current buffer
-- =============================================================================
map('n', '<leader>uv', function()
  local config = vim.diagnostic.config()
  local vtext = config.virtual_text
  -- Toggle: if enabled, disable; if disabled, enable with default settings
  vim.diagnostic.config({ virtual_text = not vtext })
  local status = not vtext and 'enabled' or 'disabled'
  Snacks.notify.info('Virtual text diagnostics ' .. status)
end, { desc = 'Toggle [V]irtual Text Diagnostics' })

-- =============================================================================
-- APPLICATION MANAGEMENT
-- =============================================================================
-- WHAT: Quit group keymaps with session support
-- WHY: Save sessions and prompt for unsaved changes before quitting
-- HOW: <leader>qq = quit all, <leader>qw = save all & quit, <leader>qQ = force quit
--      <leader>qs = save session, <leader>qr = restore session (picker)
-- =============================================================================
map('n', '<leader>qq', '<cmd>qa<cr>', { desc = '[Q]uit All' })

map('n', '<leader>qw', '<cmd>wqa<cr>', { desc = '[W]rite & Quit' })

map('n', '<leader>qW', function()
  local sessions = require('mini.sessions')
  local active_session = vim.v.this_session ~= '' and vim.v.this_session or nil

  -- Handle session saving first
  if not active_session then
    -- No active session - prompt for session name
    vim.ui.input(
      { prompt = 'Session name (leave blank to skip): ' },
      function(name)
        if name and name ~= '' then sessions.write(name) end
        -- Let nvim handle saving/quitting with :wqa
        -- (nvim will prompt for unsaved buffers if any)
        vim.cmd('wqa')
      end
    )
  else
    -- Active session exists - save it and quit
    sessions.write()
    vim.cmd('wqa')
  end
end, { desc = '[W]rite to Session & Quit' })

map('n', '<leader>qQ', '<cmd>q!<cr>', { desc = 'Force [Q]uit' })

map('n', '<leader>qs', function()
  local sessions = require('mini.sessions')
  local active_session = vim.v.this_session ~= '' and vim.v.this_session or nil

  if active_session then
    -- Active session - save it
    sessions.write()
    Snacks.notify.info(
      'Session "' .. vim.fn.fnamemodify(active_session, ':t:r') .. '" saved'
    )
  else
    -- No active session - prompt for name
    vim.ui.input({ prompt = 'Session name: ' }, function(name)
      if name and name ~= '' then
        sessions.write(name)
        Snacks.notify.info('Session "' .. name .. '" saved')
      end
    end)
  end
end, { desc = '[S]ave Session' })

map(
  'n',
  '<leader>qr',
  function() require('mini.sessions').select() end,
  { desc = '[R]estore Session' }
)

map(
  'n',
  '<leader>qd',
  function() require('mini.sessions').select('delete') end,
  { desc = '[D]elete Session' }
)

map(
  'n',
  '<Esc>',
  '<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>',
  { desc = 'Refresh Screen' }
)

-- =============================================================================
-- COMMENTING
-- -----------------------------------------------------------------------------
map(
  'n',
  'gco',
  'o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>',
  { desc = 'Add Comment Below' }
)
map(
  'n',
  'gcO',
  'O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>',
  { desc = 'Add Comment Above' }
)
