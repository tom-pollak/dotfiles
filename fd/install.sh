#!/bin/bash

DOTFILES=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")/../" && pwd -P)

echo "[ LINKING ] :: fd >> .fdignore"

ln -sf $DOTFILES/fd/fdignore $HOME/.fdignore
