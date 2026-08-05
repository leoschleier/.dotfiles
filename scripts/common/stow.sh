#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

echo "Creating symlinks with stow..."
mkdir -p "$HOME/.config"

CONFLICT_FILE="$(mktemp)"
trap 'rm -f "$CONFLICT_FILE"' EXIT

if ! stow --simulate --dir="$DOTFILES_DIR" --target="$HOME" home &>"$CONFLICT_FILE"; then
    echo "ERROR: stow conflicts detected. Existing files would be overwritten:"
    CONFLICTS="$(sed -n 's/^.*existing target is not owned by stow: //p' "$CONFLICT_FILE" | sed 's/ => .*//')"
    if [[ -n "$CONFLICTS" ]]; then
        echo "$CONFLICTS"
    else
        cat "$CONFLICT_FILE"
    fi
    echo ""
    echo "Back up or delete the listed files, then re-run install."
    exit 1
fi

stow --dir="$DOTFILES_DIR" --target="$HOME" home
