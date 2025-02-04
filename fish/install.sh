#!/bin/bash

source ../install_module.sh
install_module "fish" "fish/config.fish" "$HOME/.config/fish/config.fish" true
install_module "fish" "fish/fisher-plugins" "$HOME/.config/fish/fisher-plugins" true
install_module "fish" "fish/fish_variables" "$HOME/.config/fish/fish_variables" true
install_module "fish" "fish/fish_plugins" "$HOME/.config/fish/fish_plugins" true
install_module "fish" "fish/startup.sh" "$HOME/.config/fish/startup.sh" true
install_module "fish" "fish/llm_git_complete.fish" "$HOME/.config/fish/llm_git_complete.fish" true
install_module "fish" "fish/grep-ctx.fish" "$HOME/.config/fish/grep-ctx.fish" true
fish
