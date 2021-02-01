#!/bin/bash
if ! command -v fdfind &> /dev/null; then
	echo "[ INSTALLING ] :: fd-find"
	sudo apt install fd-find
fi

DOTFILES=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")/../" && pwd -P)

echo "[ LINKING ] :: fd >> .fdignore"

rm $HOME/.fdignore
ln -sf $DOTFILES/fd/fdignore $HOME/.fdignore
