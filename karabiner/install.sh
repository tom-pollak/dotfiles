#!/bin/bash

source ../install_module.sh
rm -rf "$HOME/.config/karabiner/"
install_module "karabiner" "karabiner/" "$HOME/.config/" true
