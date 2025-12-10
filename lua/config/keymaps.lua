local map = vim.keymap.set
-- ============================================================================
-- Window navigation
-- ----------------------------------------------------------------------------
map("n", "<C-h>", "<C-w>h", { desc = "Window Left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window Down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window Up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window Right" })

-- ============================================================================
-- TAB MANAGEMENT
-- ----------------------------------------------------------------------------
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New" })
map("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Next" })
map("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Previous" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First" })
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last" })
map("n", "<leader><tab>q", "<cmd>tabclose<cr>", { desc = "Close" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Others" })

-- ============================================================================
-- MOVEMENT - Enhanced up/down navigation
-- WHAT: Smart j/k movement (respects wrapped lines)
-- WHY: Lines that wrap shouldn't count as multiple "down" presses (gj/gk)
-- HOW: Uses expression mapping to choose between j/gj based on count
-- ----------------------------------------------------------------------------
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- ============================================================================
-- MOVING LINES
-- WHAT: Move lines up/down using Alt+j/k
-- ----------------------------------------------------------------------------
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- ============================================================================
-- SEARCH NAVIGATION
-- WHAT: Smart n/N search navigation (always goes forward/backward)
-- WHY: Default Vim n/N behavior reverses if you started search with '/' then used '?'
-- HOW: Uses expression mapping to intelligently choose forward or backward based on context
-- SOURCE: https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- NOTE: 'zv' in normal mode opens folds to show matched line
-- ----------------------------------------------------------------------------
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- ============================================================================
-- UNDO BREAK-POINTS
-- WHAT: Create undo boundaries after punctuation in insert mode
-- WHY: Allows undoing text after specific punctuation without losing everything
-- HOW: <c-g>u creates an undo point without moving cursor
-- ----------------------------------------------------------------------------
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- ============================================================================
-- FILE MANAGEMENT
-- ----------------------------------------------------------------------------
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- ============================================================================
-- INDENTATION
-- WHAT: Re-indent selection when using < or > in visual mode
-- HOW: gv reselects previous visual selection after the indent
-- ----------------------------------------------------------------------------
map("x", "<", "<gv")
map("x", ">", ">gv")

-- ============================================================================
-- PLUGIN MANAGEMENT
-- ----------------------------------------------------------------------------
-- map("n", "<leader>nl", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- ============================================================================
-- APPLICATION MANAGEMENT
-- ----------------------------------------------------------------------------
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
map("n", "<Esc>", "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>", { desc = "Refresh Screen" })

