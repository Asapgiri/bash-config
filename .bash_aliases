#!/bin/bash
eza_full_format='--git --icons=always --group-directories-first --time-style "+%Y %b %d - %H:%M"'

alias grep='grep --color=always'

alias lt="eza -lgF --total-size ${eza_full_format}"
alias ll="eza -lgF ${eza_full_format}"
alias la="eza -AlgF ${eza_full_format}"
alias l='ls -CF'
alias ls='eza --icons=always --group-directories-first'

## Aliases for git:

alias gl="git log --oneline main..HEAD"
alias gitstat="git status && git log --oneline main..HEAD"

alias da="du -a"
alias cd..="cd .."


if [ -f ~/.bash_aliases_private ]; then
    . ~/.bash_aliases_private
fi

