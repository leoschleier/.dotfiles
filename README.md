# .dotfiles

Leo's .dotfiles.

## Bootstrap

On a fresh macOS machine, clone and run:

```bash
git clone git@github.com:leoschleier/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

Re-running `./install.sh` is safe — all scripts are idempotent.

## Structure

```
.dotfiles/
├── home/              # Stow package — mirrors $HOME layout
│   ├── .zshenv        # ZDOTDIR bootstrap (sets zsh config to ~/.config/zsh/)
│   └── .config/
│       ├── aerospace/
│       ├── ghostty/
│       ├── nvim/
│       ├── opencode/
│       ├── tmux/
│       └── zsh/
├── scripts/
│   └── macos/         # macOS-specific install modules
│       ├── brew.sh    # Homebrew + packages
│       ├── stow.sh    # GNU Stow symlinks
│       ├── oh-my-zsh.sh
│       └── nvm.sh     # nvm + Node LTS
├── install.sh         # Main entry point (detects OS)
└── .vscode/           # VS Code reference configs (not stowed)
```

Symlinks are managed by [GNU Stow](https://www.gnu.org/software/stow/). The `home/`
directory is a single stow package — running `stow home` from the repo root creates
symlinks in `$HOME` matching the directory layout.

## What gets installed

### Homebrew packages

neovim, tmux, fzf, stow, ripgrep, fd, uv, rustup

### Homebrew casks

ghostty, aerospace

### Other

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

To setup GitHub Copilot with Neovim, use `:Copilot setup`. Press `Tab` in insert mode
to accept the suggestion and `Ctrl-]` to dismiss.
