#!/usr/bin/env bash

if [ -L "$HOME/.config/nvim" ]; then
  rm "$HOME/.config/nvim"
fi

if [ ! -d "$HOME/.config/nvim" ]; then
  ln -s "$HOME/Workspaces/personal/cirius-nvim" "$HOME/.config/nvim"
fi
