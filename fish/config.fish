if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx PATH $HOME/.local/bin:/opt/apache-maven-3.6.3/bin:$HOME/.emacs.d/bin:/home/linuxbrew/.linuxbrew/bin:$HOME/.poetry/bin $PATH
set -gx MANPAGER "sh -c 'col -bx | batcat -l man -p'"
set -gx PAGER less
set -gx EDITOR nvim
set -gx VIMRC $HOME/.config/nvim/init.vim
set -gx DISPLAY (cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
set -gx LIBGL_ALWAYS_INDIRECT 1

set -gx JAR /usr/lib/jvm/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.6.0.v20200915-1508.jar
set -gx GRADLE_HOME /usr/share/gradle
set -gx JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
set -gx JDTLS_CONFIG /usr/lib/jvm/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_linux
set -gx WORKSPACE $HOME/projects
set fish_greeting

alias cat=batcat
alias v=nvim
alias fd=fdfind
alias untar='tar -zxvf '
alias ipe="curl -w '\n' ipinfo.io/ip"
alias sync="sudo ntpdate pool.ntp.org"
alias c="clear"

bind \co 'nvim $(fzf)'
bind \cj forward-char
bind \cf tmux-sessionizer

alias ls='exa -bG --git'
alias l='exa -bG --git'
alias ll='exa -labG --git'
alias llm='exa -labGd --git --sort=modified' # long list, modified date sort
alias la='exa -abG --git'
alias lx='exa -labhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

starship init fish | source
