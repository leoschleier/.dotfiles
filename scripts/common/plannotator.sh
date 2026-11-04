#!/bin/bash
set -euo pipefail

# plannotator — plan/diff review UI, installs to ~/.local/bin (already on
# PATH via .zshenv). --non-interactive skips the guided-install wizard, which
# would otherwise block bootstrap on a terminal. The installer also refreshes
# the opencode integration and skills; those land in the stowed repo dirs
# (~/.config/opencode, ~/.agents) and should be committed to keep them in
# sync with the tool. Update later with: plannotator update
if [[ -x "$HOME/.local/bin/plannotator" ]]; then
    echo "plannotator already installed, skipping."
    exit 0
fi

echo "Installing plannotator..."
curl -fsSL https://plannotator.ai/install.sh | bash -s -- --non-interactive
