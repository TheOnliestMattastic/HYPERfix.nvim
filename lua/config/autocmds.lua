-- =============================================================================
-- AUTOCOMMANDS
-- =============================================================================
-- WHAT: Autocommands automatically trigger actions in response to events
--       (e.g., when you open a file, save it, switch focus, resize window)
--
-- WHY:  Automate repetitive tasks without manual keybinds. Examples:
--       - Reload file if it changed on disk
--       - Highlight text you just yanked
--       - Enable spell-check for markdown
--       - Auto-create parent directories when saving
--
-- HOW:  Use vim.api.nvim_create_autocmd() with:
--       - event(s) to trigger on (e.g., "BufReadPost", "FileType")
--       - group: organizes related commands (must use augroup helper)
--       - pattern: optional filter (e.g., only .lua files, or "markdown")
--       - callback: function to execute when event fires
--
-- REFERENCE: https://neovim.io/doc/user/autocmd.html
-- =============================================================================

local function augroup(name)
  return vim.api.nvim_create_augroup('hyperfix_' .. name, { clear = true })
end

-- =============================================================================
-- Checktime: Reload File on External Changes
-- =============================================================================
-- WHAT: Detects when a file changes on disk and reloads it in your buffer
-- WHY:  Keeps your buffer in sync if another process modifies the file
--       (prevents "file changed" conflicts)
-- HOW:  Triggers on FocusGained (window refocuses), TermClose, TermLeave
--       and runs :checktime to reload if needed
-- =============================================================================
vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
  group = augroup('checktime'),
  callback = function()
    if vim.o.buftype ~= 'nofile' then vim.cmd('checktime') end
  end,
})

-- =============================================================================
-- Highlight on Yank: Visual Feedback When Copying
-- =============================================================================
-- WHAT: Briefly highlights text you just yanked (copied)
-- WHY:  Provides visual feedback so you know the selection worked
-- HOW:  Triggers on TextYankPost and calls vim's built-in highlight.on_yank()
-- =============================================================================
vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup('highlight_yank'),
  callback = function() (vim.hl or vim.highlight).on_yank() end,
})

-- =============================================================================
-- Resize Splits: Auto-Balance Window Layout
-- =============================================================================
-- WHAT: Automatically resizes splits when the Neovim window is resized
-- WHY:  Keeps your window layout proportional and balanced after resizing
-- HOW:  Triggers on VimResized and runs wincmd = (equal width/height)
-- =============================================================================
vim.api.nvim_create_autocmd({ 'VimResized' }, {
  group = augroup('resize_splits'),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd('tabdo wincmd =')
    vim.cmd('tabnext ' .. current_tab)
  end,
})

-- =============================================================================
-- Last Location: Jump to Where You Left Off
-- =============================================================================
-- WHAT: Reopens a file at the cursor position where you last closed it
-- WHY:  Speeds up workflow by skipping manual navigation back to where
--       you were working
-- HOW:  Triggers on BufReadPost, restores the " mark (last position)
--       if it's valid (excluding git commits and other special files)
-- =============================================================================
vim.api.nvim_create_autocmd('BufReadPost', {
  group = augroup('last_loc'),
  callback = function(event)
    local exclude = { 'gitcommit' }
    local buf = event.buf
    if
      vim.tbl_contains(exclude, vim.bo[buf].filetype)
      or vim.b[buf].hyperfix_last_loc
    then
      return
    end
    vim.b[buf].hyperfix_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- =============================================================================
-- Close With 'q': Quick Exit for Help/Info/Output Buffers
-- =============================================================================
-- WHAT: Maps 'q' key to close help, info panels, and output windows
-- WHY:  Provides a consistent, intuitive way to exit read-only buffers
--       (easier than remembering :close or :quit)
-- HOW:  Triggers on FileType for specific filetypes (help, lspinfo, etc.)
--       and maps 'q' to close + delete the buffer
-- NOTE: Marks these buffers as unlisted so they don't clutter buffer list
-- =============================================================================
vim.api.nvim_create_autocmd('FileType', {
  group = augroup('close_with_q'),
  pattern = {
    'PlenaryTestPopup',
    'checkhealth',
    'dbout',
    'gitsigns-blame',
    'grug-far',
    'help',
    'lspinfo',
    'neotest-output',
    'neotest-output-panel',
    'neotest-summary',
    'notify',
    'qf',
    'spectre_panel',
    'startuptime',
    'tsplayground',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      Snacks.keymap.set('n', 'q', function()
        vim.cmd('close')
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = 'Quit buffer',
      })
    end)
  end,
})

-- =============================================================================
-- Man Unlisted: Hide Man Pages from Buffer List
-- =============================================================================
-- WHAT: Hides man page buffers from the buffer list
-- WHY:  Keeps your buffer list clean when viewing man pages inline
-- HOW:  Triggers on FileType "man" and sets buflisted = false
-- =============================================================================
vim.api.nvim_create_autocmd('FileType', {
  group = augroup('man_unlisted'),
  pattern = { 'man' },
  callback = function(event) vim.bo[event.buf].buflisted = false end,
})

-- =============================================================================
-- Disable colorcolumn when wrap is on
-- ----------------------------------------------------------------------------
vim.api.nvim_create_autocmd('OptionSet', {
  group = augroup('wrap_colorcolumn'),
  pattern = 'wrap',
  callback = function()
    if vim.wo[0].wrap then
      vim.opt_local.colorcolumn = ''
    else
      vim.opt_local.colorcolumn = '81'
    end
  end,
})

-- =============================================================================
-- JSON Conceal: Show All JSON Content
-- =============================================================================
-- WHAT: Disables concealing for JSON files so nothing is hidden
-- WHY:  JSON files should always show all content (no hidden characters)
--       Default conceallevel would hide quotes/brackets
-- HOW:  Triggers on FileType for json/jsonc/json5 and sets conceallevel = 0
-- =============================================================================
vim.api.nvim_create_autocmd({ 'FileType' }, {
  group = augroup('json_conceal'),
  pattern = { 'json', 'jsonc', 'json5' },
  callback = function() vim.opt_local.conceallevel = 0 end,
})

-- =============================================================================
-- Auto Create Directory: Create Parent Dirs on Save
-- =============================================================================
-- WHAT: Automatically creates parent directories when saving a file
-- WHY:  Prevents "parent directory doesn't exist" errors when saving
--       to a path with missing intermediate directories
-- HOW:  Triggers on BufWritePre and creates directory structure with mkdir
-- NOTE: Skips remote files (ssh://, http://, etc.)
-- =============================================================================
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  group = augroup('auto_create_dir'),
  callback = function(event)
    if event.match:match('^%w%w+:[\\/][\\/]') then return end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})
