#!/bin/bash
set -euo pipefail

# Install Homebrew if not present
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Ensure brew is on PATH for this session (Apple Silicon)
eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || true)"

PACKAGES=(
    neovim
    tmux
    fzf
    stow
    ripgrep
    fd
    uv
    rustup
    anomalyco/tap/opencode
)

CASKS=(
    ghostty
    nikitabobko/tap/aerospace
)

echo "Installing Homebrew packages..."
for pkg in "${PACKAGES[@]}"; do
    brew install "$pkg" 2>/dev/null || true
done

echo "Installing Homebrew casks..."
for cask in "${CASKS[@]}"; do
    brew install --cask "$cask" 2>/dev/null || true
done

# Initialize rustup if just installed (non-interactive)
if command -v rustup &>/dev/null && ! rustup show active-toolchain &>/dev/null 2>&1; then
    echo "Initializing Rust toolchain..."
    rustup-init -y --no-modify-path
fi
