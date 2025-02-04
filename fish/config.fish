if status is-interactive
    starship init fish | source
end

set fish_greeting
fish_vi_key_bindings

fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/opt/llvm/bin
fish_add_path /opt/homebrew/opt/openjdk/bin
fish_add_path /opt/homebrew/opt/sqlite/bin

fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.poetry/bin
fish_add_path /opt/homebrew/bin
fish_add_path /usr/local/bin

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx GIT_EDITOR nvim
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -gx PAGER "bat -p"

set -gx PROJECT_PATHS $HOME/projects
set -gx WORKSPACE $HOME/projects
set -gx VIMRC $HOME/.config/nvim/init.lua
set -gx fisher_path $HOME/.config/fish/

set -gx DFT_DISPLAY inline
set -gx LIBGL_ALWAYS_INDIRECT 1
set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/llvm/include"
set -gx CC /opt/homebrew/opt/llvm/bin/clang
set -gx CXX /opt/homebrew/opt/llvm/bin/clang++

set -gx PATH $PATH $HOME/.krew/bin

# # TKINTER
# fish_add_path /opt/homebrew/Cellar/tcl-tk/8.6.13_1
# set -l ldflags_tk "-L/opt/homebrew/Cellar/tcl-tk/8.6.13_1/lib"
# set -l cppflags_tk "-I/opt/homebrew/Cellar/tcl-tk/8.6.13_1/include"
#
# set -gx LDFLAGS "$LDFLAGS" "$ldflags_tk"
# set -gx CPPFLAGS "$CPPFLAGS" "$cppflags_tk"
# set -gx PKG_CONFIG_PATH "/opt/homebrew/Cellar/tcl-tk/8.6.13_1/lib/pkgconfig"
# set -gx PYTHON_CONFIGURE_OPTS="--with-tcltk-includes='-I/opt/homebrew/Cellar/tcl-tk/8.6.13_1/include' --with-tcltk-libs='-L/opt/homebrew/Cellar/tcl-tk/8.6.13_1/lib'"
# # ----------

bind -M insert \cp history-prefix-search-backward
bind -M insert \cn history-prefix-search-forward
bind -M insert \cj forward-char

bind -M insert \ck history-prefix-search-backward
# bind -M insert \cj history-prefix-search-forward
# bind -M insert \cl forward-char

bind -M insert \ca beginning-of-line


alias cat=$PAGER
alias v=nvim
alias lg=lazygit
alias r=ranger
alias firefox=/Applications/Firefox.app/Contents/MacOS/firefox

alias untar='tar -zxvf'
alias sync='rsync -rlptzav --progress'
alias ipe="curl -w '\n' ipinfo.io/ip"
alias tsync="sudo ntpdate pool.ntp.org"
alias c="clear"
alias hr="history --merge"

alias ls='eza -bG --git'
alias l='eza -bG --git'
alias ll='eza -labG --git'
#alias llm='eza -labGd --git --sort=modified' # long list, modified date sort
alias la='eza -abG --git'
alias lx='eza -labhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list

alias pf="fzf --preview='less {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"

alias mamba="micromamba"
alias m="micromamba"
alias conda="micromamba"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias kssh="kitty +kitten ssh"

# Nested neovim lazy
if set -q NVIM_LISTEN_ADDRESS
    alias nvim="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    alias v="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    set -gx EDITOR "nvr -cc split --remote-wait +'set bufhidden=wipe'"
    set -gx VISUAL "nvr -cc split --remote-wait +'set bufhidden=wipe'"
end

function fuzz_nvim
    set file (fzf)
    if test (count $file) -gt 0
        nvim $file
    end
end

bind -M insert \co fuzz_nvim

[ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish


function fzf_autojump
  set path (sort -k1,1nr ~/Library/autojump/autojump.txt | awk 'BEGIN {FS = "\t"} {print $2}' | fzf --tiebreak=index)
  if test -n "$path"
    pushd $path
  end
end

bind -M insert \cf fzf_autojump

source ~/.dotfiles/fish/llm_git_complete.fish
source ~/.dotfiles/fish/grep-ctx.fish


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
set -gx MAMBA_EXE "/opt/homebrew/bin/micromamba"
set -gx MAMBA_ROOT_PREFIX "/Users/tom/micromamba"
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<

