#!/usr/bin/env bash

DOTFILES=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")/../" && pwd -P)

for f in `find . -regex ".*\.vim$\|.*\.json$"`; do
    rm -rf $HOME/.config/nvim/$f
    ln -sf $DOTFILES/nvim/$f $HOME/.config/nvim/$f
done

rm -rf $HOME/.viminspector.json
ln -sf viminspector.json $HOME/.viminspector.json
