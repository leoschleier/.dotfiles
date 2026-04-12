#!/bin/bash
set -euo pipefail

NEOVIM_SRC_DIR="$HOME/.local/src/neovim"
INSTALL_PREFIX="$HOME/.local"

# Get the latest stable tag from GitHub
echo "Checking latest Neovim stable release..."
LATEST_TAG=$(curl -fsSL https://api.github.com/repos/neovim/neovim/releases/latest | grep '"tag_name"' | cut -d'"' -f4)

if [ -z "$LATEST_TAG" ]; then
    echo "Failed to fetch latest Neovim release tag."
    exit 1
fi

# Check if the installed version already matches
if command -v nvim &>/dev/null; then
    INSTALLED_VERSION="v$(nvim --version | head -1 | grep -oP '\d+\.\d+\.\d+')"
    if [ "$INSTALLED_VERSION" = "$LATEST_TAG" ]; then
        echo "Neovim $LATEST_TAG already installed, skipping."
        exit 0
    fi
    echo "Neovim $INSTALLED_VERSION installed, upgrading to $LATEST_TAG..."
fi

# Clone or update the repo
if [ -d "$NEOVIM_SRC_DIR/.git" ]; then
    echo "Updating Neovim source..."
    git -C "$NEOVIM_SRC_DIR" fetch --tags --force
else
    echo "Cloning Neovim..."
    mkdir -p "$(dirname "$NEOVIM_SRC_DIR")"
    git clone https://github.com/neovim/neovim.git "$NEOVIM_SRC_DIR"
fi

# Checkout the latest stable tag and clean previous build artifacts
git -C "$NEOVIM_SRC_DIR" checkout "$LATEST_TAG"
make -C "$NEOVIM_SRC_DIR" distclean

# Build and install
echo "Building Neovim $LATEST_TAG..."
make -C "$NEOVIM_SRC_DIR" CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX="$INSTALL_PREFIX"

echo "Installing Neovim to $INSTALL_PREFIX..."
make -C "$NEOVIM_SRC_DIR" install

echo "Neovim $LATEST_TAG installed successfully."
