#!/bin/bash

if command -v tmux >/dev/null 2>&1; then
    MODULE='tmux'

    echo "[ LINKING ] :: $MODULE >> .tmux.conf"
	ln -sf $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf
else
    echo "[ NOTFOUND ] :: $MODULE"
fi
