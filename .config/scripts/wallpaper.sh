#!/usr/bin/env bash
# Should be improved alot!

if [ $# -eq 0 ]; then
    echo "Script requires wallpaper path as arguement '.wallpaper.sh $HOME/.config/wallpapers/catppuccin/1.png'"
    exit 1
fi

wallpaper=$1

swww init

if [ -f $wallpaper ]
then
    echo "Wallpaper will now be set up"
    pkill waybar
    wal -i $wallpaper -s 
    swww img $wallpaper --transition-step 1 --transition-fps 60 --transition-type random
    cp $wallpaper $HOME/.cache/current_wallpaper.png
    waybar &>/dev/null & disown;
    echo "If you want to update grub image run 'sudo grub-mkconfig -o /boot/grub/grub.cfg'"
else
    echo "wallpaper is not available"
    echo "please install"
fi


