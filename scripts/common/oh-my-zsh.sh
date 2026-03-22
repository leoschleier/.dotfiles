#!/bin/bash
set -euo pipefail

export ZSH="${XDG_DATA_HOME:-$HOME/.local/share}/oh-my-zsh"

if [[ -d "$ZSH" ]]; then
    echo "oh-my-zsh already installed, skipping."
    exit 0
fi

echo "Installing oh-my-zsh..."
# RUNZSH=no  prevents oh-my-zsh from launching a new shell
# KEEP_ZSHRC=yes  prevents oh-my-zsh from overwriting our managed .zshrc
RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
