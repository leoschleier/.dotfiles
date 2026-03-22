#!/bin/bash
set -euo pipefail

export NVM_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/nvm"

if [[ -d "$NVM_DIR" ]]; then
    echo "nvm already installed, skipping install."
else
    echo "Installing nvm..."
    mkdir -p "$NVM_DIR"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | PROFILE=/dev/null bash
fi

# Source nvm for this session
[[ -s "$NVM_DIR/nvm.sh" ]] && . "$NVM_DIR/nvm.sh"

# Install Node LTS if not already installed
if ! nvm ls --no-colors 2>/dev/null | grep -q "lts"; then
    echo "Installing Node LTS..."
    nvm install --lts
else
    echo "Node LTS already installed, skipping."
fi
