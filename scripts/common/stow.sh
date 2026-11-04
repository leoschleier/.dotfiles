#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

echo "Creating symlinks with stow..."
mkdir -p "$HOME/.config"
# Keep ~/.local/bin a real directory: if stow folds it into a symlink, tools
# that install binaries there (plannotator, uv tools) write into the repo.
mkdir -p "$HOME/.local/bin"
# Same for the Plannotator data dir: its runtime state must stay out of the repo.
mkdir -p "$HOME/.plannotator"

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
