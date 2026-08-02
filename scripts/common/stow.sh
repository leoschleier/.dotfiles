#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

echo "Creating symlinks with stow..."
mkdir -p "$HOME/.config"

stow --dir="$DOTFILES_DIR" --target="$HOME" home
