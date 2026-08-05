#!/bin/bash
set -euo pipefail

# Install Homebrew if not present
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Ensure brew is on PATH for this session (Apple Silicon / Intel)
eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv 2>/dev/null || true)"

PACKAGES=(
    anomalyco/tap/opencode
    fd
    fzf
    jj
    neovim
    ripgrep
    rustup
    stow
    tmux
    tree-sitter-cli
    uv
)

CASKS=(
    ghostty
    nikitabobko/tap/aerospace
    obsidian
    zen-browser
)

echo "Installing Homebrew packages..."
for pkg in "${PACKAGES[@]}"; do
    brew list "$pkg" &>/dev/null || brew install "$pkg"
done

echo "Installing Homebrew casks..."
for cask in "${CASKS[@]}"; do
    brew list --cask "$cask" &>/dev/null || brew install --cask "$cask"
done

# Initialize rustup if just installed (non-interactive)
if command -v rustup &>/dev/null && ! rustup show active-toolchain &>/dev/null; then
    echo "Initializing Rust toolchain..."
    rustup-init -y --no-modify-path
fi
