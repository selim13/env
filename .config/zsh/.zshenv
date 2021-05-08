export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Paths 
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Default programs:
export EDITOR="vim"
export TERMINAL="gnome-terminal"
export BROWSER="firefox"

# Zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_DATA_HOME/history"
export _Z_DATA="$XDG_DATA_HOME/z"

# X
export XDG_CURRENT_DESKTOP="gnome"
export GTK_IM_MODULE=xim # fixes ctrl-shift-e in vscode

# Yarn
export PATH="$HOME/.yarn/bin:$PATH"

# Snap
export PATH="/snap/bin:$PATH"

# Go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# RVM
export PATH="$HOME/.rvm/bin:$PATH"

# fnm
export PATH="$HOME/.fnm:$PATH"

# Deno
export DENO_INSTALL="$XDG_DATA_HOME/deno"
export PATH="$DENO_INSTALL/bin:$PATH"

