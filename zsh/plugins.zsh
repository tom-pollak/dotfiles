zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

[ ! -d ${ZSH_CUSTOM1:-$ZSH/custom}/plugins/alias-tips ] && git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM1:-$ZSH/custom}/plugins/alias-tips

plugins=(git virtualenv zsh_reload alias-tips)
source ~/.oh-my-zsh/oh-my-zsh.sh
autoload -U compinit && compinit
