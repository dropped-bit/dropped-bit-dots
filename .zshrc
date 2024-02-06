eval "$(/opt/homebrew/bin/brew shellenv)"
# Set Starship Promt
eval "$(starship init zsh)"
# Source zsh.alias
source $HOME/.zsh_aliases

exec fish
