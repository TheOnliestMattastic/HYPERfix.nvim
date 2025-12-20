# Keymaps Reference

## Core Navigation

### Window Navigation

| Keymap  | Mode   | Action                |
| ------- | ------ | --------------------- |
| `<C-h>` | Normal | Move to left window   |
| `<C-j>` | Normal | Move to bottom window |
| `<C-k>` | Normal | Move to top window    |
| `<C-l>` | Normal | Move to right window  |

### Line Navigation (Respects Line Wrapping)

| Keymap   | Mode           | Action                             |
| -------- | -------------- | ---------------------------------- |
| `j`      | Normal, Visual | Move down (respects wrapped lines) |
| `k`      | Normal, Visual | Move up (respects wrapped lines)   |
| `<Down>` | Normal, Visual | Move down (respects wrapped lines) |
| `<Up>`   | Normal, Visual | Move up (respects wrapped lines)   |

### Smart Search Navigation

| Keymap | Mode                     | Action                                         |
| ------ | ------------------------ | ---------------------------------------------- |
| `n`    | Normal, Visual, Operator | Next search result (intelligent direction)     |
| `N`    | Normal, Visual, Operator | Previous search result (intelligent direction) |

## Tab Management

| Keymap               | Mode   | Action               |
| -------------------- | ------ | -------------------- |
| `<leader><tab><tab>` | Normal | New tab              |
| `<leader><tab>n`     | Normal | Next tab             |
| `<leader><tab>p`     | Normal | Previous tab         |
| `<leader><tab>f`     | Normal | First tab            |
| `<leader><tab>l`     | Normal | Last tab             |
| `<leader><tab>q`     | Normal | Close current tab    |
| `<leader><tab>o`     | Normal | Close all other tabs |

## File Management

| Keymap       | Mode                           | Action                     |
| ------------ | ------------------------------ | -------------------------- |
| `<C-s>`      | Normal, Insert, Visual, Select | Save file                  |
| `<leader>fn` | Normal                         | Create new file            |
| `<leader>nl` | Normal                         | Open Lazy (plugin manager) |

## Text Editing

### Undo Break-points (Insert Mode)

| Keymap | Mode   | Action                       |
| ------ | ------ | ---------------------------- |
| `,`    | Insert | Comma + undo break-point     |
| `.`    | Insert | Period + undo break-point    |
| `;`    | Insert | Semicolon + undo break-point |

### Smart Closing Punctuation Skip (Insert Mode)

| Keymap  | Mode   | Action                                            |
| ------- | ------ | ------------------------------------------------- |
| `<C-;>` | Insert | Skip past closing punctuation `)` `}` `]` `'` `"` |

### Visual Mode Indentation

| Keymap | Mode   | Action                |
| ------ | ------ | --------------------- |
| `<`    | Visual | Unindent and reselect |
| `>`    | Visual | Indent and reselect   |

## Escape Sequences

| Keymap      | Mode                            | Action                       |
| ----------- | ------------------------------- | ---------------------------- |
| `jk` / `kj` | Insert, Command, Visual, Select | Exit to Normal mode          |
| `jk` / `kj` | Terminal                        | Exit to Normal mode          |
| `<Esc>`     | Normal                          | Clear search, refresh screen |

## Application Management

### Session Management

| Keymap       | Mode   | Action                   |
| ------------ | ------ | ------------------------ |
| `<leader>qs` | Normal | Save session             |
| `<leader>qr` | Normal | Restore session (picker) |
| `<leader>qd` | Normal | Delete session           |

### Quit Operations

| Keymap       | Mode   | Action                                   |
| ------------ | ------ | ---------------------------------------- |
| `<leader>qq` | Normal | Quit all                                 |
| `<leader>qw` | Normal | Save all buffers, save session, and quit |
| `<leader>qQ` | Normal | Quit without saving                      |

## Comments

| Keymap | Mode   | Action                 |
| ------ | ------ | ---------------------- |
| `gco`  | Normal | Add comment line below |
| `gcO`  | Normal | Add comment line above |

## DAP (Debugging)

| Keymap       | Mode   | Action             |
| ------------ | ------ | ------------------ |
| `<leader>db` | Normal | Toggle breakpoint  |
| `<leader>dc` | Normal | Continue execution |
| `<leader>di` | Normal | Step into          |
| `<leader>do` | Normal | Step over          |
| `<leader>dd` | Normal | Toggle DAP UI      |

## Flash (Smart Navigation)

| Keymap | Mode                     | Action                          |
| ------ | ------------------------ | ------------------------------- |
| `s`    | Normal, Visual, Operator | Flash search (jump to location) |

## Grug-far (Search & Replace)

| Keymap       | Mode           | Action                       |
| ------------ | -------------- | ---------------------------- |
| `<leader>sr` | Normal, Visual | Open search & replace dialog |

## LSP (Language Server Protocol)

### General LSP

| Keymap       | Mode   | Action                   |
| ------------ | ------ | ------------------------ |
| `<leader>nm` | Normal | Open Mason (LSP manager) |

### LSP Navigation (via Snacks picker)

| Keymap | Mode   | Action                |
| ------ | ------ | --------------------- |
| `gd`   | Normal | Go to definition      |
| `gD`   | Normal | Go to declaration     |
| `gr`   | Normal | Find references       |
| `gI`   | Normal | Find implementations  |
| `gy`   | Normal | Go to type definition |
| `gli`  | Normal | Incoming calls        |
| `glo`  | Normal | Outgoing calls        |

### LSP Code Actions & Formatting

| Keymap       | Mode                   | Action             |
| ------------ | ---------------------- | ------------------ |
| `<leader>cr` | Normal                 | Rename symbol      |
| `<leader>ca` | Normal, Visual         | Code action        |
| `<leader>cf` | Normal, Visual, Select | Format buffer      |
| `<leader>\H` | Normal                 | Toggle inlay hints |

## Treesitter

### Incremental Selection

| Keymap | Mode   | Action                  |
| ------ | ------ | ----------------------- |
| `gvv`  | Normal | Initialize selection    |
| `gvn`  | Normal | Expand to next node     |
| `gvs`  | Normal | Expand to scope         |
| `gvp`  | Normal | Shrink to previous node |

### Treesitter Context

| Keymap | Mode   | Action                          |
| ------ | ------ | ------------------------------- |
| `\t`   | Normal | Toggle treesitter context panel |

## Mini.nvim

### Mini.files (File Navigator)

| Keymap      | Mode   | Action               |
| ----------- | ------ | -------------------- |
| `<leader>e` | Normal | Toggle file explorer |

### Mini.surround (Surrounds)

| Keymap | Mode           | Action                          |
| ------ | -------------- | ------------------------------- |
| `sa`   | Normal, Visual | Add surrounding                 |
| `sd`   | Normal         | Delete surrounding              |
| `sr`   | Normal         | Replace surrounding             |
| `sf`   | Normal         | Find surrounding (cursor right) |
| `sF`   | Normal         | Find surrounding (cursor left)  |
| `sh`   | Normal         | Highlight surrounding           |

### Mini.comment (Commenting)

| Keymap | Mode           | Action                 |
| ------ | -------------- | ---------------------- |
| `gc`   | Normal, Visual | Toggle comment (line)  |
| `gb`   | Normal, Visual | Toggle comment (block) |

### Mini.bracketed (Navigation)

| Keymap      | Mode                     | Action                        |
| ----------- | ------------------------ | ----------------------------- |
| `[b` / `]b` | Normal, Visual, Operator | Previous/next buffer          |
| `[B` / `]B` | Normal, Visual, Operator | First/last buffer             |
| `[c` / `]c` | Normal, Visual, Operator | Previous/next comment         |
| `[C` / `]C` | Normal, Visual, Operator | First/last comment            |
| `[d` / `]d` | Normal, Visual, Operator | Previous/next diagnostic      |
| `[D` / `]D` | Normal, Visual, Operator | First/last diagnostic         |
| `[f` / `]f` | Normal, Visual, Operator | Previous/next file on disk    |
| `[F` / `]F` | Normal, Visual, Operator | First/last file on disk       |
| `[i` / `]i` | Normal, Visual, Operator | Previous/next indent change   |
| `[I` / `]I` | Normal, Visual, Operator | First/last indent change      |
| `[j` / `]j` | Normal, Visual, Operator | Previous/next jump in buffer  |
| `[J` / `]J` | Normal, Visual, Operator | First/last jump in buffer     |
| `[l` / `]l` | Normal, Visual, Operator | Previous/next location        |
| `[L` / `]L` | Normal, Visual, Operator | First/last location           |
| `[o` / `]o` | Normal, Visual, Operator | Previous/next old file        |
| `[O` / `]O` | Normal, Visual, Operator | First/last old file           |
| `[q` / `]q` | Normal, Visual, Operator | Previous/next quickfix entry  |
| `[Q` / `]Q` | Normal, Visual, Operator | First/last quickfix entry     |
| `[t` / `]t` | Normal, Visual, Operator | Previous/next treesitter node |
| `[T` / `]T` | Normal, Visual, Operator | First/last treesitter node    |
| `[u` / `]u` | Normal, Visual, Operator | Previous/next undo state      |
| `[U` / `]U` | Normal, Visual, Operator | First/last undo state         |
| `[w` / `]w` | Normal, Visual, Operator | Previous/next window          |
| `[W` / `]W` | Normal, Visual, Operator | First/last window             |
| `[y` / `]y` | Normal, Visual, Operator | Previous/next yank            |
| `[Y` / `]Y` | Normal, Visual, Operator | First/last yank               |

### Mini.move (Move Text)

| Keymap  | Mode                   | Action               |
| ------- | ---------------------- | -------------------- |
| `<M-h>` | Normal, Visual, Insert | Move selection left  |
| `<M-j>` | Normal, Visual, Insert | Move selection down  |
| `<M-k>` | Normal, Visual, Insert | Move selection up    |
| `<M-l>` | Normal, Visual, Insert | Move selection right |

### Mini.operators (Text Operators)

| Keymap | Mode           | Action               |
| ------ | -------------- | -------------------- |
| `gx`   | Normal, Visual | Exchange text (swap) |

## Snacks.nvim

### Smart Picker (Global Search)

| Keymap            | Mode   | Action                           |
| ----------------- | ------ | -------------------------------- |
| `<leader><space>` | Normal | Smart find (auto-detect context) |
| `<leader>/`       | Normal | Grep search                      |
| `<leader>:`       | Normal | Command history                  |
| `<leader>.`       | Normal | Scratch buffer selector          |

### Buffer Management

| Keymap       | Mode   | Action                |
| ------------ | ------ | --------------------- |
| `<leader>bb` | Normal | Select buffer         |
| `<leader>bd` | Normal | Delete buffer         |
| `<leader>bg` | Normal | Grep in buffers       |
| `<leader>bS` | Normal | Select scratch buffer |

### File & Project Navigation

| Keymap       | Mode           | Action                      |
| ------------ | -------------- | --------------------------- |
| `<leader>ff` | Normal         | Find files                  |
| `<leader>fp` | Normal         | Find projects               |
| `<leader>fr` | Normal         | Find recent files           |
| `<leader>fR` | Normal         | Rename file                 |
| `<leader>fw` | Normal, Visual | Find/grep word under cursor |

### Git Operations

| Keymap       | Mode           | Action               |
| ------------ | -------------- | -------------------- |
| `<leader>gb` | Normal         | Git branches         |
| `<leader>gB` | Normal, Visual | Open in browser      |
| `<leader>gd` | Normal         | Git diff (hunks)     |
| `<leader>gf` | Normal         | Git files            |
| `<leader>gF` | Normal         | Git log file         |
| `<leader>gg` | Normal         | LazyGit              |
| `<leader>gi` | Normal         | GitHub issues (open) |
| `<leader>gI` | Normal         | GitHub issues (all)  |
| `<leader>gl` | Normal         | Git log              |
| `<leader>gL` | Normal         | Git log line         |
| `<leader>gp` | Normal         | GitHub PRs (open)    |
| `<leader>gP` | Normal         | GitHub PRs (all)     |
| `<leader>gs` | Normal         | Git status           |
| `<leader>gS` | Normal         | Git stash            |

### Help & Configuration

| Keymap       | Mode   | Action               |
| ------------ | ------ | -------------------- |
| `<leader>ha` | Normal | Autocmds             |
| `<leader>hc` | Normal | Config files         |
| `<leader>hh` | Normal | Help pages           |
| `<leader>hk` | Normal | Keymaps              |
| `<leader>nm` | Normal | Notification history |
| `<leader>nN` | Normal | Neovim news          |

### Search & Inspection

| Keymap       | Mode   | Action                |
| ------------ | ------ | --------------------- |
| `<leader>sc` | Normal | Commands              |
| `<leader>sd` | Normal | Diagnostics           |
| `<leader>sD` | Normal | Buffer diagnostics    |
| `<leader>sh` | Normal | Search history        |
| `<leader>sH` | Normal | Highlights            |
| `<leader>si` | Normal | Icons                 |
| `<leader>sj` | Normal | Jumps                 |
| `<leader>sl` | Normal | Lines                 |
| `<leader>sL` | Normal | Location list         |
| `<leader>sm` | Normal | Marks                 |
| `<leader>sx` | Normal | Registers             |
| `<leader>sR` | Normal | Resume last search    |
| `<leader>su` | Normal | Undo history          |
| `<leader>sq` | Normal | Quickfix list         |
| `<leader>ss` | Normal | LSP symbols           |
| `<leader>sS` | Normal | LSP workspace symbols |

### UI & Toggles

| Keymap       | Mode   | Action       |
| ------------ | ------ | ------------ |
| `<leader>uC` | Normal | Colorschemes |
| `<leader>uz` | Normal | Zen mode     |
| `<leader>uZ` | Normal | Zoom         |

### Other Navigation

| Keymap       | Mode             | Action             |
| ------------ | ---------------- | ------------------ |
| `]]`         | Normal, Terminal | Next reference     |
| `[[`         | Normal, Terminal | Previous reference |
| `<leader>qD` | Normal           | Dashboard          |
| `<leader>t`  | Normal           | Toggle terminal    |

## Todo-Comments

| Keymap       | Mode   | Action                         |
| ------------ | ------ | ------------------------------ |
| `]t`         | Normal | Jump to next todo comment      |
| `[t`         | Normal | Jump to previous todo comment  |
| `<leader>st` | Normal | Open Todo picker               |
| `<leader>sT` | Normal | Open Todo/Fix/Fixme picker     |
| `<leader>xt` | Normal | Show todos in Trouble          |
| `<leader>xT` | Normal | Show Todo/Fix/Fixme in Trouble |

## Trouble (Diagnostics & References)

### Diagnostics & Symbols

| Keymap       | Mode   | Action                    |
| ------------ | ------ | ------------------------- |
| `<leader>xd` | Normal | Toggle diagnostics        |
| `<leader>xD` | Normal | Toggle buffer diagnostics |
| `<leader>xs` | Normal | Toggle symbols            |

### Lists

| Keymap       | Mode   | Action                         |
| ------------ | ------ | ------------------------------ |
| `<leader>xl` | Normal | Toggle location list           |
| `<leader>xq` | Normal | Toggle quickfix list           |
| `[q`         | Normal | Previous quickfix/trouble item |
| `]q`         | Normal | Next quickfix/trouble item     |

## Which-key

| Keymap      | Mode   | Action                   |
| ----------- | ------ | ------------------------ |
| `<leader>?` | Normal | Show keymaps (which-key) |

## Blink.cmp (Completion)

### Completion Menu Navigation

| Keymap      | Mode   | Action                               |
| ----------- | ------ | ------------------------------------ |
| `<C-space>` | Insert | Show completion menu                 |
| `<C-e>`     | Insert | Hide completion menu                 |
| `<C-y>`     | Insert | Accept selected completion           |
| `<C-n>`     | Insert | Select next completion               |
| `<C-p>`     | Insert | Select previous completion           |
| `<C-f>`     | Insert | Scroll completion docs forward       |
| `<C-b>`     | Insert | Scroll completion docs backward      |
| `<C-l>`     | Insert | Accept snippet                       |
| `<C-j>`     | Insert | Jump to next snippet placeholder     |
| `<C-k>`     | Insert | Jump to previous snippet placeholder |

### Completion Sources

| Source   | Purpose                                                    | Triggers                        |
| -------- | ---------------------------------------------------------- | ------------------------------- |
| LSP      | Language intelligence (definitions, types, methods)        | Auto on typing (language-aware) |
| Path     | File/directory completion                                  | Auto when typing `/` or `./`    |
| Snippets | VSCode-style code templates                                | Auto on typing snippet prefixes |
| Lazydev  | Neovim API completions                                     | Auto in Neovim config files     |
| Ripgrep  | Project-wide code search (reduce typos, discover patterns) | Auto after 3 characters typed   |

## Conform (Formatting)

| Keymap       | Mode                   | Action        |
| ------------ | ---------------------- | ------------- |
| `<leader>cf` | Normal, Visual, Select | Format buffer |

## Standard Vim Navigation (Built-in)

| Keymap  | Mode   | Action                    |
| ------- | ------ | ------------------------- |
| `K`     | Normal | Hover (LSP documentation) |
| `<C-k>` | Insert | Signature help (LSP)      |
| `.`     | Normal | Repeat last command       |
| `u`     | Normal | Undo                      |
| `<C-r>` | Normal | Redo                      |

## Custom Text Objects (Mini.ai)

Custom text objects for working with code:

| Object | Modes | Description                  |
| ------ | ----- | ---------------------------- |
| `ao`   | a/i   | Code block (outer/inner)     |
| `af`   | a/i   | Function (outer/inner)       |
| `ac`   | a/i   | Class (outer/inner)          |
| `at`   | a/i   | HTML tag (outer/inner)       |
| `ad`   | a/i   | Digit (outer/inner)          |
| `ae`   | a/i   | Word with case (outer/inner) |

Usage: Combine with operators like `d` (delete), `c` (change), `y` (yank)

- `dio` - Delete inner code block
- `caf` - Change outer function
- `yac` - Yank outer class

## Notes

- **Leader Key**: `<leader>` is mapped to space
- **LocalLeader Key**: `<localleader>` is used for buffer-local keybindings
- **Mode Abbreviations**:
  - `n` = Normal mode
  - `i` = Insert mode
  - `c` = Command mode
  - `x` = Visual mode
  - `s` = Select mode
  - `o` = Operator-pending mode
  - `t` = Terminal mode

- **Keybinding Strategy**:
  - Mnemonic leader keys: `<leader>f` = find, `<leader>g` = git, `<leader>x` = diagnostics
  - Bracketed navigation: `[x`/`]x` for previous/next, `[X`/`]X` for first/last
  - LSP operations integrated with Snacks picker (gd, gr, gI, gy, etc.)
