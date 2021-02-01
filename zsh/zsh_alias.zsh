alias cat=batcat
alias v=nvim
alias fd=fdfind

bindkey -s '^o' 'nvim $(fzf)^M'
bindkey '^q' beginning-of-line

alias ls='exa -bG --git'
alias l='exa -bG --git'
alias ll='exa -lbG --git'
alias llm='exa -lbGd --git --sort=modified'                            # long list, modified date sort
alias la='exa -abG --git'  
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list

alias ..="cd .."
alias ...="cd ..."
alias ....="cd ...."
