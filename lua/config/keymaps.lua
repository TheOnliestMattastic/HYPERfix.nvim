-- =============================================================================
-- LUA/CONFIG/KEYMAPS.MD
-- -----------------------------------------------------------------------------
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
-- APPLICATION MANAGEMENT
-- -----------------------------------------------------------------------------
map('n', '<leader>qq', '<cmd>qa<cr>', { desc = '[Q]uit All' })
map('n', '<leader>qw', '<cmd>wq<cr>', { desc = '[W]rite & Quit' })
map('n', '<leader>qQ', '<cmd>q!<cr>', { desc = '[Q]uit w/o Writing' })
map(
  'n',
  '<Esc>',
  '<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>',
  { desc = 'Refresh Screen' }
)
