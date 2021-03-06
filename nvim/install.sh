#!/bin/bash

DOTFILES=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")/../" && pwd -P)

if command -v zsh >/dev/null 2>&1; then
    MODULE='nvim'
    echo "[ LINKING ] :: $MODULE >> .zshrc"

    rm -rf $HOME/.config/nvim
    ln -sf $DOTFILES/nvim $HOME/.config/nvim

else
    echo "[ NOTFOUND ] :: $MODULE"
fi
