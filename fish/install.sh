#!/bin/bash

source ../install_module.sh
install_module "fish" "fish/config.fish" "$HOME/.config/fish/config.fish" true
install_module "fish" "fish/fisher-plugins" "$HOME/.config/fish/fisher-plugins" true
install_module "fish" "fish/fish_variables" "$HOME/.config/fish/fish_variables" true
install_module "fish" "fish/fish_plugins" "$HOME/.config/fish/fish_plugins" true
install_module "fish" "fish/startup.sh" "$HOME/.config/fish/startup.sh" true
fish
