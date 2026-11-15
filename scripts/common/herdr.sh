#!/bin/bash
set -euo pipefail

# herdr — installs to ~/.local/bin (already on PATH via .zshenv).
# Update later with: herdr update
if [[ -x "$HOME/.local/bin/herdr" ]]; then
    echo "herdr already installed, skipping."
    exit 0
fi

echo "Installing herdr..."
curl -fsSL https://herdr.dev/install.sh | sh
