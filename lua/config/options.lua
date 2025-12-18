-- =============================================================================
-- Globals
-- =============================================================================
-- WHAT: Global variables for Neovim behavior
-- WHY:  Configure behavior that affects the entire editor
-- HOW:  Set vim.g values for mapleader, LSP root detection, etc.
-- NOTE: These must be set before loading plugins that depend on them
-- =============================================================================

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.g.ai_cmp = true
vim.g.root_spec = { 'lsp', { '.git', 'lua' }, 'cwd' }
vim.g.markdown_recommended_style = 0

-- =============================================================================
-- Options (Undo & History)
-- =============================================================================
-- WHAT: Configure long-term undo history and backup behavior
-- HOW:  Disable swapfiles, enable undofile with high undo levels
-- =============================================================================

local opt = vim.opt

opt.swapfile = false
opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.backup = false -- Don't use backup files
opt.writebackup = false -- Don't use backup files

-- =============================================================================
-- Options (Display & Visual)
-- =============================================================================
-- WHAT: Configure visual display, colors, and rendering
-- WHY:  Improves readability and accessibility (WCAG AAA compliant)
-- HOW:  Set line spacing, colors, cursor visibility, highlight columns
-- =============================================================================

opt.background = 'dark'
opt.termguicolors = true -- True color support
opt.guifont = 'AtkynsonMonoNerdFont:h14' -- Optimized for readability
opt.linespace = 4 -- Atkinson Mono + 4px linespace is WCAG AAA compliant
opt.colorcolumn = '81' -- Show column at 81 chars
opt.cursorline = true -- Enable highlighting of the current line
opt.cursorcolumn = false -- Disable highlighting of the current column
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.ruler = false -- Disable the default ruler
opt.guicursor = ''

-- =============================================================================
-- Options (Indentation & Tabs)
-- =============================================================================
-- WHAT: Configure tab behavior and indentation
-- WHY:  Ensures consistent formatting across files
-- HOW:  Use spaces, set width to 2, enable smart indent
-- =============================================================================

opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 2 -- Number of spaces tabs count for
opt.softtabstop = 2 -- Number of spaces tabs count for in insert mode
opt.shiftwidth = 2 -- Size of an indent
opt.shiftround = true -- Round indent
opt.smartindent = true -- Insert indents automatically

-- =============================================================================
-- Options (Search & Replace)
-- =============================================================================
-- WHAT: Configure search behavior and substitution preview
-- WHY:  Improves search experience with better feedback
-- HOW:  Enable case-sensitive search with smart case, preview substitutions
-- =============================================================================

opt.hlsearch = false -- Highlight all matches on previous search pattern
opt.incsearch = true -- Incremental search
opt.ignorecase = true -- Ignore case
opt.smartcase = true -- Don't ignore case with capitals
opt.inccommand = 'nosplit' -- preview incremental substitute
opt.grepformat = '%f:%l:%c:%m'
opt.grepprg = 'rg --vimgrep'

-- =============================================================================
-- Options (Window & Split Behavior)
-- =============================================================================
-- WHAT: Configure window splitting and navigation
-- =============================================================================

opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.splitkeep = 'screen'
opt.scrolloff = 999 -- keep cursor in the middle of the screen
opt.sidescroll = 8 -- Columns to scroll horizontally
opt.sidescrolloff = 16 -- Columns of context
opt.winminwidth = 5 -- Minimum window width
opt.smoothscroll = true
opt.wrap = false -- Disable line wrap
opt.linebreak = true -- Wrap lines at convenient points

-- =============================================================================
-- Options (Completion & Menu)
-- =============================================================================
-- WHAT: Configure completion menu appearance and behavior
-- WHY:  Better control over autocompletion UX
-- HOW:  Set popup size, blend, and completion options
-- =============================================================================

opt.completeopt = 'menu,menuone,noselect'
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.pumblend = 10 -- Popup blend

-- =============================================================================
-- Options (Folding)
-- =============================================================================
-- WHAT: Configure code folding display and behavior
-- WHY:  Improves navigation in large files
-- HOW:  Use indent-based folding with custom fold characters
-- =============================================================================

opt.foldmethod = 'indent'
opt.foldlevel = 99
opt.foldtext = ''
opt.fillchars = {
  foldopen = '󱄰',
  foldclose = '󱄱',
}

-- =============================================================================
-- Options (Whitespace & Special Characters)
-- =============================================================================
-- WHAT: Configure display of invisible characters
-- WHY:  Makes whitespace visible to catch formatting issues
-- HOW:  Show tabs, trailing spaces, and line extends/precedes
-- =============================================================================

opt.list = true -- Show some invisible characters (tabs...)
opt.listchars = {
  tab = '▸ ',
  trail = '·',
  extends = '❯',
  precedes = '❮',
}

-- =============================================================================
-- Options (Formatting & Input)
-- =============================================================================
-- WHAT: Configure text formatting and user input handling
-- WHY:  Improves editing experience and text quality
-- HOW:  Set format options, confirm on exit, virtualedit for block mode
-- =============================================================================

opt.formatoptions = 'jcroqlnt'
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.virtualedit = 'block' -- Allow cursor to move where there is no text in visual block mode
opt.mouse = 'a' -- Enable mouse mode
opt.clipboard = 'unnamedplus' -- Sync with system clipboard

-- =============================================================================
-- Options (Modes & Status)
-- =============================================================================
-- WHAT: Configure mode display and status information
-- WHY:  Status info is shown via statusline plugin, not native display
-- HOW:  Hide native mode indicator, use global statusline
-- =============================================================================

opt.showmode = false -- Dont show mode since we have a statusline
opt.laststatus = 3 -- global statusline

-- =============================================================================
-- Options (Timing & Key Sequences)
-- =============================================================================
-- WHAT: Configure timing for key sequences and updates
-- WHY:  Provides time to think before triggering commands
-- HOW:  Set longer timeoutlen for which-key, updatetime for CursorHold
-- =============================================================================

opt.timeoutlen = 1250
opt.jumpoptions = 'view'

-- =============================================================================
-- Options (Messages & Feedback)
-- =============================================================================
-- WHAT: Configure which messages and warnings are shown
-- WHY:  Reduces visual clutter while keeping necessary feedback
-- HOW:  Use shortmess to suppress certain notifications
-- =============================================================================

opt.shortmess:append({
  W = true, -- Don't print "written" message
  I = true, -- Don't show intro message
  c = true, -- Don't show completion menu messages
  C = true, -- Don't show completion menu messages
})

-- =============================================================================
-- Options (Session Management)
-- =============================================================================
-- WHAT: Configure what information is saved in sessions
-- =============================================================================

opt.sessionoptions = {
  'buffers',
  'curdir',
  'tabpages',
  'winsize',
  'help',
  'globals',
  'skiprtp',
  'folds',
}

-- =============================================================================
-- Options (Command-Line)
-- =============================================================================
-- WHAT: Configure command-line completion behavior
-- HOW:  Use longest match first, then full completion
-- =============================================================================

opt.wildmode = 'longest:full,full' -- Command-line completion mode

-- =============================================================================
-- Options (Spelling)
-- =============================================================================
-- WHAT: Configure spell checking language
-- =============================================================================

opt.spelllang = { 'en' }
