# Keymaps Reference

## Core Navigation

### Window Navigation
| Keymap | Mode | Action |
|--------|------|--------|
| `<C-h>` | Normal | Move to left window |
| `<C-j>` | Normal | Move to bottom window |
| `<C-k>` | Normal | Move to top window |
| `<C-l>` | Normal | Move to right window |

### Line Navigation (Respects Line Wrapping)
| Keymap | Mode | Action |
|--------|------|--------|
| `j` | Normal, Visual | Move down (respects wrapped lines) |
| `k` | Normal, Visual | Move up (respects wrapped lines) |
| `<Down>` | Normal, Visual | Move down (respects wrapped lines) |
| `<Up>` | Normal, Visual | Move up (respects wrapped lines) |

### Smart Search Navigation
| Keymap | Mode | Action |
|--------|------|--------|
| `n` | Normal, Visual, Operator | Next search result (intelligent direction) |
| `N` | Normal, Visual, Operator | Previous search result (intelligent direction) |

---

## Tab Management
| Keymap | Mode | Action |
|--------|------|--------|
| `<leader><tab><tab>` | Normal | New tab |
| `<leader><tab>n` | Normal | Next tab |
| `<leader><tab>p` | Normal | Previous tab |
| `<leader><tab>f` | Normal | First tab |
| `<leader><tab>l` | Normal | Last tab |
| `<leader><tab>q` | Normal | Close current tab |
| `<leader><tab>o` | Normal | Close all other tabs |

---

## File Management
| Keymap | Mode | Action |
|--------|------|--------|
| `<C-s>` | Normal, Insert, Visual, Select | Save file |
| `<leader>fn` | Normal | Create new file |
| `<leader>nl` | Normal | Open Lazy (plugin manager) |

---

## Text Editing

### Undo Break-points (Insert Mode)
| Keymap | Mode | Action |
|--------|------|--------|
| `,` | Insert | Comma + undo break-point |
| `.` | Insert | Period + undo break-point |
| `;` | Insert | Semicolon + undo break-point |

### Visual Mode Indentation
| Keymap | Mode | Action |
|--------|------|--------|
| `<` | Visual | Unindent and reselect |
| `>` | Visual | Indent and reselect |

---

## Escape Sequences
| Keymap | Mode | Action |
|--------|------|--------|
| `jk` | Insert, Command, Visual, Select | Exit to Normal mode |
| `kj` | Insert, Command, Visual, Select | Exit to Normal mode |
| `jk` | Terminal | Exit to Normal mode |
| `kj` | Terminal | Exit to Normal mode |
| `<Esc>` | Normal | Clear search, refresh screen |

---

## Screen Control
| Keymap | Mode | Action |
|--------|------|--------|
| `<Esc>` | Normal | Clear hlsearch, update diff, refresh screen |
| `<leader>qq` | Normal | Quit all |

---

## DAP (Debugging)
| Keymap | Mode | Action |
|--------|------|--------|
| `<leader>db` | Normal | Toggle breakpoint |
| `<leader>dc` | Normal | Continue execution |
| `<leader>di` | Normal | Step into |
| `<leader>do` | Normal | Step over |
| `<leader>du` | Normal | Toggle DAP UI |

---

## Flash (Smart Navigation)
| Keymap | Mode | Action |
|--------|------|--------|
| `<CR>` | Normal, Visual, Operator | Jump to location with labels |
| `<Shift><CR>` | Normal, Visual, Operator | Jump to Treesitter node |
| `r` | Operator | Remote flash (perform motion at different location) |
| `R` | Operator, Visual | Treesitter search |
| `<C-x>` | Command | Toggle Flash search |

---

## Grug-far (Search & Replace)
| Keymap | Mode | Action |
|--------|------|--------|
| `<leader>sr` | Normal, Visual | Open search & replace dialog |
| `<localleader>r` | Grug-far Buffer | Perform replace |
| `<localleader>c` | Grug-far Buffer | Close grug-far |
| `<Enter>` | Grug-far Buffer | Go to result location |
| `<Up>` | Grug-far Buffer | Open previous result |
| `<Down>` | Grug-far Buffer | Open next result |

---

## LSP (Language Server Protocol)

### General LSP
| Keymap | Mode | Action |
|--------|------|--------|
| `<leader>cm` | Normal | Open Mason (LSP manager) |

### Code Navigation
| Keymap | Mode | Action |
|--------|------|--------|
| `gld` | Normal | Go to definition |
| `glD` | Normal | Go to declaration |
| `glr` | Normal | Find references |
| `gli` | Normal | Find implementations |
| `glt` | Normal | Go to type definition |
| `gls` | Normal | Document symbols |
| `glS` | Normal | Workspace symbols |

### Code Actions
| Keymap | Mode | Action |
|--------|------|--------|
| `<leader>cr` | Normal | Rename symbol |
| `<leader>ca` | Normal, Visual | Code action |
| `<leader>cf` | Normal, Visual, Select | Format buffer |
| `<leader>\H` | Normal | Toggle inlay hints |

---

## Treesitter

### Incremental Selection
| Keymap | Mode | Action |
|--------|------|--------|
| `gvv` | Normal | Initialize selection |
| `gvn` | Normal | Expand to next node |
| `gvs` | Normal | Expand to scope |
| `gvp` | Normal | Shrink to previous node |

### Treesitter Context
| Keymap | Mode | Action |
|--------|------|--------|
| `\t` | Normal | Toggle treesitter context panel |

---

## Mini.nvim

### Mini.files (File Navigator)
| Keymap | Mode | Action |
|--------|------|--------|
| `<leader>e` | Normal | Toggle file explorer |

### Mini.surround (Surrounds)
| Keymap | Mode | Action |
|--------|------|--------|
| `sa` | Normal, Visual | Add surrounding |
| `sd` | Normal | Delete surrounding |
| `sr` | Normal | Replace surrounding |
| `sf` | Normal | Find surrounding (cursor right) |
| `sF` | Normal | Find surrounding (cursor left) |
| `sh` | Normal | Highlight surrounding |
| `sa` suffix | Normal | Add with last/next modifier |
| `sd` suffix | Normal | Delete with last/next modifier |

### Mini.comment (Commenting)
| Keymap | Mode | Action |
|--------|------|--------|
| `gc` | Normal, Visual | Toggle comment (line) |
| `gb` | Normal, Visual | Toggle comment (block) |

### Mini.bracketed (Navigation)
| Keymap | Mode | Action |
|--------|------|--------|
| `[b` / `]b` | Normal, Visual, Operator | Previous/next buffer |
| `[B` / `]B` | Normal, Visual, Operator | First/last buffer |
| `[c` / `]c` | Normal, Visual, Operator | Previous/next comment |
| `[C` / `]C` | Normal, Visual, Operator | First/last comment |
| `[d` / `]d` | Normal, Visual, Operator | Previous/next diagnostic |
| `[D` / `]D` | Normal, Visual, Operator | First/last diagnostic |
| `[f` / `]f` | Normal, Visual, Operator | Previous/next file on disk |
| `[F` / `]F` | Normal, Visual, Operator | First/last file on disk |
| `[i` / `]i` | Normal, Visual, Operator | Previous/next indent change |
| `[I` / `]I` | Normal, Visual, Operator | First/last indent change |
| `[j` / `]j` | Normal, Visual, Operator | Previous/next jump in buffer |
| `[J` / `]J` | Normal, Visual, Operator | First/last jump in buffer |
| `[l` / `]l` | Normal, Visual, Operator | Previous/next location |
| `[L` / `]L` | Normal, Visual, Operator | First/last location |
| `[o` / `]o` | Normal, Visual, Operator | Previous/next old file |
| `[O` / `]O` | Normal, Visual, Operator | First/last old file |
| `[q` / `]q` | Normal, Visual, Operator | Previous/next quickfix entry |
| `[Q` / `]Q` | Normal, Visual, Operator | First/last quickfix entry |
| `[t` / `]t` | Normal, Visual, Operator | Previous/next treesitter node |
| `[T` / `]T` | Normal, Visual, Operator | First/last treesitter node |
| `[u` / `]u` | Normal, Visual, Operator | Previous/next undo state |
| `[U` / `]U` | Normal, Visual, Operator | First/last undo state |
| `[w` / `]w` | Normal, Visual, Operator | Previous/next window |
| `[W` / `]W` | Normal, Visual, Operator | First/last window |
| `[y` / `]y` | Normal, Visual, Operator | Previous/next yank |
| `[Y` / `]Y` | Normal, Visual, Operator | First/last yank |

### Mini.move (Move Text)
| Keymap | Mode | Action |
|--------|------|--------|
| `<M-h>` | Normal, Visual, Insert | Move selection left |
| `<M-j>` | Normal, Visual, Insert | Move selection down |
| `<M-k>` | Normal, Visual, Insert | Move selection up |
| `<M-l>` | Normal, Visual, Insert | Move selection right |

### Mini.operators (Text Operators)
| Keymap | Mode | Action |
|--------|------|--------|
| `gx` | Normal, Visual | Exchange text (swap) |

---

## Snacks.nvim

### Picker (Smart Finder)
| Keymap | Mode | Action |
|--------|------|--------|
| `<leader><space>` | Normal | Smart find (smart picker) |
| `<leader>` | Normal | Smart find |

### Buffers & Files
| Keymap | Mode | Action |
|--------|------|--------|
| `<leader>,` | Normal | Open buffer picker |
| `<leader>.` | Normal | Open scratch buffer |

### Search & History
| Keymap | Mode | Action |
|--------|------|--------|
| `<leader>/` | Normal | Grep search |
| `<leader>:` | Normal | Command history |

### Terminal
| Keymap | Mode | Action |
|--------|------|--------|
| `<C-/>` | Normal | Toggle terminal |

### Git Integration
| Keymap | Mode | Action |
|--------|------|--------|
| `<leader>gg` | Normal | Open Lazygit |

### Markdown Rendering
| Keymap | Mode | Action |
|--------|------|--------|
| `\m` | Normal | Toggle render markdown |

---

## Todo-Comments
| Keymap | Mode | Action |
|--------|------|--------|
| `]t` | Normal | Jump to next todo comment |
| `[t` | Normal | Jump to previous todo comment |
| `<leader>st` | Normal | Open Todo picker |
| `<leader>sT` | Normal | Open Todo/Fix/Fixme picker |
| `<leader>xt` | Normal | Show todos in Trouble |
| `<leader>xT` | Normal | Show Todo/Fix/Fixme in Trouble |

---

## Trouble (Diagnostics & References)

### Diagnostics
| Keymap | Mode | Action |
|--------|------|--------|
| `<leader>xx` | Normal | Toggle all diagnostics |
| `<leader>xX` | Normal | Toggle buffer diagnostics |

### Symbols & References
| Keymap | Mode | Action |
|--------|------|--------|
| `<leader>cs` | Normal | Toggle document symbols |
| `<leader>cS` | Normal | Toggle LSP references/definitions |

### Lists
| Keymap | Mode | Action |
|--------|------|--------|
| `<leader>xL` | Normal | Toggle location list |
| `<leader>xQ` | Normal | Toggle quickfix list |
| `[q` | Normal | Previous quickfix/trouble item |
| `]q` | Normal | Next quickfix/trouble item |

---

## Which-key
| Keymap | Mode | Action |
|--------|------|--------|
| `<leader>?` | Normal | Show keymaps (which-key) |

---

## Blink.cmp (Completion)

### Completion Menu Navigation
| Keymap | Mode | Action |
|--------|------|--------|
| `<C-space>` | Insert | Show completion menu |
| `<C-e>` | Insert | Hide completion menu |
| `<C-y>` | Insert | Accept selected completion |
| `<C-n>` | Insert | Select next completion |
| `<C-p>` | Insert | Select previous completion |
| `<C-f>` | Insert | Scroll completion docs forward |
| `<C-b>` | Insert | Scroll completion docs backward |
| `<C-l>` | Insert | Accept snippet |
| `<C-j>` | Insert | Jump to next snippet placeholder |
| `<C-k>` | Insert | Jump to previous snippet placeholder |

---

## Standard Vim Navigation (Built-in)
| Keymap | Mode | Action |
|--------|------|--------|
| `gd` | Normal | Go to definition (LSP) |
| `gr` | Normal | Find references (LSP) |
| `K` | Normal | Hover (LSP documentation) |
| `<C-k>` | Insert | Signature help (LSP) |
| `[q` | Normal | Previous quickfix item |
| `]q` | Normal | Next quickfix item |
| `.` | Normal | Repeat last command |
| `u` | Normal | Undo |
| `<C-r>` | Normal | Redo |

---

## Custom Text Objects (Mini.ai)

Custom text objects for working with code:

| Object | Modes | Description |
|--------|-------|-------------|
| `ao` | a/i | Code block (outer/inner) |
| `af` | a/i | Function (outer/inner) |
| `ac` | a/i | Class (outer/inner) |
| `at` | a/i | HTML tag (outer/inner) |
| `ad` | a/i | Digit (outer/inner) |
| `ae` | a/i | Word with case (outer/inner) |

Usage: Combine with operators like `d` (delete), `c` (change), `y` (yank)
- `dio` - Delete inner code block
- `caf` - Change outer function
- `yac` - Yank outer class

---

## Notes

- **Leader Key**: `<leader>` is typically mapped to space
- **LocalLeader Key**: `<localleader>` is used for buffer-local keybindings (especially in grug-far)
- **Mode Abbreviations**:
  - `n` = Normal mode
  - `i` = Insert mode
  - `c` = Command mode
  - `v` = Visual mode
  - `x` = Visual mode (alias)
  - `s` = Select mode
  - `o` = Operator-pending mode
  - `t` = Terminal mode

- **Keybinding Strategy**:
  - Mnemonic leader keys: `<leader>f` = find, `<leader>g` = git, `<leader>x` = diagnostics
  - Bracketed navigation: `[x`/`]x` for previous/next, `[X`/`]X` for first/last
  - LSP operations: `gl` prefix for language navigation
