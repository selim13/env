export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Paths 
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Default programs:
export EDITOR="vim"
export TERMINAL="gnome-terminal"
export BROWSER="firefox"
export PAGER="less"

# Shell
export HISTFILE="$XDG_DATA_HOME/history" # sh history

# Zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export _Z_DATA="$XDG_DATA_HOME/z"
export ZGEN_DIR="$XDG_DATA_HOME/zgen"

# X
export XDG_CURRENT_DESKTOP="gnome"
export GTK_IM_MODULE=xim # fixes ctrl-shift-e in vscode

# Yarn
export PATH="$HOME/.yarn/bin:$PATH"

# PNPM
export PNPM_HOME="$XDG_DATA_HOME/pnpm"                                                                                                                                             
export PATH="$PNPM_HOME:$PATH" 

# Snap
export PATH="/snap/bin:$PATH"

# Go
export GOPATH="$XDG_DATA_HOME/go"
export PATH="$GOPATH/bin:$PATH"
export GVM_ROOT="$XDG_DATA_HOME/gvm"

# Rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export PATH="$CARGO_HOME/.cargo/bin:$PATH"

# RVM
export PATH="$HOME/.rvm/bin:$PATH"

# fnm
export PATH="$HOME/.fnm:$PATH"

# Deno
export DENO_INSTALL="$XDG_DATA_HOME/deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Other
export LESSHISTFILE="-"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"
