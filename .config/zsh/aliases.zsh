#!/usr/bin/env zsh

# Colorize commands when possible
alias ls="ls --color=auto" 
alias grep="grep --color=auto" 
alias diff="diff --color=auto"

# ls
alias l="exa --group-directories-first --classify --git"
alias ll="l --long --header --group --binary"
alias la="ll --all"

# git
alias gc="git commit -v"
alias gs="git status"
alias gd="git diff"
alias ga="git add"

# Other
alias tree="tree -I '.git|node_modules|.sass-cache' --dirsfirst -aC"
alias halt="halt -p"

