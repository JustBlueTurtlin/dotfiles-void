export ZDOTDIR="$HOME/.config/zsh"
source "/home/michael/.local/share/cargo/env"

# set PATH
typeset -U path
path=(
  /opt/brave
  /opt/crystal-0.36.1-1/bin
  ~/.local/bin
  ~/.local/share/cargo/bin
  $path
)
