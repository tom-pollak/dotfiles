#!/bin/bash

[ ! -d ~/.tmux/plugins/tpm/ ] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins

source ../install_module.sh
install_module "tmux" "tmux/tmux.conf" "$HOME/.tmux.conf"