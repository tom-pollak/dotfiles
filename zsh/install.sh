#!/bin/bash

[ ! -d "~/.zsh/" ] && mkdir ~/.zsh
if [ ! -d "~/.oh-my-zsh/" ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && rm -v ~/.zshrc
fi

[ ! -d ${ZSH_CUSTOM1:-$ZSH/custom}/plugins/alias-tips ] && git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM1:-$ZSH/custom}/plugins/alias-tips

source ../install_module.sh
install_module "zsh" "zsh/zshrc" "$HOME/.zshrc"
install_module "zsh" "zsh/fzf.zsh" "$HOME/.zsh/fzf.zsh"
install_module "zsh" "zsh/zsh_alias.zsh" "$HOME/.zsh/zsh_alias.zsh"
install_module "zsh" "zsh/zinit.zsh" "$HOME/.zsh/zinit.zsh"
install_module "zsh" "zsh/plugins.zsh" "$HOME/.zsh/plugins.zsh"

zsh