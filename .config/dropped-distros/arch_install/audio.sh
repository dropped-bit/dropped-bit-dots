#!/bin/env bash
#
# Read this article: htttps://linuxiac.com/nvidia-with-wayland-on-arch-setup-guide"
audio=(
	"sof-firmware"
	"pipewire"
	"wireplumber"
	"pipewire-audio"
	"pipewire-alsa"
	"pipewire-pulse"
	"pipewire-jack"
	)

# Update the system adn install the packages, --needed ensures that installed packages aren't reinstalled
sudo pacman -S --needed "${audio[@]}"
