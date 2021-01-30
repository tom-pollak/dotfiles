#!/bin/bash

echo "[ LINKING ] :: starship >> .starship.toml"

ln -sf $DOTFILES/starship/starship.toml.symlink $HOME/.starship.toml
