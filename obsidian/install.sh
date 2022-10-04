#!/bin/bash

install_obsidian_workspace() {
    echo -e "[ NOTE ] :: This script requires you to be in the obsidian directory when running"

    local MODULE_PATH
    MODULE_PATH="$(pwd -P)"
    local OBSIDIAN_WORKSPACE="$1"

    if [ -d "$OBSIDIAN_WORKSPACE" ]; then
        if [ -d "$OBSIDIAN_WORKSPACE/.obsidian" ]; then
            echo -e "[ LINKING ] :: OBSIDIAN >> $OBSIDIAN_WORKSPACE\n"
            ln -sf "$MODULE_PATH/.obsidian.vimrc" "$OBSIDIAN_WORKSPACE"
            ln -sf "$MODULE_PATH/obsidian.css" "$OBSIDIAN_WORKSPACE"

            for F in "$MODULE_PATH/.obsidian"/*; do
                local filename
                filename=$(basename "$F")
                echo -e "[ DEBUG ] :: $MODULE_PATH/.obsidian/$filename >> $OBSIDIAN_WORKSPACE/.obsidian/$filename\n"
                ln -sf "$MODULE_PATH/.obsidian/$filename" "$OBSIDIAN_WORKSPACE/.obsidian/$filename"
            done
        else
          echo -e "[ NOTFOUND ] :: $OBSIDIAN_WORKSPACE/.obsidian\n"
          echo -e "[ NOTFOUND ] :: Please setup a obsidian valut\n"
        fi
    else
      echo -e "[ NOTFOUND ] :: $OBSIDIAN_WORKSPACE\n"
    fi

}

install_obsidian_workspace "$@"
