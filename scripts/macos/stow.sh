#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

# Remove a legacy symlink or back up a legacy file, but only if it is NOT
# already managed by stow (i.e. does not point into the home/ stow package).
remove_legacy() {
    local f="$1"
    if [[ -L "$f" ]]; then
        local target
        target="$(readlink "$f")"
        # Skip if this symlink already points into the stow package
        if [[ "$target" == *".dotfiles/home/"* ]]; then
            return
        fi
        echo "  Removing legacy symlink: $f"
        rm -f "$f"
    elif [[ -f "$f" ]]; then
        echo "  Backing up legacy file: $f -> ${f}.bak"
        mv "$f" "${f}.bak"
    fi
}

echo "Creating symlinks with stow..."
mkdir -p "$HOME/.config"

# Remove conflicting legacy symlinks/files that would block stow.
# These are paths created by the old scripts/symlinks.sh or manual setup.
LEGACY_PATHS=(
    "$HOME/.zshrc"
    "$HOME/.zshenv"
    "$HOME/.tmux.conf"
    "$HOME/.config/nvim"
    "$HOME/.config/ghostty"
    "$HOME/.config/aerospace"
)

for f in "${LEGACY_PATHS[@]}"; do
    remove_legacy "$f"
done

# Remove legacy opencode symlinks (were individual file symlinks via glob)
if [[ -d "$HOME/.config/opencode" && ! -L "$HOME/.config/opencode" ]]; then
    for f in "$HOME/.config/opencode"/*; do
        if [[ -L "$f" ]]; then
            local_target="$(readlink "$f")"
            if [[ "$local_target" != *".dotfiles/home/"* ]]; then
                echo "  Removing legacy opencode symlink: $f"
                rm -f "$f"
            fi
        fi
    done
fi

stow --dir="$DOTFILES_DIR" --target="$HOME" home
