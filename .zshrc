# Oh My Zsh
export ZSH=~/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git npm zsh_reload ssh-agent docker docker-compose docker-machine z fzf-zsh zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
source ~/.zplug/init.zsh

# User configuration
PATH="$HOME/bin:$PATH"

# Zplug
# zplug "g-plane/zsh-yarn-autocompletions", hook-build:"./zplug.zsh", defer:2

# Zsh
unsetopt auto_cd

# Key bindings
bindkey -e

bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word

# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix

# # bindkey "^[[3;3~" delete-word # alt+del
bindkey "^[[3;5~" kill-word # ctrl+del
bindkey "^[[3^" kill-word # ctrl+del
bindkey "^H" backward-kill-word # ctrl+backspace
# # #bindkey ';5D' backward-word # ctrl+left
# # #bindkey ';5C' forward-word  # ctrl+right
# #
# bindkey "\eOc" emacs-forward-word
# bindkey "\e[5D" backward-word
# bindkey "\eOd" emacs-backward-word
# bindkey "\e\e[C" forward-word
# bindkey "\e\e[D" backward-word
#
# bindkey '^[^[[C' emacs-forward-word
# bindkey '^[^[[D' emacs-backward-word

# bindkey '^[Od' emacs-backward-word
# bindkey '^[Oc' emacs-forward-word

#bindkey '^[[D' emacs-backward-word
# bindkey '^[[C' emacs-forward-word


# Aliases
alias tmux="tmux -2"
alias la="exa -lahbg --git"

alias tree="tree -I '.git|node_modules|.sass-cache' --dirsfirst -aC"

alias halt="halt -p"
alias octave-cli="octave --no-gui"
alias octave-gui="octave --force-gui"

alias gc="git commit -v"
alias gb="git branch"
alias gch="git checkout"
alias gp="git push"
alias gs="git status"
alias gd="git diff"
alias ga="git add"

alias wttr="curl wttr.in"

alias emacs="emacs -nw"
alias emacsx="emacs24-x"

# Snap
PATH="/snap/bin:$PATH"

# NPM
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"

# Go
export GOPATH=~/go
export GOROOT=~/opt/golang1.8
PATH=$GOROOT/bin:$GOPATH/bin:$PATH

# Rust
PATH="~/.cargo/bin:$PATH"

# Ruby
export GEM_HOME=$HOME/.gem
PATH=$PATH:$HOME/.gem/bin

# Transmission
export TRANSMISSION_HOME=~/.config/transmission-daemon

# Kicad
# Kicad custom modules directory
export KIMYMOD=~/my/electronics/kicad/my-library/modules

# X
export XDG_CURRENT_DESKTOP="gnome"

# added by travis gem
[ -f /home/selim13/.travis/travis.sh ] && source /home/selim13/.travis/travis.sh
