# .dotfiles

Leo's .dotfiles.

## Bootstrap

### macOS

```bash
git clone git@github.com:leoschleier/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install
```

### Arch Linux

```bash
git clone git@github.com:leoschleier/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install
```

### Ubuntu (WSL)

```bash
git clone git@github.com:leoschleier/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install
```

Re-running `./install` is safe — all scripts are idempotent.

## Structure

```
.dotfiles/
├── home/                  # Stow package — mirrors $HOME layout
│   ├── .zshenv            # ZDOTDIR bootstrap (sets zsh config to ~/.config/zsh/)
│   ├── .local/
│   │   └── bin/
│   │       ├── tmux-sessionizer
│   │       ├── ws
│   │       └── wt
│   └── .config/
│       ├── aerospace/     # macOS tiling WM (ignored on Linux)
│       ├── ghostty/       # macOS/Linux terminal (ignored on WSL)
│       ├── hypr/          # Hyprland Wayland compositor (Arch Linux)
│       ├── jj/            # Jujutsu VCS
│       ├── nvim/
│       ├── opencode/
│       ├── tmux/
│       ├── tmux-sessionizer/
│       ├── ws/
│       ├── wt/
│       └── zsh/
├── scripts/
│   ├── arch/              # Arch Linux-specific
│   │   └── pacman.sh      # pacman packages + rustup init
│   ├── common/            # Portable install modules (all platforms)
│   │   ├── oh-my-zsh.sh
│   │   ├── stow.sh        # GNU Stow symlinks
│   │   └── nvm.sh         # nvm + Node LTS
│   ├── macos/             # macOS-specific
│   │   └── brew.sh        # Homebrew + packages + casks + rustup + opencode
│   └── ubuntu/            # Ubuntu/WSL-specific
│       ├── apt.sh         # apt packages + build deps
│       ├── neovim.sh      # Neovim (built from source)
│       ├── opencode.sh    # opencode CLI
│       ├── rustup.sh      # Rust toolchain
│       └── uv.sh          # Python package manager
├── install                # Main entry point (detects OS)
└── .vscode/               # VS Code reference configs (not stowed)
```

Symlinks are managed by [GNU Stow](https://www.gnu.org/software/stow/). The `home/`
directory is a single stow package — running `stow home` from the repo root creates
symlinks in `$HOME` matching the directory layout.

## What gets installed

### macOS (Homebrew)

| Packages                                                                        | Casks                                     |
| ------------------------------------------------------------------------------- | ----------------------------------------- |
| neovim, tmux, fzf, stow, ripgrep, fd, uv, rustup, jj, tree-sitter-cli, opencode | ghostty, aerospace, obsidian, zen-browser |

### Arch Linux (pacman)

neovim, tmux, fzf, stow, ripgrep, fd, zsh, curl, git, gcc, tree-sitter-cli, uv, rustup,
jujutsu, opencode — plus GUI apps ghostty, hyprland, obsidian, firefox. All from official repos
(no AUR).

### Ubuntu / WSL (apt)

neovim (built from source), tmux, fzf, stow, ripgrep, fd-find, zsh, curl, git, build-essential,
ninja-build, gettext, cmake, tree-sitter-cli

Rustup, uv, and opencode are installed via their official installers.

### All platforms

- **oh-my-zsh** — installed to `~/.local/share/oh-my-zsh`
- **nvm + Node LTS** — installed to `~/.local/share/nvm`

## Adding a new config

1. Place the config file at `home/.config/<tool>/<file>` (mirroring the `$HOME` path).
2. Run `stow --dir=~/.dotfiles --target=$HOME home` (or re-run `./install`).

## Hyprland

Main modifier: `SUPER` (Windows key). Config lives in `home/.config/hypr/hyprland.lua`.

### Apps

| Key           | Action                    |
| ------------- | ------------------------- |
| `SUPER + Q`   | Open terminal (ghostty)   |
| `SUPER + B`   | Open browser (firefox)    |
| `SUPER + O`   | Open Obsidian             |
| `SUPER + E`   | Open file manager (yazi)  |
| `SUPER + R`   | Open launcher             |
| `SUPER + M`   | Shutdown / exit Hyprland  |

### Windows & workspaces

| Key                    | Action                              |
| ---------------------- | ----------------------------------- |
| `SUPER + C`            | Close active window                 |
| `SUPER + V`            | Toggle floating / tiling            |
| `SUPER + P`            | Toggle pseudo mode                  |
| `SUPER + J`            | Toggle split direction (dwindle)    |
| `SUPER + ←/→/↑/↓`      | Move focus                          |
| `SUPER + 1-0`          | Switch to workspace 1–10            |
| `SUPER + SHIFT + 1-0`  | Move window to workspace 1–10       |
| `SUPER + S`            | Toggle special workspace (scratchpad) |
| `SUPER + SHIFT + S`    | Move window to special workspace    |
| `SUPER + scroll`       | Cycle workspaces                    |
| `SUPER + LMB drag`     | Drag window                         |
| `SUPER + RMB drag`     | Resize window                       |

### Media keys

| Key                        | Action              |
| -------------------------- | ------------------- |
| `XF86AudioRaiseVolume` / `XF86AudioLowerVolume` | Volume up / down |
| `XF86AudioMute` / `XF86AudioMicMute`            | Mute sink / source |
| `XF86MonBrightnessUp` / `XF86MonBrightnessDown` | Brightness up / down |
| `XF86Audio{Play,Pause,Next,Prev}`               | Media control (playerctl) |

## Neovim

### LSP

This config uses `mason-lspconfig` to automatically install all LSP servers, and
`vim.lsp.config()` / `vim.lsp.enable()` (Neovim 0.11+ native API) to configure them.

LSP keymaps rely on Neovim 0.11+ built-in defaults (`grr`, `grn`, `gra`, `gri`, `gd`,
`gD`, `K`, `[d`/`]d`, `gO`).

### Custom keymaps

Leader key: `<Space>`

#### General

| Mode | Key                       | Action                             |
| ---- | ------------------------- | ---------------------------------- |
| `i`  | `<C-c>`                   | Exit insert mode                   |
| `n`  | `<leader>ex`              | Open netrw explorer                |
| `n`  | `<leader>nh`              | Clear search highlight             |
| `n`  | `x`                       | Delete char without yanking        |
| `n`  | `<leader>+` / `<leader>-` | Increment / decrement number       |
| `n`  | `<leader>r`               | Search & replace word under cursor |
| `x`  | `<leader>p`               | Paste without overwriting register |
| `v`  | `J` / `K`                 | Move selection down / up           |

#### Splits & tabs

| Mode | Key                         | Action              |
| ---- | --------------------------- | ------------------- |
| `n`  | `<leader>sv`                | Split vertically    |
| `n`  | `<leader>sh`                | Split horizontally  |
| `n`  | `<leader>se`                | Equalize splits     |
| `n`  | `<leader>sx`                | Close split         |
| `n`  | `<leader>to`                | New tab             |
| `n`  | `<leader>tx`                | Close tab           |
| `n`  | `<leader>tn` / `<leader>tp` | Next / previous tab |

#### LSP (buffer-local, on attach)

| Mode  | Key         | Action                         |
| ----- | ----------- | ------------------------------ |
| `n`   | `gd`        | Definitions (Telescope)        |
| `n`   | `grr`       | References (Telescope)         |
| `n`   | `gri`       | Implementations (Telescope)    |
| `n`   | `grt`       | Type definitions (Telescope)   |
| `n,v` | `gra`       | Code actions (quick-fixes)     |
| `n`   | `grn`       | Rename symbol                  |
| `n`   | `gO`        | Document symbols               |
| `n`   | `K`         | Hover documentation            |
| `n`   | `[d` / `]d` | Previous / next diagnostic     |
| `n`   | `grd`       | Line diagnostics (float)       |
| `n`   | `grD`       | Buffer diagnostics (Telescope) |
| `i`   | `<C-S>`     | Signature help                 |

#### Telescope

| Mode | Key          | Action              |
| ---- | ------------ | ------------------- |
| `n`  | `<leader>ff` | Find files          |
| `n`  | `<leader>fg` | Live grep           |
| `n`  | `<leader>fb` | Buffers             |
| `n`  | `<leader>fh` | Help tags           |
| `n`  | `<leader>fF` | Find files (hidden) |
| `n`  | `<leader>fG` | Live grep (hidden)  |

#### Harpoon

| Mode | Key                               | Action            |
| ---- | --------------------------------- | ----------------- |
| `n`  | `<leader>ha`                      | Add file          |
| `n`  | `<leader>hh`                      | Toggle quick menu |
| `n`  | `<leader>hj` / `hk` / `hl` / `h;` | Select slot 1–4   |

#### Completion (nvim-cmp, insert mode)

| Key               | Action               |
| ----------------- | -------------------- |
| `<C-p>` / `<C-n>` | Previous / next item |
| `<C-b>` / `<C-f>` | Scroll docs          |
| `<C-Space>`       | Trigger completion   |
| `<C-y>`           | Confirm              |
| `<C-Y>`           | Confirm (replace)    |
| `<C-e>`           | Abort                |

#### Git (Fugitive)

| Mode | Key          | Action      |
| ---- | ------------ | ----------- |
| `n`  | `<leader>fu` | Open `:Git` |

#### No Neck Pain

| Mode | Key                           | Action                          |
| ---- | ----------------------------- | ------------------------------- |
| `n`  | `<leader>np`                  | Toggle centering                |
| `n`  | `<leader>nql` / `<leader>nqr` | Toggle left / right side buffer |
| `n`  | `<leader>n=` / `<leader>n-`   | Increase / decrease width       |

#### OpenCode

| Mode  | Key                   | Action                    |
| ----- | --------------------- | ------------------------- |
| `n,x` | `<leader>oa`          | Ask opencode              |
| `n,x` | `<leader>ox`          | Select opencode action    |
| `n,t` | `<leader>ot`          | Toggle opencode           |
| `n,x` | `go`                  | Add range to opencode     |
| `n`   | `goo`                 | Add line to opencode      |
| `n`   | `<S-C-u>` / `<S-C-d>` | Scroll opencode up / down |

#### Other

| Mode | Key          | Action                                    |
| ---- | ------------ | ----------------------------------------- |
| `n`  | `<leader>sm` | Maximize / minimize split (vim-maximizer) |
| `n`  | `<leader>u`  | Toggle undo tree                          |
