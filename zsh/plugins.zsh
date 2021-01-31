zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

plugins=(git virtualenv zsh_reload)
source ~/.oh-my-zsh/oh-my-zsh.sh
autoload -U compinit && compinit
