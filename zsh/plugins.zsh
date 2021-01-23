git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/alias-tips

plugins=(zsh-autosuggestions, zsh-completions, alis-tips)
autoload -U compinit && compinit
