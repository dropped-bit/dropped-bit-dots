#!/usr/bin/env bash
# Should be improved alot!

wallpaper=~/.config/wallpapers/catppuccin/6.png

swww init

if [ -f $wallpaper ]
then
    echo "Wallpaper will now be set up"
    pkill waybar
    wal -i $wallpaper -s 
    swww img $wallpaper --transition-step 1 --transition-fps 60 --transition-type random
    cp $wallpaper $HOME/.cache/current_wallpaper.png
    waybar &>/dev/null & disown;
else
    echo "wallpaper is not available"
    echo "please install"
fi


