#!/bin/bash

DOTFILES=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)

backup_file() {
    local FILE_PATH="$1"
    local FILE_BACKUP_PATH="$2"
    if [ -f "$FILE_BACKUP_PATH" ]; then
      backup_file "$FILE_PATH" "$FILE_BACKUP_PATH.bak"
    else
      echo "[ BACKUP ] :: Backup will be stored at $FILE_BACKUP_PATH"
      mv "$FILE_PATH" "$FILE_BACKUP_PATH"
    fi
}

install_module() {
  local MODULE="$1"
  local MODULE_PATH="$2"
  local FILE_PATH="$3"
  
  echo "[ MODULE ] :: $MODULE"
  if [ -x "$(command -v $MODULE)" ] || [ "${4:false}" = true ]; then
    if [ -f "$FILE_PATH" ]; then
      echo "[ BACKUP ] :: $FILE_PATH already exists"
      backup_file "$FILE_PATH" "$FILE_PATH.bak"
    fi
    echo -e "[ LINKING ] :: $MODULE >> $FILE_PATH\n"
    ln -sf "$DOTFILES/$MODULE_PATH" "$FILE_PATH"
  else
      echo -e "[ NOTFOUND ] :: $MODULE\n"
  fi
}
