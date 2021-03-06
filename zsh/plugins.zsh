zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zplugin ice as "program" pick "bin/git-dsf"
zplugin light zdharma/zsh-diff-so-fancy


plugins=(git virtualenv zsh_reload alias-tips docker vi-mode tmux taskwarrior django transfer)
source ~/.oh-my-zsh/oh-my-zsh.sh
autoload -U compinit && compinit
