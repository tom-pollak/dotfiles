#!/bin/bash

cd $(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
sudo pacman -S starship exa bat neovim python-pip fd fzf efm-langserver
brew install pipx

wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -O /usr/local/share/zsh/site-functions/_tmuxinator
mkdir $HOME/.tmp
for d in */ ; do
    if [[ $d -ne "nvim-old" ]]; then
        chmod +x $d/install.sh && $d/install.sh
    fi
done
tmux source-file .tmux.conf
