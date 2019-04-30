#zmodload zsh/zprof

# Oh My Zsh
export ZSH=~/.oh-my-zsh
ZSH_THEME="robbyrussell"
export NVM_LAZY_LOAD=true
export FZF_TMUX=1

source $ZSH/oh-my-zsh.sh

# User configuration
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# zgen
source "${HOME}/.zgen/zgen.zsh"
if ! zgen saved; then
	# zgen oh-my-zsh
	zgen oh-my-zsh plugins/fzf
	zgen oh-my-zsh plugins/git
	zgen oh-my-zsh plugins/npm
	zgen oh-my-zsh plugins/zsh_reload
	zgen oh-my-zsh plugins/ssh-agent
	zgen oh-my-zsh plugins/docker
	zgen oh-my-zsh plugins/docker-compose
	zgen oh-my-zsh plugins/z

	zgen load zsh-users/zsh-autosuggestions
	zgen load andrewferrier/fzf-z
	zgen load lukechilds/zsh-nvm

	zgen save
fi

# Zsh
#unsetopt auto_cd

# Key bindings
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

# # bindkey "^[[3;3~" delete-word # alt+del
bindkey "^[[3;5~" kill-word # ctrl+del
bindkey "^[[3^" kill-word # ctrl+del
bindkey "^H" backward-kill-word # ctrl+backspace

# Aliases
alias tmux="tmux -2"
alias la="exa -lahbg --git"

alias tree="tree -I '.git|node_modules|.sass-cache' --dirsfirst -aC"

alias halt="halt -p"

alias gc="git commit -v"
alias gs="git status"
alias gd="git diff"
alias ga="git add"

alias wttr="curl wttr.in"

alias emacs="emacs -nw"
alias emacsx="emacs24-x"

# Snap
PATH="/snap/bin:$PATH"

# Go
export GOPATH=~/go
export GOROOT=~/opt/golang1.8
PATH=$GOROOT/bin:$GOPATH/bin:$PATH

# Rust
PATH="~/.cargo/bin:$PATH"

# Ruby
export GEM_HOME=$HOME/.gem
PATH=$PATH:$HOME/.gem/bin

# X
export XDG_CURRENT_DESKTOP="gnome"
export GTK_IM_MODULE=xim # fixes ctrl-shift-e in vscode

# added by travis gem
[ -f /home/selim13/.travis/travis.sh ] && source /home/selim13/.travis/travis.sh

# time
