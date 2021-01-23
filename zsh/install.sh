#!/bin/bash

if command -v zsh >/dev/null 2>&1; then
    MODULE='zsh'

    echo "[ LINKING ] :: $MODULE >> .zshrc"
	ln -sf "$DOTFILES/zsh/zshrc $HOME/.zshrc"
	ln -sf "$DOTFILES/zsh/fzf.zsh $HOME/.zsh/fzf.zsh"
	ln -sf "$DOTFILES/zsh/zsh_alias.zsh $HOME/.zsh/zsh_alias.zsh"
else
    echo "[ NOTFOUND ] :: $MODULE"
fi
