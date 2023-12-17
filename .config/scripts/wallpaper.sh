#!/usr/bin/env bash
# Should be improved alot!

wallpaper=~/.config/wallpapers/Bodacious_bovine_by_oklopfer_dark.png

if [ -f $wallpaper ]
then
    echo "Wallpaper will now be set up"
    wal -i $wallpaper -b "#23272E" 
    swww img $wallpaper --transition-step 1 --transition-fps 60 --transition-type random
    cp $wallpaper $HOME/.cache/current_wallpaper.png
    killall -SIGUSR2 waybar
else
    echo "wallpaper is not available"
    echo "please install"
fi


