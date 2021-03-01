# Default Programs:
export EDITOR="vim"
export VISUAL="vim"
export READER="zathura"
export TERMINAL="alacritty"
export BROWSER="brave"
export PAGER="less"

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/inputrc"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export RUSTUP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rustup"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export npm_config_cache="$HOME/.cache/npm-cache"
export __GL_SHADER_DISK_CACHE_PATH="${XDG_CACHE_HOME:-$HOME/.cache}"
export VSCODE_EXTENSIONS="${XDG_DATA_HOME:-$HOME/.local/share}/vscode"
export N_PREFIX="$HOME/.local/share/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

# fzf:
export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git --exclude dist --exclude node_modules"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

