#!/bin/bash

mkdir -p $HOME/.config/bat

source ../install_module.sh
install_module "bat" "bat/config" "$HOME/.config/bat/config"
