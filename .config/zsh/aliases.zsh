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
alias j="just"
alias dbeaver="GTK_IM_MODULE=ibus dbeaver"
alias protontricks='flatpak run com.github.Matoking.protontricks'
alias protontricks-launch='flatpak run --command=protontricks-launch com.github.Matoking.protontricks'
alias clipboard-remove-newslines="xclip -o -selection clipboard | xargs echo -n | xclip -selection clipboard"

# deb
alias deb-size=$'dpkg-query --show --showformat=\'${Package;-50}\t${Installed-Size}\n\' | sort -k 2 -n | grep -v deinstall | awk \'{printf "%.3f MB \t %s\n", $2/(1024), $1}\''
