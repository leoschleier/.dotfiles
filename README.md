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

This config uses `mason-lspconfig` to automatically install all LSPs. Once installed,
all language servers are being set up using `nvim-lspconfig`.

### Copilot

To setup GitHub Copilot with Neovim, use `:Copilot setup`.
