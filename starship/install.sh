#!/bin/bash

DOTFILES=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")/../" && pwd -P)

echo "[ LINKING ] :: starship >> .starship.toml"

ln -sf $DOTFILES/starship/starship.toml.symlink $HOME/.starship.toml
