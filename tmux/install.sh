#!/bin/bash

DOTFILES=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")/../" && pwd -P)

[ -d ~/.tmux/plugins/tpm/ ] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins

if command -v tmux >/dev/null 2>&1; then
    MODULE='tmux'

    echo "[ LINKING ] :: $MODULE >> .tmux.conf"
	ln -sf $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf
else
    echo "[ NOTFOUND ] :: $MODULE"
fi
