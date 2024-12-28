#!/bin/bash

mkdir -p $HOME/.config

ln -sfn $HOME/.dotfiles/nvim $HOME/.config/nvim
ln -sfn $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc
ln -sfn $HOME/.dotfiles/ghostty $HOME/.config/ghostty
