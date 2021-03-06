alias cat=batcat
alias v=nvim
alias fd=fdfind
alias untar='tar -zxvf '
alias ipe="curl -w '\n' ipinfo.io/ip"
alias sync="sudo ntpdate pool.ntp.org"

bindkey -s '^o' 'nvim $(fzf)^M'
bindkey '^q' beginning-of-line
bindkey '^j' autosuggest-accept

alias ls='exa -bG --git'
alias l='exa -bG --git'
alias ll='exa -labG --git'
alias llm='exa -labGd --git --sort=modified'                            # long list, modified date sort
alias la='exa -abG --git'  
alias lx='exa -labhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias chrome="/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe"
alias exp="explorer.exe"
