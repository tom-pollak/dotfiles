#!/usr/bin/env bash

# link wholesale
# for f in `find . -regex ".*\.vim$\|.*\.lua$\|.*\.json$"`; do
for f in `find . -regex ".*\.vim$\|.*\.json$"`; do
    rm -rf ~/.config/nvim/$f
    ln -s ~/dotfiles/nvim/$f ~/.config/nvim/$f
done
ln -s ~/dotfiles/.viminspector.json ~/projects/.viminspector.json

