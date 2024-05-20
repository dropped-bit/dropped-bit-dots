#!/bin/env bash
#
# Read this article: htttps://linuxiac.com/nvidia-with-wayland-on-arch-setup-guide"
hyprland_packages=(
	"hyprland"
	"hypridle"
	"hyprlock"
	"hyprcursor"
	"xdg-desktop-portal-hyprland"
	"waybar"
	"qt6ct"
	"qt5ct"
	)

# Update the system adn install the packages, --needed ensures that installed packages aren't reinstalled
sudo pacman -S --needed "${hyprland_packages[@]}"
sleep 4
echo "Installing required yay packages"
sleep 4
sleep 4
hyprland_yay_packages=(
	"swww-git"
	"rofi-wayland"
	)

yay -S --needed "${hyprland_yay_packages[@]}"
