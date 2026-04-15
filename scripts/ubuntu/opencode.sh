#!/bin/bash
set -euo pipefail

if command -v opencode &>/dev/null; then
    echo "opencode already installed, skipping."
    exit 0
fi

echo "Installing opencode..."
curl -fsSL https://opencode.ai/install | bash
