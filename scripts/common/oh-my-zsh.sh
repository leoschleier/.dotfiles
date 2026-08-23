#!/bin/bash
set -euo pipefail

export ZSH="${XDG_DATA_HOME:-$HOME/.local/share}/oh-my-zsh"

if [[ -d "$ZSH" ]]; then
    echo "oh-my-zsh already installed, skipping."
    exit 0
fi

echo "Installing oh-my-zsh..."
# Clone directly (instead of the official installer) so no ~/.zshrc template is
# written. Our zsh config lives in $ZDOTDIR (XDG path); chsh is handled in ./install.
git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git "$ZSH"
