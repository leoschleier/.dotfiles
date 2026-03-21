#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== Dotfiles Bootstrap ==="

case "$(uname -s)" in
    Darwin)
        echo "Detected macOS"
        SCRIPTS_DIR="$DOTFILES_DIR/scripts/macos"
        "$SCRIPTS_DIR/brew.sh"
        # Make Homebrew-installed tools available to subsequent scripts
        eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv 2>/dev/null || true)"
        ;;
    Linux)
        # Future: detect distro and set SCRIPTS_DIR accordingly
        # e.g. scripts/arch/, scripts/ubuntu/
        echo "Linux support not yet implemented."
        exit 1
        ;;
    *)
        echo "Unsupported OS: $(uname -s)"
        exit 1
        ;;
esac

"$SCRIPTS_DIR/oh-my-zsh.sh"
"$SCRIPTS_DIR/stow.sh"
"$SCRIPTS_DIR/nvm.sh"

echo ""
echo "=== Bootstrap complete ==="
echo "Restart your terminal or run: exec zsh"
