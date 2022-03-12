#!/bin/bash

source ../install_module.sh
install_module "git" "git/gitconfig" "$HOME/.gitconfig"
install_module "git" "git/gitconfig.local" "$HOME/.gitconfig.local"

git config --global include.path $HOME/.gitconfig.local

# If hub is found, use https: instead of git: or ssh::
if command -v hub >/dev/null 2>&1; then
    git config --global hub.protocol https
fi
