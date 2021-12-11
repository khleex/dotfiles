#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PATH=$PATH:~/bin

export HISTCONTROL=ignoreboth
export HISTSIZE=1000000
export HISTFILESIZE=1000000000

export EDITOR=nvim
export VISUAL=nvim
export MANPAGER="nvim -c 'set ft=man' -"
export GPG_TTY=$(tty)

alias ls='ls --color=auto'
PS1='\[\e[m\][\u@\h \W]\[\e[93m\]\$\[\e[m\] '

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias c='clear'
alias e="$EDITOR"
alias ls='lsd'
alias l='lsd -l'
alias ll='lsd -Al'
alias mv='mv -i'
alias cp='cp -i'
alias vi='nvim'
alias tmux='tmux -2'

source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

export FZF_ALT_C_COMMAND='fd --type directory --hidden | sed -En "/^\\./{H;b}; p; \${g;s/^\\n//;T;p}"'
