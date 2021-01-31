#!/usr/bin/env bash

DOTFILES=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")/../" && pwd -P)

for f in `find . -regex ".*\.vim$\|.*\.json$"`; do
    rm -rf ~/.config/nvim/$f
    ln -s $DOTFILES/nvim/$f ~/.config/nvim/$f
done

ln -s .viminspector.json ~/projects/.viminspector.json
