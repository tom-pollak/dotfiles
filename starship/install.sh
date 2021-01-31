#!/bin/bash

[ ! -d ~/.zsh/spaceship-prompt ] && git clone https://github.com/denysdovhan/spaceship-prompt.git "~/.zsh/spaceship-prompt" --depth=1
ln -s "~/.zsh/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme" 

# DOTFILES=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")/../" && pwd -P)

# echo "[ LINKING ] :: starship >> .starship.toml"

# ln -sf $DOTFILES/starship/starship.toml.symlink $HOME/.starship.toml
