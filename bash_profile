export SHELL=$(which zsh)
[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l

source ~/.bash_aliases
