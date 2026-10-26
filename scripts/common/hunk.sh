#!/bin/bash
set -euo pipefail

# hunk — terminal diff viewer, installs to ~/.hunk/bin.
# PATH is set in the stowed zsh config, so --no-modify-path keeps the
# installer from appending to shell startup files (same idea as nvm's
# PROFILE=/dev/null). Update later with: hunk update
if [[ -x "$HOME/.hunk/bin/hunk" ]]; then
    echo "hunk already installed, skipping."
    exit 0
fi

echo "Installing hunk..."
curl -fsSL https://hunk.dev/install.sh | sh -s -- --no-modify-path
