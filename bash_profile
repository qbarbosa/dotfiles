export SHELL=$(which zsh)
[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l

export VISUAL=vim
export EDITOR="$VISUAL"

source ~/.bash_aliases
