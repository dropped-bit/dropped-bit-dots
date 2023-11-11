if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

alias ls='exa --color=always --icons --long'
alias ll='exa --color=always --icons --long --all'
alias lt='exa --color=always --icons --long --all --tree --level=3'
alias nvconf="nvim $HOME/.config/nvim/"
alias python="python3"
# alias neofetch='neofetch --config ~/Builds/neofetch-themes/small/ozozfetch2.conf'
alias grep='grep --color=auto'
#git bare alias
alias config='/usr/bin/git --git-dir=$HOME/Builds/dropped-bit-dots/ --work-tree=$HOME'
set fish_greeting
