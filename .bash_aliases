#!/bin/bash

alias grep='grep --color=always'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

if [ -f ~/.bash_aliases_private ]; then
    . ~/.bash_aliases_private
fi

