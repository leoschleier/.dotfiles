# .dotfiles

Leo's .dotfiles.

## Bootstrap

### macOS

```bash
git clone git@github.com:leoschleier/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

### Ubuntu (WSL)

```bash
git clone git@github.com:leoschleier/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

Re-running `./install.sh` is safe — all scripts are idempotent.

## Structure

```
.dotfiles/
├── home/                  # Stow package — mirrors $HOME layout
│   ├── .zshenv            # ZDOTDIR bootstrap (sets zsh config to ~/.config/zsh/)
│   └── .config/
│       ├── aerospace/     # macOS tiling WM (ignored on Linux)
│       ├── ghostty/       # macOS/Linux terminal (ignored on WSL)
│       ├── nvim/
│       ├── opencode/
│       ├── tmux/
│       └── zsh/
├── scripts/
│   ├── common/            # Portable install modules (all platforms)
│   │   ├── oh-my-zsh.sh
│   │   ├── stow.sh        # GNU Stow symlinks
│   │   └── nvm.sh         # nvm + Node LTS
│   ├── macos/             # macOS-specific
│   │   └── brew.sh        # Homebrew + packages + casks + rustup
│   └── ubuntu/            # Ubuntu/WSL-specific
│       ├── apt.sh         # apt packages + build deps
│       ├── neovim.sh      # Neovim (built from source)
│       ├── rustup.sh      # Rust toolchain
│       └── uv.sh          # Python package manager
├── install.sh             # Main entry point (detects OS)
└── .vscode/               # VS Code reference configs (not stowed)
```

Symlinks are managed by [GNU Stow](https://www.gnu.org/software/stow/). The `home/`
directory is a single stow package — running `stow home` from the repo root creates
symlinks in `$HOME` matching the directory layout.

## What gets installed

### macOS (Homebrew)

| Packages                                         | Casks              |
| ------------------------------------------------ | ------------------ |
| neovim, tmux, fzf, stow, ripgrep, fd, uv, rustup | ghostty, aerospace |

### Ubuntu / WSL (apt)

neovim (built from source), tmux, fzf, stow, ripgrep, fd-find, zsh, curl, git, build-essential,
ninja-build, gettext, cmake

Rustup and uv are installed via their official installers.

### All platforms

- **oh-my-zsh** — installed to `~/.local/share/oh-my-zsh`
- **nvm + Node LTS** — installed to `~/.local/share/nvm`

## Adding a new config

1. Place the config file at `home/.config/<tool>/<file>` (mirroring the `$HOME` path).
2. Run `stow --dir=~/.dotfiles --target=$HOME home` (or re-run `./install.sh`).

## Neovim

### LSP

This config uses `mason-lspconfig` to automatically install all LSP servers, and
`vim.lsp.config()` / `vim.lsp.enable()` (Neovim 0.11+ native API) to configure them.

LSP keymaps rely on Neovim 0.11+ built-in defaults (`grr`, `grn`, `gra`, `gri`, `gd`,
`gD`, `K`, `[d`/`]d`, `gO`).

### Custom keymaps

Leader key: `<Space>`

#### General

| Mode | Key | Action |
| ---- | --- | ------ |
| `i` | `<C-c>` | Exit insert mode |
| `n` | `<leader>ex` | Open netrw explorer |
| `n` | `<leader>nh` | Clear search highlight |
| `n` | `x` | Delete char without yanking |
| `n` | `<leader>+` / `<leader>-` | Increment / decrement number |
| `n` | `<leader>r` | Search & replace word under cursor |
| `x` | `<leader>p` | Paste without overwriting register |
| `v` | `J` / `K` | Move selection down / up |

#### Splits & tabs

| Mode | Key | Action |
| ---- | --- | ------ |
| `n` | `<leader>sv` | Split vertically |
| `n` | `<leader>sh` | Split horizontally |
| `n` | `<leader>se` | Equalize splits |
| `n` | `<leader>sx` | Close split |
| `n` | `<leader>sm` | Maximize / minimize split |
| `n` | `<leader>to` | New tab |
| `n` | `<leader>tx` | Close tab |
| `n` | `<leader>tn` / `<leader>tp` | Next / previous tab |

#### LSP (buffer-local, on attach)

| Mode | Key | Action |
| ---- | --- | ------ |
| `n` | `<leader>D` | Buffer diagnostics (Telescope) |
| `n` | `<leader>d` | Line diagnostics (float) |
| `n` | `<leader>rs` | Restart LSP |

#### Telescope

| Mode | Key | Action |
| ---- | --- | ------ |
| `n` | `<leader>ff` | Find files |
| `n` | `<leader>fg` | Live grep |
| `n` | `<leader>fb` | Buffers |
| `n` | `<leader>fh` | Help tags |
| `n` | `<leader>fF` | Find files (hidden) |
| `n` | `<leader>fG` | Live grep (hidden) |

#### Harpoon

| Mode | Key | Action |
| ---- | --- | ------ |
| `n` | `<leader>ha` | Add file |
| `n` | `<leader>hh` | Toggle quick menu |
| `n` | `<leader>hj` / `hk` / `hl` / `h;` | Select slot 1–4 |

#### Completion (nvim-cmp, insert mode)

| Key | Action |
| --- | ------ |
| `<C-p>` / `<C-n>` | Previous / next item |
| `<C-b>` / `<C-f>` | Scroll docs |
| `<C-Space>` | Trigger completion |
| `<C-y>` | Confirm |
| `<C-Y>` | Confirm (replace) |
| `<C-e>` | Abort |

#### Git (Fugitive)

| Mode | Key | Action |
| ---- | --- | ------ |
| `n` | `<leader>fu` | Open `:Git` |

#### No Neck Pain

| Mode | Key | Action |
| ---- | --- | ------ |
| `n` | `<leader>np` | Toggle centering |
| `n` | `<leader>nql` / `<leader>nqr` | Toggle left / right side buffer |
| `n` | `<leader>n=` / `<leader>n-` | Increase / decrease width |

#### OpenCode

| Mode | Key | Action |
| ---- | --- | ------ |
| `n,x` | `<leader>oa` | Ask opencode |
| `n,x` | `<leader>ox` | Select opencode action |
| `n,t` | `<leader>ot` | Toggle opencode |
| `n,x` | `go` | Add range to opencode |
| `n` | `goo` | Add line to opencode |
| `n` | `<S-C-u>` / `<S-C-d>` | Scroll opencode up / down |

#### 99

| Mode | Key | Action |
| ---- | --- | ------ |
| `v` | `<leader>9v` | Send visual selection |
| `n` | `<leader>9x` | Stop all requests |
| `n` | `<leader>9s` | Search |

#### Other

| Mode | Key | Action |
| ---- | --- | ------ |
| `n` | `<leader>u` | Toggle undo tree |
