#!/bin/bash

mkdir $HOME/.config

sudo apt install -y software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update -y && sudo apt upgrade
sudo apt install neovim emacs27

sudo apt install -y bat fd-find python3-pip build-essential curl file git tmux fuse zsh procps ripgrep

sh -c "$(curl -fsSL https://starship.rs/install.sh)"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.profile
$(brew --prefix)/opt/fzf/install  

brew install exa fzf efm-langserver pipx diff-so-fancy
pipx install black
pipx install 'python-lsp-server[all]'
