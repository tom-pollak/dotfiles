#!/bin/bash

DOTFILES=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")/../" && pwd -P)

if command -v fish >/dev/null 2>&1; then
    MODULE='fish'
    echo "[ LINKING ] :: $MODULE >> .config/fish/config.fish"
    rm $HOME/.config/fish/config.fish
    ln -sf $DOTFILES/fish/config.fish $HOME/.config/fish/config.fish
else
    echo "[ NOTFOUND ] :: $MODULE"
fi
fish
