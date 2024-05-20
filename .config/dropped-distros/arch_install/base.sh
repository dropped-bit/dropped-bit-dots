#!/bin/env bash
#
base_packages=(
	"intel-ucode"
	"man-db"
	"unzip"
	"ufw"
	)

# Update the system adn install the packages, --needed ensures that installed packages aren't reinstalled
sudo pacman -S --needed "${intel-ucode[@]}"
