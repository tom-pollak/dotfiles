#!/bin/bash

source ../install_module.sh

for f in *;
do
    echo "$f"
    if [ "$f" != "install.sh" ]; then
        install_module "scripts" "scripts/$f" "$HOME/.local/bin/$f" true
    fi
done
