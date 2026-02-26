# to-vim-tmux-zsh

Turning Vim, tmux, and zsh into Developer Superpowers.

## Installation

### Prerequisites

- [Neovim](https://neovim.io/) (>= 0.11.0)
- [Nerd Fonts](https://www.nerdfonts.com/)
- [oh-my-zsh](https://ohmyz.sh/)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k) — zsh theme
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) — zsh plugin
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) — zsh plugin
- [omz-plugin-pnpm](https://github.com/ntnyq/omz-plugin-pnpm) — zsh plugin (pnpm completions)

### Steps

```bash
# Clone the repository
git clone git@github.com:FengShangWuQi/to-vim-tmux-zsh.git ~/Documents/to-vim-tmux-zsh

# Create symlinks (back up existing files first if needed)
ln -s ~/Documents/to-vim-tmux-zsh/.config/nvim ~/.config/nvim
ln -s ~/Documents/to-vim-tmux-zsh/.tmux.conf ~/.tmux.conf
ln -s ~/Documents/to-vim-tmux-zsh/.tmux.conf.local ~/.tmux.conf.local
ln -s ~/Documents/to-vim-tmux-zsh/.zshrc ~/.zshrc
ln -s ~/Documents/to-vim-tmux-zsh/.p10k.zsh ~/.p10k.zsh
```

On first launch of `nvim`, [lazy.nvim](https://github.com/folke/lazy.nvim) will automatically install all plugins.

## Neovim

Why Neovim over Vim:

- **Lua configuration** — write config in a real programming language, far more readable and maintainable than VimScript
- **Built-in LSP client** — native Language Server Protocol support for completion, go-to-definition, refactoring, and more
- **Built-in Tree-sitter** — syntax-tree-based highlighting and code analysis, more accurate than regex matching
- **Async architecture** — libuv-based async I/O, plugins never block the editor
- **Modern plugin ecosystem** — Telescope, lazy.nvim, blink.cmp and other active plugins are Neovim-exclusive, with a faster-growing community

A lean configuration based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), ready to use out of the box.

### Modes

Neovim is a modal editor — keys behave differently depending on the current mode:

| Mode | Enter with | Purpose |
|---|---|---|
| Normal | `Esc` | Default mode for navigation and commands |
| Insert | `i` / `a` / `o` | Text input |
| Visual | `v` / `V` / `Ctrl-v` | Text selection |
| Command | `:` | Execute commands (e.g. `:w` save, `:q` quit) |

> New to Vim? Run `:Tutor` inside Neovim to follow the built-in tutorial.

### Basic Operations

```
# Movement

h j k l                 Left Down Up Right
w / b                   Next / previous word
0 / $                   Start / end of line
gg / G                  Top / bottom of file
Ctrl-d / Ctrl-u         Scroll half-page down / up

# Editing

i / a                   Insert before / after cursor
o / O                   Open new line below / above
x                       Delete character under cursor
dd                      Delete entire line
yy                      Yank (copy) entire line
p                       Paste
u / Ctrl-r              Undo / redo
.                       Repeat last action

# Compound operations (verb + range)

dw                      Delete a word
ciw                     Change inner word
di"                     Delete inside quotes
ya)                     Yank around parentheses (including parens)
```

### Leader Key

The Leader key is **Space**. Press Space and wait briefly — [which-key](https://github.com/folke/which-key.nvim) will pop up a panel showing all available follow-up keys.

### Search (Telescope)

| Keybinding | Action |
|---|---|
| `<leader>sf` | Search files |
| `<leader>sg` | Live grep (search content) |
| `<leader>sw` | Search word under cursor |
| `<leader>s.` | Recent files |
| `<leader>sr` | Resume last search |
| `<leader>/` | Fuzzy search in current file |
| `<leader><leader>` | Switch buffer |
| `<leader>sh` | Search help tags |
| `<leader>sk` | Search keymaps |
| `<leader>ss` | Search Telescope pickers |
| `<leader>sd` | Search diagnostics |
| `<leader>sc` | Search commands |
| `<leader>s/` | Search in open files |
| `<leader>sn` | Search Neovim config files |

### File Tree (Neo-tree)

Opening nvim automatically shows the file tree. Use `Ctrl-l` to switch to the editor and `Ctrl-h` to switch back to the tree.

| Keybinding | Action |
|---|---|
| `Ctrl-t` | Toggle file tree |
| `Ctrl-f` | Reveal current file in tree |

Inside the tree: `Enter` to open, `a` to add, `d` to delete, `r` to rename, `m` to move.

### Code Navigation & Editing (LSP)

| Keybinding | Action |
|---|---|
| `grd` | Go to definition |
| `grr` | Find references |
| `grn` | Rename symbol |
| `gra` | Code action |
| `gri` | Go to implementation |
| `gO` | Document symbols |
| `gW` | Workspace symbols |
| `grt` | Go to type definition |
| `grD` | Go to declaration |
| `K` | Hover documentation |
| `<leader>f` | Format current file |
| `<leader>th` | Toggle inlay hints |

Auto-completion triggers as you type. Use `Ctrl-n` / `Ctrl-p` to navigate and `Ctrl-y` to confirm. Files are auto-formatted on save.

Formatting requires [prettierd](https://github.com/fsouza/prettierd) or [prettier](https://prettier.io/): `npm install -g @fsouza/prettierd prettier`. Lua files use [stylua](https://github.com/JohnnyMorganz/StyLua) (auto-installed via Mason).

### Comments

| Keybinding | Action |
|---|---|
| `gcc` | Toggle line comment |
| `gc` + motion | Toggle comment over motion (e.g. `gcap` to comment a paragraph) |

### Git

| Keybinding | Action |
|---|---|
| `]h` / `[h` | Next / previous hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hu` | Undo stage hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame current line |
| `<leader>hd` | Diff current file |
| `<leader>gd` | Open Git diff |
| `<leader>gh` | File history |
| `<leader>gH` | Branch history |

### Windows & Splits

| Keybinding | Action |
|---|---|
| `Ctrl-h/j/k/l` | Move focus between windows |
| `:vs` / `:sp` | Vertical / horizontal split |
| `:q` | Close current window |

### Emmet

| Keybinding | Action |
|---|---|
| `<leader>xe` | Wrap selection with Emmet abbreviation |

### Text Objects & Editing Enhancements (mini.nvim)

| Keybinding | Action |
|---|---|
| `sa` + range + char | Add surrounding (e.g. `saiw"` to quote a word) |
| `sd` + char | Delete surrounding (e.g. `sd"` to remove quotes) |
| `sr` + old + new | Replace surrounding (e.g. `sr"'` to change `"` to `'`) |

- **mini.ai** — enhanced text objects, supports function arguments and more
- **mini.pairs** — auto-pair brackets and quotes

### Other Keybindings

| Keybinding | Action |
|---|---|
| `Esc` | Clear search highlight |
| `Esc Esc` | Exit terminal mode |
| `<leader>q` | Open diagnostics list |

### Other Features

- **[guess-indent](https://github.com/NMAC427/guess-indent.nvim)** — auto-detect file indentation style
- **[todo-comments](https://github.com/folke/todo-comments.nvim)** — highlight TODO / FIXME / NOTE comments in code
- **[wakatime](https://wakatime.com/)** — coding time tracking (requires a WakaTime account)
- **[render-markdown](https://github.com/MeanderingProgrammer/render-markdown.nvim)** — render Markdown in-buffer (headings, tables, code blocks, etc.)
- **[markdown.nvim](https://github.com/tadmccorkle/markdown.nvim)** — Markdown editing enhancements (list management, bold/italic shortcuts, etc.)

### Common Commands

```
:w                      Save
:q                      Quit (warns if unsaved)
:wq or ZZ               Save and quit
:Mason                  Manage language servers (install / update LSP)
:Lazy                   Manage plugins
:RenderMarkdown toggle  Toggle Markdown rendering
:checkhealth            Check environment health
```

### Learning Resources

- [Learn Vim](https://github.com/iggredible/Learn-Vim) — beginner-friendly Vim/Neovim book
- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) — config template with comments as documentation
- [Learn Lua in Y Minutes](https://learnxinyminutes.com/docs/lua/) — 10-15 minute Lua primer

## tmux

A terminal multiplexer — manage multiple sessions, windows, and panes in a single terminal. Sessions persist after disconnecting.

Based on [gpakosz/.tmux](https://github.com/gpakosz/.tmux), with a Powerline-style status bar out of the box. Configuration is split into two layers: `.tmux.conf` (base framework — do not edit) and `.tmux.conf.local` (personal customization).

### Core Concepts

```
Server ── Session ── Window ── Pane
              │          │        └── Pane: a split region within a window
              │          └── Window: like a browser tab
              └── Session: a collection of windows, can be detached and reattached
```

### Prefix Key

tmux keybindings require pressing a **prefix key** first, then the action key. This config supports two prefix keys:

- `Ctrl-b` (default)
- `Ctrl-a` (GNU Screen compatible)

### Session Management

```bash
# Terminal commands
tmux new -s <name>           Create a new session
tmux a -t <name>             Attach to a session
tmux ls                      List all sessions
tmux kill-session -t <name>  Kill a session
```

| Keybinding | Action |
|---|---|
| `<prefix> d` | Detach from current session |
| `<prefix> s` | Session picker |
| `<prefix> $` | Rename current session |
| `<prefix> C-c` | Create new session |
| `<prefix> C-f` | Find session |
| `<prefix> (` / `)` | Switch to previous / next session |

### Window Management

| Keybinding | Action |
|---|---|
| `<prefix> c` | Create new window |
| `<prefix> ,` | Rename current window |
| `<prefix> &` | Close current window |
| `<prefix> C-h` / `C-l` | Previous / next window |
| `<prefix> Tab` | Jump to last active window |
| `<prefix> w` | Window list |

### Pane Management

| Keybinding | Action |
|---|---|
| `<prefix> -` | Horizontal split |
| `<prefix> _` | Vertical split |
| `<prefix> h` / `j` / `k` / `l` | Vim-style pane navigation |
| `<prefix> H` / `J` / `K` / `L` | Resize pane |
| `<prefix> x` | Close current pane |
| `<prefix> z` | Maximize / restore current pane |
| `<prefix> q` | Show pane numbers, press number to jump |
| `<prefix> {` / `}` | Swap with pane above / below |
| `<prefix> m` | Toggle mouse mode |

### Copy Mode

Press `<prefix> Enter` to enter copy mode (Vi-style):

| Keybinding | Action |
|---|---|
| `v` | Begin selection |
| `y` | Yank (copy) selection |
| `Escape` | Cancel |
| `<prefix> b` | List paste buffers |
| `<prefix> p` | Paste |

### Other

| Keybinding | Action |
|---|---|
| `<prefix> r` | Reload configuration |
| `<prefix> e` | Edit .tmux.conf.local |
| `<prefix> ?` | List all keybindings |
| `<prefix> S` | Save session (tmux-resurrect) |
| `<prefix> R` | Restore session (tmux-resurrect) |

### Learning Resources

- [The Tao of tmux](https://tao-of-tmux.readthedocs.io/) — the most recommended tmux guide
- [tmux Cheat Sheet](https://tmuxcheatsheet.com/) — quick reference
- [gpakosz/.tmux](https://github.com/gpakosz/.tmux) — the base framework for this config

## zsh

A powerful shell with better completion, syntax highlighting, and theming.

Based on [oh-my-zsh](https://ohmyz.sh/) + [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme, providing a beautiful prompt and a rich plugin ecosystem.

### Plugins

| Plugin | Description |
|---|---|
| [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) | Suggests commands from history, press `→` to accept |
| [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) | Real-time syntax highlighting, invalid commands turn red |
| [z](https://github.com/agkozak/zsh-z) | Jump to frequent directories, e.g. `z proj` jumps to the best match |
| [git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git) | Git aliases (`gst` = `git status`, `gco` = `git checkout`, etc.) |
| [tmux](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux) | tmux aliases (`ta` = `tmux attach`, etc.) |
| [npm](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/npm) | npm completions |
| [pnpm](https://github.com/ntnyq/omz-plugin-pnpm) | pnpm completions |

### Common Shortcuts

| Shortcut | Action |
|---|---|
| `Ctrl-a` / `Ctrl-e` | Move cursor to start / end of line |
| `Ctrl-w` | Delete previous word |
| `Ctrl-u` / `Ctrl-k` | Delete to start / end of line |
| `Ctrl-r` | Search command history |
| `Ctrl-l` | Clear screen |
| `↑` | Search history by prefix (based on current input) |
| `→` | Accept autosuggestion |

### Custom Aliases

```bash
alias python="python3"
alias setproxy="export ALL_PROXY=socks5://127.0.0.1:1080"
alias unsetproxy="unset ALL_PROXY"
```

### Common Commands

```bash
p10k configure              # Reconfigure Powerlevel10k theme
omz update                  # Update oh-my-zsh
```

Measure startup time:

```bash
for i in $(seq 1 5); do /usr/bin/time /bin/zsh -i -c exit; done
```

### Learning Resources

- [A User's Guide to ZSH](https://zsh.sourceforge.io/Guide/) — the most comprehensive zsh guide
- [oh-my-zsh Plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/plugins) — plugin directory
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) — theme documentation
