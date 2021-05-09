# https://github.com/dmitmel/dotfiles/
# https://github.com/LukeSmithxyz/voidrice

#zmodload zsh/zprof

# Oh My Zsh
#export ZSH=~/.oh-my-zsh
#ZSH_THEME="robbyrussell"
#DISABLE_MAGIC_FUNCTIONS=true
export FZF_TMUX=1

#source $ZSH/oh-my-zsh.sh
autoload -U colors && colors # Load colors
. "$XDG_DATA_HOME/lscolors.sh"

# automatically cd into typed directory
setopt autocd
# allow using # in interactive shell
setopt interactive_comments

# disable Ctrl+S and Ctrl+Q 
# (https://unix.stackexchange.com/questions/137842/what-is-the-point-of-ctrl-s)
setopt no_flow_control

# history file path
HISTFILE=$XDG_CACHE_HOME/zsh/history
# max number of entries stored in memory
HISTSIZE=50000
# max number of entries in the HISTFILE
SAVEHIST=1000000
# ignore duplicated history items
setopt hist_ignore_dups
# ignore commands that start with space
setopt hist_ignore_space
# immediately write HISTFILE to disk when a new command is appended
setopt inc_append_history
# synchronize history between active sessions
setopt share_history

# completion
zmodload zsh/complist
zstyle ':completion:*' menu select
# show even more completion results
zstyle ':completion:*' verbose yes
# colors
[ -n "$LS_COLORS" ] && zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
# group completion result based on their categories
zstyle ':completion:*' group-name ''
# format for displaying category names
zstyle ':completion:*:descriptions' format '%F{yellow}[%d]%f'
# show directories first
zstyle ':completion:*' list-dirs-first yes
# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path $ZSH_CACHE_DIR

autoload -U compinit
compinit
# include hidden files
_comp_options+=(globdots)

# load additional configs
[ -f "$ZDOTDIR/aliases.zsh" ] && source "$ZDOTDIR/aliases.zsh"

# zgen
source "$XDG_DATA_HOME/zgen/zgen.zsh"
if ! zgen saved; then
	zgen load rupa/z
	zgen load zsh-users/zsh-autosuggestions
	zgen load andrewferrier/fzf-z

	zgen save
fi

[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh

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

alias tree="tree -I '.git|node_modules|.sass-cache' --dirsfirst -aC"

alias halt="halt -p"

alias gc="git commit -v"
alias gs="git status"
alias gd="git diff"
alias ga="git add"

alias wttr="curl wttr.in"

alias emacs="emacs -nw"
alias emacsx="emacs24-x"

eval "`fnm env --use-on-cd`"
eval "$(starship init zsh)"
