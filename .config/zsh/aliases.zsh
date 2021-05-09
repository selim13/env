#!/usr/bin/env zsh

# Colorize commands when possible
alias ls="ls --color=auto" 
alias grep="grep --color=auto" 
alias diff="diff --color=auto"

# ls
alias l="exa --group-directories-first --classify --git"
alias ll="l --long --header --group --binary"
alias la="ll --all"
