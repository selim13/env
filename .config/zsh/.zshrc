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
# record timestamps in the history
setopt extended_history
# delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_expire_dups_first
# ignore duplicated history items
setopt hist_ignore_dups
# ignore commands that start with space
setopt hist_ignore_space
# don't run commands with history expansions immediately, instead allow the
# user to preview the expansions and edit the command after expansions in ZLE
setopt hist_verify
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
[ -f "$ZDOTDIR/bindings.zsh" ] && source "$ZDOTDIR/bindings.zsh"

# fzf
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh

# zgen
source "$XDG_DATA_HOME/zgen/zgen.zsh"
if ! zgen saved; then
	zgen load rupa/z
	zgen load zsh-users/zsh-autosuggestions
	zgen load andrewferrier/fzf-z
	zgen load zdharma/fast-syntax-highlighting
	#zgen load jeffreytse/zsh-vi-mode

	zgen save
fi

eval "$(starship init zsh)"

[ -f "$GVM_ROOT/scripts/gvm-default" ] && source "$GVM_ROOT/scripts/gvm-default"
[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"
