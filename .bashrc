#
# ~/.bashrc
#

alias kde='$HOME/.config/scripts/launch_kde.sh'
# alias grep='grep --color=auto'
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
# alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

if [ "$TERM" != "linux" ]; then
	# eval "$(starship init bash)"
	exec fish
fi
# source "$HOME/.cargo/env"
# . "$HOME/.cargo/env"


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
