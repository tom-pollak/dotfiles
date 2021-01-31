#!/bin/bash

DOTFILES=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")/../" && pwd -P)

[ ! -d "~/.zsh/" ] && mkdir ~/.zsh
if [ ! -d "~/.oh-my-zsh/" ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && rm -v ~/.zshrc
fi

if command -v zsh >/dev/null 2>&1; then
    MODULE='zsh'

    echo "[ LINKING ] :: $MODULE >> .zshrc"
	ln -sf $DOTFILES/zsh/zshrc $HOME/.zshrc
	ln -sf $DOTFILES/zsh/fzf.zsh $HOME/.zsh/fzf.zsh
	ln -sf $DOTFILES/zsh/zsh_alias.zsh $HOME/.zsh/zsh_alias.zsh
	ln -sf $DOTFILES/zsh/zinit.zsh $HOME/.zsh/zinit.zsh
	ln -sf $DOTFILES/zsh/plugins.zsh $HOME/.zsh/plugins.zsh
else
    echo "[ NOTFOUND ] :: $MODULE"
fi
zsh
