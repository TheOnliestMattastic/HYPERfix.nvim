# Keymaps

```lua

-- DAP
-- -------------------------------------------------------------------
vim.keymap.set("n",   "<leader>db",   dap.toggle_breakpoint,  { desc = "[B]reakpoint" })
vim.keymap.set("n",   "<leader>dc",   dap.continue,           { desc = "[C]ontinue" })
vim.keymap.set("n",   "<leader>di",   dap.step_into,          { desc = "Step [I]nto" })
vim.keymap.set("n",   "<leader>do",   dap.step_over,          { desc = "Step [O]ver" })
vim.keymap.set("n",   "<leader>du",   ui.toggle,              { desc = "DAP [U]I" })

-- Flash
-- ---------------------------------------------------------------
{ "<CR>", mode = { "n", "x", "o" }, function()
  require("flash").jump() 
end, desc = "Flash" },

{ "<SHIFT><CR>", mode = { "n", "x", "o" }, function()
  require("flash").treesitter()
end, desc = "Flash Treesitter" },

{ "r", mode = "o", function()
  require("flash").remote()
end, desc = "Remote Flash" },

{ "R", mode = { "o", "x" }, function()
  require("flash").treesitter_search()
end, desc = "Treesitter Search" },

{ "<c-x>", mode = { "c" }, function()
  require("flash").toggle()
end, desc = "Toggle Flash Search" },

-- Grug-far
-- -------------------------------------------------------------
{
  "<leader>sr",
  function()
    local grug = require("grug-far")
    local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
    grug.open({
      transient = true,
      prefills = {
        filesFilter = ext and ext ~= "" and "*." .. ext or nil,
      },
    })
  end,
  mode = { "n", "x" },
  desc = "Search and Replace",
},

-- LSP
-- -----------------------------------------------------
{ "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" }

map('<leader>cr', vim.lsp.buf.rename,                                '[R]ename')
map('<leader>ca', vim.lsp.buf.code_action,                           'Code [A]ction', { 'n', 'x' })
map('glr', require('Snacks.picker').lsp_references,                  '[R]eferences')
map('gli', require('Snacks.picker').lsp_implementations,             '[I]mplementation')
map('gld', require('Snacks.picker').lsp_definitions,                 '[D]efinition')
map('glD', vim.lsp.buf.declaration,                                  '[D]eclaration')
map('gls', require('Snacks.picker').lsp_document_symbols,            'Document [S]ymbols')
map('glS', require('Snacks.picker').lsp_dynamic_workspace_symbols,   'Workspace [S]ymbols')
map('glt', require('Snacks.picker').lsp_type_definitions,            '[T]ype Definition')

if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
  map('<leader>\\H', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
  end, 'Toggle Inlay [H]ints')
end

{
  '<leader>cf',
  function()
    require('conform').format { async = true, lsp_format = 'fallback' }
  end,
  mode = '',
  desc = '[F]ormat buffer',
},

-- Mini.nvim
-- -------------------------------------------------------
o = ai.gen_spec.treesitter({
  a = { "@block.outer", "@conditional.outer", "@loop.outer" },
  i = { "@block.inner", "@conditional.inner", "@loop.inner" },
}),

-- function
f = ai.gen_spec.treesitter({
  a = "@function.outer",
  i = "@function.inner"
}),

-- class
c = ai.gen_spec.treesitter({
  a = "@class.outer",
  i = "@class.inner"
}),

-- tags
t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>",
  "^<.->().*()</[^/]->$"
},

-- digits
d = { "%f[%d]%d+" },

-- Word with case
e = {{
  "%u[%l%d]+%f[^%l%d]",
  "%f[%S][%l%d]+%f[^%l%d]",
  "%f[%P][%l%d]+%f[^%l%d]",
  "^[%l%d]+%f[^%l%d]"},
  "^().*()$",
},

vim.keymap.set("n", "<leader>e", function()
  if not require("mini.files").close() then require("mini.files").open() end
end, { desc = "Mini Fil[e]s" })

-- Render-markdown
-- ---------------------------------------------------------------
Snacks.toggle({
  name = "Render Markdown",
  get = require("render-markdown").get,
  set = require("render-markdown").set,
}):map("\\m")

-- Snacks
-- -----------------------------------------------------------------
{ "<leader><space>",  function() Snacks.picker.smart() end,           desc = "Smart Find" },
{ "<leader>.",        function() Snacks.scratch() end,                desc = "Scratch Buffer" },
{ "<leader>,",        function() Snacks.picker.buffers() end,         desc = "Buffers" },
{ "<leader>/",        function() Snacks.picker.grep() end,            desc = "Grep" },
{ "<leader>:",        function() Snacks.picker.command_history() end, desc = "Cmd History" },
{ "<leader>gg",       function() Snacks.lazygit() end,                desc = "Lazygit" },
{ "<c-/>",            function() Snacks.terminal() end,               desc = "Terminal" },

-- todo-comments
-- ---------------------------------------------------------------------
{
  "]t",
  function()require("todo-comments").jump_next()end,
  desc = "Next Todo Comment"
},
{
  "[t",
  function()require("todo-comments").jump_prev()end,
  desc = "Previous Todo Comment"
},
{
  "<leader>xt",
  "<cmd>Trouble todo toggle<cr>",
  desc = "Todo (Trouble)"
},
{
  "<leader>xT",
  "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>",
  desc = "Todo/Fix/Fixme (Trouble)"
},
{
  "<leader>st",
  "<cmd>TodoTelescope<cr>",
  desc = "Todo"
},
{
  "<leader>sT",
  "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",
  desc = "Todo/Fix/Fixme"
},

-- treesitter
-- -----------------------------------------------------------
Snacks.toggle({
  name = "[T]reesitter Context",
  get = tsc.enabled,
  set = function(state)
    if state then
      tsc.enable()
    else
      tsc.disable()
    end
  end,
}):map("<leader>ut")


init_selection = "gvv",
node_incremental = "gvn",
scope_incremental = "gvs",
node_decremental = "gvp",

['@parameter.outer'] = 'v', -- charwise
['@function.outer'] = 'V', -- linewise
['@class.outer'] = '<c-v>', -- blockwise

-- trouble
-- ------------------------------------------------------------
{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
{ "<leader>cs", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols (Trouble)" },
{ "<leader>cS", "<cmd>Trouble lsp toggle<cr>", desc = "LSP references/definitions/... (Trouble)" },
{ "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
{ "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
{
  "[q",
  function()
    if require("trouble").is_open() then
      require("trouble").prev({ skip_groups = true, jump = true })
    else
      local ok, err = pcall(vim.cmd.cprev)
      if not ok then
        vim.notify(err, vim.log.levels.ERROR)
      end
    end
  end,
  desc = "Previous Trouble/Quickfix Item",
},
{
  "]q",
  function()
    if require("trouble").is_open() then
      require("trouble").next({ skip_groups = true, jump = true })
    else
      local ok, err = pcall(vim.cmd.cnext)
      if not ok then
        vim.notify(err, vim.log.levels.ERROR)
      end
    end
  end,
  desc = "Next Trouble/Quickfix Item",
},

-- which-key
-- ------------------------------------------------------------------
{
  "<leader>?",
  function()
    require("which-key").show({ global = false })
  end,
  desc = "Keymaps",
},

-- ============================================================================
-- Window navigation
-- ----------------------------------------------------------------------------
map("n",    "<C-h>",                "<C-w>h",                 { desc = "Window Left" })
map("n",    "<C-j>",                "<C-w>j",                 { desc = "Window Down" })
map("n",    "<C-k>",                "<C-w>k",                 { desc = "Window Up" })
map("n",    "<C-l>",                "<C-w>l",                 { desc = "Window Right" })

-- ============================================================================
-- TAB MANAGEMENT
-- ----------------------------------------------------------------------------
map("n",    "<leader><tab><tab>",   "<cmd>tabnew<cr>",        { desc = "New" })
map("n",    "<leader><tab>n",       "<cmd>tabnext<cr>",       { desc = "Next" })
map("n",    "<leader><tab>p",       "<cmd>tabprevious<cr>",   { desc = "Previous" })
map("n",    "<leader><tab>f",       "<cmd>tabfirst<cr>",      { desc = "First" })
map("n",    "<leader><tab>l",       "<cmd>tablast<cr>",       { desc = "Last" })
map("n",    "<leader><tab>q",       "<cmd>tabclose<cr>",      { desc = "Close" })
map("n",    "<leader><tab>o",       "<cmd>tabonly<cr>",       { desc = "Close Others" })

-- ============================================================================
-- MOVEMENT - Enhanced up/down navigation
-- WHAT: Smart j/k movement (respects wrapped lines)
-- WHY: Lines that wrap shouldn't count as multiple "down" presses (gj/gk)
-- HOW: Uses expression mapping to choose between j/gj based on count
-- ----------------------------------------------------------------------------
map({ "n", "x" },   "j",        "v:count == 0 ? 'gj' : 'j'",  { desc = "Down", expr = true, silent = true })
map({ "n", "x" },   "<Down>",   "v:count == 0 ? 'gj' : 'j'",  { desc = "Down", expr = true, silent = true })
map({ "n", "x" },   "k",        "v:count == 0 ? 'gk' : 'k'",  { desc = "Up", expr = true, silent = true })
map({ "n", "x" },   "<Up>",     "v:count == 0 ? 'gk' : 'k'",  { desc = "Up", expr = true, silent = true })

-- ============================================================================
-- SEARCH NAVIGATION
-- WHAT: Smart n/N search navigation (always goes forward/backward)
-- WHY: Default Vim n/N behavior reverses if you started search with '/' then used '?'
-- HOW: Uses expression mapping to intelligently choose forward or backward based on context
-- SOURCE: https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- NOTE: 'zv' in normal mode opens folds to show matched line
-- ----------------------------------------------------------------------------
map("n",    "n",    "'Nn'[v:searchforward].'zv'",   { expr = true, desc = "Next Search Result" })
map("x",    "n",    "'Nn'[v:searchforward]",        { expr = true, desc = "Next Search Result" })
map("o",    "n",    "'Nn'[v:searchforward]",        { expr = true, desc = "Next Search Result" })
map("n",    "N",    "'nN'[v:searchforward].'zv'",   { expr = true, desc = "Prev Search Result" })
map("x",    "N",    "'nN'[v:searchforward]",        { expr = true, desc = "Prev Search Result" })
map("o",    "N",    "'nN'[v:searchforward]",        { expr = true, desc = "Prev Search Result" })

-- ============================================================================
-- UNDO BREAK-POINTS
-- WHAT: Create undo boundaries after punctuation in insert mode
-- WHY: Allows undoing text after specific punctuation without losing everything
-- HOW: <c-g>u creates an undo point without moving cursor
-- ----------------------------------------------------------------------------
map("i",    ",",    ",<c-g>u")
map("i",    ".",    ".<c-g>u")
map("i",    ";",    ";<c-g>u")

-- ============================================================================
-- FILE MANAGEMENT
-- ----------------------------------------------------------------------------
map({ "i", "x", "n", "s" },   "<C-s>",    "<cmd>w<cr><esc>",    { desc = "Save File" })
map("n",                  "<leader>fn",   "<cmd>enew<cr>",      { desc = "New File" })

-- ============================================================================
-- INDENTATION
-- WHAT: Re-indent selection when using < or > in visual mode
-- HOW: gv reselects previous visual selection after the indent
-- ----------------------------------------------------------------------------
map("x",    "<",    "<gv")
map("x",    ">",    ">gv")

-- ============================================================================
-- PLUGIN MANAGEMENT
-- ----------------------------------------------------------------------------
map("n", "<leader>nl", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- ============================================================================
-- APPLICATION MANAGEMENT
-- ----------------------------------------------------------------------------
map("n",    "<leader>qq",   "<cmd>qa<cr>",                                          { desc = "Quit All" })
map("n",    "<Esc>",        "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>", { desc = "Refresh Screen" })
```
