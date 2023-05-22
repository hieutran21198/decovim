#!/usr/bin/env bash

if [ -L "$HOME/.config/nvim" ]; then
  rm "$HOME/.config/nvim"
fi

ln -s "$PWD" "$HOME/.config/nvim"
