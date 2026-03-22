#!/bin/bash
set -euo pipefail

echo "Updating apt package lists..."
sudo apt-get update

# Add Neovim PPA for latest version
if ! grep -rq "neovim-ppa" /etc/apt/sources.list.d/ 2>/dev/null; then
    echo "Adding Neovim PPA..."
    sudo apt-get install -y software-properties-common
    sudo add-apt-repository -y ppa:neovim-ppa/unstable
    sudo apt-get update
fi

PACKAGES=(
    neovim
    tmux
    fzf
    stow
    ripgrep
    fd-find
    zsh
    curl
    git
    build-essential
)

echo "Installing apt packages..."
sudo apt-get install -y "${PACKAGES[@]}"

# Create fd symlink (Ubuntu packages it as fdfind)
if command -v fdfind &>/dev/null && ! command -v fd &>/dev/null; then
    echo "Creating fd -> fdfind symlink..."
    sudo ln -sf "$(which fdfind)" /usr/local/bin/fd
fi
