#!/bin/bash

if command -v alacritty >/dev/null 2>&1; then
    MODULE='Alacritty'

    echo "[ LINKING ] :: $MODULE >> .alacritty.yml"
	ln -sf $DOTFILES/alacritty/alacritty.yml $HOME/.alacritty.yml
else
    echo "[ NOTFOUND ] :: $MODULE"
fi
