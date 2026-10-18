#!/bin/bash
set -euo pipefail

echo "Syncing pacman databases and upgrading system..."
sudo pacman -Syu --noconfirm

PACKAGES=(
    amd-ucode                   # AMD CPU microcode updates
    base                        # Minimal base Arch system meta-package
    base-devel                  # Build tools for compiling and AUR (package group)
    bluez-utils                 # Bluetooth management CLI (bluetoothctl)
    brightnessctl               # Backlight control (bound in hyprland)
    curl                        # CLI for transferring data with URLs
    dunst                       # Notification daemon
    fd                          # Fast, user-friendly alternative to find
    file-roller                 # GUI archive manager
    firefox                     # Web browser
    flameshot                   # Screenshot tool
    fwupd                       # Firmware update daemon
    fzf                         # Command-line fuzzy finder
    gcc                         # GNU C/C++ compiler
    ghostty                     # Terminal emulator
    git                         # Version control
    gnome-themes-extra          # Adwaita GTK themes (dark variant for GTK apps)
    gvfs                        # Virtual filesystem for file managers (trash, mounts)
    hypridle                    # Idle daemon for Hyprland (auto-lock)
    hyprland                    # Dynamic tiling Wayland compositor
    hyprlauncher                # App launcher for Hyprland
    hyprlock                    # Screen locker for Hyprland
    hyprpolkitagent             # Polkit authentication agent (GUI root prompts)
    jujutsu                     # Git-compatible VCS (jj)
    libva-utils                 # VA-API tools (vainfo) for hardware video acceleration
    linux                       # Linux kernel
    linux-firmware              # Kernel firmware files
    man-db                      # Man page reader
    man-pages                   # Linux manual pages
    mesa                        # Open-source OpenGL graphics drivers
    neovim                      # Text editor
    networkmanager              # Network connection manager
    noto-fonts                  # Broad Unicode glyph coverage
    noto-fonts-cjk              # CJK glyph coverage
    noto-fonts-emoji            # Color emoji
    nwg-look                    # GTK theme/settings editor for wlroots compositors
    obsidian                    # Markdown knowledge base
    opencode                    # AI coding agent
    openssh                     # SSH client and server
    papirus-icon-theme          # Icon theme
    pipewire-alsa               # PipeWire ALSA integration
    pipewire-pulse              # PipeWire PulseAudio replacement
    playerctl                   # Media player control (binds and waybar)
    qt6-wayland                 # Wayland backend for Qt6 apps (flameshot)
    ripgrep                     # Fast recursive text search
    rtkit                       # Realtime scheduling for audio (PipeWire)
    rustup                      # Rust toolchain installer
    sddm                        # Display manager (login screen)
    stow                        # Symlink manager for dotfiles
    sudo                        # Run commands as root
    tar                         # Archive utility
    thunar                      # Xfce file manager
    thunar-archive-plugin       # Archive operations in Thunar context menu
    thunar-volman               # Removable media handling for Thunar
    tlp                         # Laptop power management
    tmux                        # Terminal multiplexer
    tree-sitter-cli             # Tree-sitter parser tooling (for Neovim)
    tumbler                     # Thumbnail generation for Thunar
    udisks2                     # Disk mounting backend for thunar-volman
    unzip                       # Extract zip archives
    uv                          # Fast Python package manager
    vulkan-radeon               # Vulkan driver for AMD GPUs
    vulkan-tools                # Vulkan diagnostics (vulkaninfo)
    waybar                      # Wayland status bar
    wireplumber                 # PipeWire session manager (wpctl)
    wl-clipboard                # Wayland clipboard CLI (wl-copy/wl-paste)
    xdg-desktop-portal-hyprland # Portal backend for Hyprland (screen sharing, file pickers)
    yazi                        # Terminal file manager
    zsh                         # Shell
)

echo "Installing pacman packages..."
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

# Initialize rustup if no default toolchain is set yet
if command -v rustup &>/dev/null && ! rustup show active-toolchain &>/dev/null 2>&1; then
    echo "Initializing Rust toolchain..."
    rustup default stable
fi
