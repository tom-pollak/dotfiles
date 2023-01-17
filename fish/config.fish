if status is-interactive
    starship init fish | source
end

set fish_greeting
fish_vi_key_bindings

fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/opt/llvm/bin
fish_add_path /opt/homebrew/opt/openjdk/bin
fish_add_path /usr/local/opt/node@16/bin

# set -gx PATH $HOME/.cargo/bin:$HOME/.local/bin:/home/linuxbrew/.linuxbrew/bin:$HOME/.poetry/bin:/opt/homebrew/bin:/usr/local/bin $PATH
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/bin
fish_add_path /home/linuxbrew/.linuxbrew/bin
fish_add_path $HOME/.poetry/bin
fish_add_path /opt/homebrew/bin
fish_add_path /usr/local/bin
fish_add_path /opt/homebrew/opt/ruby@3.1/bin

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx GIT_EDITOR nvim
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -gx PAGER bat
set -gx VIMRC $HOME/.config/nvim/init.lua
set -gx PROJECT_PATHS ~/projects
set -gx fisher_path /Users/tom/.config/fish/
set -gx WORKSPACE $HOME/projects

set -gx DFT_DISPLAY inline
set -gx LIBGL_ALWAYS_INDIRECT 1
set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/llvm/include"


# TODO ctrl o is alil weird atm
bind -M insert \cj forward-char
bind -M insert \ca beginning-of-line
bind -M insert \cp history-prefix-search-backward
bind -M insert \cn history-prefix-search-forward
bind -M insert \cs __ethp_commandline_toggle_sudo

alias cat=bat
alias v=nvim
alias lg=lazygit
alias r=ranger

alias untar='tar -zxvf'
alias ipe="curl -w '\n' ipinfo.io/ip"
alias sync="sudo ntpdate pool.ntp.org"
alias c="clear"
alias hr="history --merge"

alias ls='exa -bG --git'
alias l='exa -bG --git'
alias ll='exa -labG --git'
alias llm='exa -labGd --git --sort=modified' # long list, modified date sort
alias la='exa -abG --git'
alias lx='exa -labhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list

# pyenv init - | source # 90ms -> 250ms
alias pe='pyenv init - | source'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# set -gx NVM_DIR $HOME/.nvm
# pyenv init - | source
# set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths

source /opt/homebrew/opt/asdf/libexec/asdf.fish

# Nested neovim lazy
if set -q NVIM_LISTEN_ADDRESS
    alias nvim="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    alias v="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    set -gx EDITOR "nvr -cc split --remote-wait +'set bufhidden=wipe'"
    set -gx VISUAL "nvr -cc split --remote-wait +'set bufhidden=wipe'"
end

