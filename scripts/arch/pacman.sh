#!/bin/bash
set -euo pipefail

echo "Syncing pacman databases and upgrading system..."
sudo pacman -Syu --noconfirm

PACKAGES=(
    curl
    fd
    firefox
    fzf
    gcc
    ghostty
    git
    jujutsu
    neovim
    obsidian
    opencode
    ripgrep
    rustup
    stow
    tmux
    tree-sitter-cli
    uv
    zsh
)

echo "Installing pacman packages..."
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

# Initialize rustup if no default toolchain is set yet
if command -v rustup &>/dev/null && ! rustup show active-toolchain &>/dev/null 2>&1; then
    echo "Initializing Rust toolchain..."
    rustup default stable
fi
