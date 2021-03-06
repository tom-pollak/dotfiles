#!/bin/bash

DOTFILES=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")/../" && pwd -P)
mkdir -p $HOME/.config/nvim
mkdir .tmp

for f in `find . -regex ".*\.vim$\|.*\.json$"`; do
    ln -sf $DOTFILES/nvim/$f $HOME/.config/nvim/$f
done

ln -sf $DOTFILES/nvim/vimspector.json $HOME/.vimspector.json
