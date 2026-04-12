#!/bin/bash
set -euo pipefail

echo "Updating apt package lists..."
sudo apt-get update

PACKAGES=(
    tmux
    fzf
    stow
    ripgrep
    fd-find
    zsh
    curl
    git
    build-essential
    ninja-build
    gettext
    cmake
)

echo "Installing apt packages..."
sudo apt-get install -y "${PACKAGES[@]}"

# Create fd symlink (Ubuntu packages it as fdfind)
if command -v fdfind &>/dev/null && ! command -v fd &>/dev/null; then
    echo "Creating fd -> fdfind symlink..."
    sudo ln -sf "$(which fdfind)" /usr/local/bin/fd
fi
