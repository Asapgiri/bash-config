#!/bin/bash
eza_full_format='--git --icons=always --group-directories-first --time-style "+%Y %b %d - %H:%M"'

alias grep='grep --color=always'

alias lt="eza -lgF --total-size ${eza_full_format}"
alias ll="eza -AlgF ${eza_full_format}"
alias la="eza -AlgF ${eza_full_format}"
alias l='ls -CF'
alias ls='eza --icons=always --group-directories-first'

## Aliases for git:

alias gs="git status"
alias gr="cd \$(git rev-parse --show-toplevel)"
alias gl="git log --oneline main..HEAD"
alias gitstat="git status && git log --oneline main..HEAD"

alias cf="cd \$(find -type d | fzf)"
alias nf="\$EDITOR \$(fzf)"

alias da="du -a"
alias cd..="cd .."

alias tma="tmux a || tmux"
alias ncat="nvim-cat -n"
alias kitty="kitty -o hide_window_decorations=yes --detach"

alias mountwh="sshfs login1.euhpc.arm.com:/arm /arm"

if [ -f ~/.bash_aliases_private ]; then
    . ~/.bash_aliases_private
fi

