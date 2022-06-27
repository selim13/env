#!/usr/bin/env zsh

# use nvim in favour of vim if present
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

# colorize commands when possible
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

# other
alias tree="tree -I '.git|node_modules|.sass-cache' --dirsfirst -aC"
alias halt="halt -p"
alias p="pnpm"
