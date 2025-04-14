#!/bin/bash

source ../install_module.sh
install_module "git" "git/gitconfig" "$HOME/.gitconfig"
mkdir -p "$HOME/fun"
install_module "git" "git/gitconfig_pers" "$HOME/fun/.gitconfig"
install_module "git" "git/gitignore" "$HOME/.gitignore"

# If hub is found, use https: instead of git: or ssh::
if command -v hub >/dev/null 2>&1; then
    git config --global hub.protocol https
fi
