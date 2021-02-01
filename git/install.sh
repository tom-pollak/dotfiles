#!/bin/bash

DOTFILES=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")/../" && pwd -P)

echo "[ LINKING ] :: Git >> config"

rm $HOME/.gitconfig
rm $HOME/.gitconfig.local

ln -sf "$DOTFILES/git/gitconfig.local" $HOME/.gitconfig.local
ln -sf "$DOTFILES/git/gitconfig" $HOME/.gitconfig

git config --global include.path $HOME/.gitconfig.local

# If hub is found, use https: instead of git: or ssh::
if command -v hub >/dev/null 2>&1; then
    git config --global hub.protocol https
fi
