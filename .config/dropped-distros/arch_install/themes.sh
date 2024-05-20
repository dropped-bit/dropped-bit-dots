#!/bin/env bash

theme=(
	"ttf-jetbrains-mono-nerd"
	# "tlp-rdw"
	# "smartmontools"
	)
theme_yay=(
	)

# Update the system adn install the packages, --needed ensures that installed packages aren't reinstalled
sudo pacman -S --needed "${theme[@]}"
# yay -S --needed "${theme_yay[@]}"

sleep 4

