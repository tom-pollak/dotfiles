#!/bin/bash

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
source ../install_module.sh
install_module "nvim" "nvim/" "$HOME/.config/nvim"
