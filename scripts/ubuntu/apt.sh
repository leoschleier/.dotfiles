#!/bin/bash
set -euo pipefail

echo "Updating apt package lists..."
sudo apt-get update

PACKAGES=(
    build-essential
    cmake
    curl
    fd-find
    fzf
    gettext
    git
    ninja-build
    ripgrep
    stow
    tmux
    zsh
)

echo "Installing apt packages..."
sudo apt-get install -y "${PACKAGES[@]}"

# tree-sitter-cli only exists in Ubuntu 24.04+ (noble) universe
if apt-cache show tree-sitter-cli &>/dev/null; then
    sudo apt-get install -y tree-sitter-cli
else
    echo "tree-sitter-cli not available via apt (Ubuntu <24.04), skipping. Install via cargo if needed."
fi

# Create fd symlink (Ubuntu packages it as fdfind)
if command -v fdfind &>/dev/null && ! command -v fd &>/dev/null; then
    echo "Creating fd -> fdfind symlink..."
    sudo ln -sf "$(which fdfind)" /usr/local/bin/fd
fi
