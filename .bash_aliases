#!/bin/bash

alias grep='grep --color=always'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

## Aliases for git:

alias gl="git log --oneline main..HEAD"
alias gitstat="git status && git log --oneline main..HEAD"

alias da="du -a"
alias cd..="cd .."


if [ -f ~/.bash_aliases_private ]; then
    . ~/.bash_aliases_private
fi

