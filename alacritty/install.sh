#!/bin/bash

DOTFILES=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")/../" && pwd -P)

# if command -v alacritty >/dev/null 2>&1; then
MODULE='Alacritty'

echo "[ LINKING ] :: $MODULE >> .alacritty.yml"
rm $HOME/.alacritty.yml
ln -sf $DOTFILES/alacritty/alacritty.yml $HOME/.alacritty.yml
