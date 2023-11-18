#!/bin/bash
#

# Base Install
pacstrap = 
{

}

# arch-chroot
arch = {
pamixer # volume controls
brightnessctl # backlight control
# Sounds
alsa
alsa-utils
sof-firmware
pulseaudio
pulseaudio-alsa
pulseaudio-bluetooth
pamixer
# bluetooth
blueman
}


# nvidia via pacman
nvidia = {
nvidia-dkms
}

# Pacman
apps = {
polkit-gnome
unzip
swayidle
network-manager-applet
tree
exa
nodejs
npm
openssh
python
python-pip
python-pywal
ripgrep
xorg-xwayland
btop
gnome-keyring # to support vscode https://wiki.archlinux.org/title/Visual_Studio_Code
}

# AUR
apps_aur {
hyprland-nvidia
waybar-hyprland
swww-git # wallpaper agent
swaylock-effects # swaylock but nice
wlogout
ttf-ms-fonts
envycontrol # setting graphics mode https://github.com/bayasdev/envycontrol
nwg-look # set gtk themes
}

## misc

# xremap https://github.com/k0kubun/xremap/tree/master
