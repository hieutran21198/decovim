#!/usr/bin/env bash

# check if symlinks already exist
if [ -L "$HOME/.config/nvim" ]; then
  rm "$HOME/.config/nvim"
fi

if [ ! -d "$HOME/.config/nvim" ]; then
  ln -s "$PWD" "$HOME/.config/nvim"
fi
