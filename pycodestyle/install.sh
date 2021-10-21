#!/bin/bash

DOTFILES=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")/../" && pwd -P)

echo "[ LINKING ] :: pycodestyle >> config"

ln -sf "$DOTFILES/pycodestyle/pycodestyle" $HOME/.config/pycodestyle

