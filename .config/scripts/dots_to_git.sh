#!/bin/env bash

alias config='/usr/bin/git --git-dir=$HOME/Builds/dropped-bit-dots --work-tree=$HOME'

root_dir="$HOME/.config"

config_array=(
    "$root_dir/alacritty/*"
    "$root_dir/chrome-flags.conf"
    "$root_dir/fish/*"
    "$root_dir/holmes_iterm_profile.json"
    "$root_dir/hypr/*"
    "$root_dir/scripts/*"
    "$root_dir/wallpapers"
    )

for i in "${config_array[@]}"
do
    /usr/bin/git --git-dir=$HOME/Builds/dropped-bit-dots --work-tree=$HOME add $i
    # echo $i
done
