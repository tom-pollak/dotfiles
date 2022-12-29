if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx PATH $HOME/.cargo/bin:$HOME/.local/bin:/home/linuxbrew/.linuxbrew/bin:$HOME/.poetry/bin:/opt/homebrew/bin:/usr/local/bin $PATH

fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/opt/llvm/bin
fish_add_path /opt/homebrew/opt/openjdk/bin
fish_add_path /usr/local/opt/node@16/bin


set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -gx PAGER bat
set -gx VIMRC $HOME/.config/nvim/init.lua


if set -q NVIM
    alias nvim="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    alias v="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    set -gx EDITOR "nvr -cc split --remote-wait +'set bufhidden=wipe'"
    set -gx VISUAL "nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
    set -gx EDITOR nvim
    set -gx VISUAL nvim
end

set -gx GIT_EDITOR nvim

set -gx LIBGL_ALWAYS_INDIRECT 1

set -gx PROJECT_PATHS ~/projects
set -gx WORKSPACE $HOME/projects
set -gx NVM_DIR $HOME/.nvm
set -gx fisher_path /Users/tom/.config/fish/
set -gx DFT_DISPLAY inline

set fish_greeting
fish_vi_key_bindings

alias cat=bat
alias v=nvim@0.7.2
# alias fd=fdfind
alias untar='tar -zxvf '
alias ipe="curl -w '\n' ipinfo.io/ip"
alias sync="sudo ntpdate pool.ntp.org"
alias c="clear"
alias dghci="TERM=dumb ghci"
alias hr="history --merge"

# bind -M insert \co 'nvim $(fzf)'
bind -M insert \cj forward-char
bind -M insert \cf tmux-sessionizer
bind -M insert \ch beginning-of-line
bind -M insert \cp history-prefix-search-backward
bind -M insert \cn history-prefix-search-forward

alias ls='exa -bG --git'
alias l='exa -bG --git'
alias ll='exa -labG --git'
alias llm='exa -labGd --git --sort=modified' # long list, modified date sort
alias la='exa -abG --git'
alias lx='exa -labhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list
alias lg=lazygit

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

starship init fish | source

set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/llvm/include"

set _CONDA_ROOT "/Users/tom/opt/anaconda3"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
