#!/bin/env bash

sudo pacman -S --needed figlet
echo -e "${GREEN}"
figlet "INSTALL ARCH BITCH"
echo -e "${NONE}"

sleep 3

source ./arch-scripts/yay.sh
# source ./arch-scripts/graphics.sh

# Function to copy system files
copy_sys_files() {
                local source="$1"
                local target="$2"
  
  if [ ! -f "$target" ]; then
    echo "$target not found, copying file now..."
    sudo cp "$source" "$target"
    sleep 1
  else
    echo "$target already exists, updating"
    sudo cp "$source" "$target"
    sleep 1
  fi
}

# Use function as required to copy system files
copy_sys_files ./sys-files/etc/issue /etc/issue
copy_sys_files ./sys-files/etc/vconsole.conf /etc/vconsole.conf
copy_sys_files ./sys-files/etc/locale.gen /etc/locale.gen
copy_sys_files ./sys-files/etc/locale.conf /etc/locale.conf
copy_sys_files ./sys-files/etc/systemd/timesyncd.conf /etc/systemd/timesyncd.conf
copy_sys_files ./sys-files/etc/systemd/system/kanata.service /etc/systemd/system/kanata.service
# copy_sys_files ./sys-files/etc/systemd/system/external_monitor.service /etc/systemd/system/external_monitor.service
# copy_sys_files ./sys-files/etc/udev/rules.d/99-monitor-hotplug.rules /etc/udev/rules.d/99-monitor-hotplug.rules

base_packages=(
    "jq"
    "socat"
    "intel-ucode"
    "man-db"
    "unzip"
    "ufw"
    "zsh"
    "eza"
    "yazi"
    "zoxide"
    "lazygit"
    "stow"
    "tmux"
    "zellij"
    "starship"
    "sof-firmware"
    "wireplumber"
    "pipewire"
    "pipewire-alsa"
    "pipewire-audio"
    "pipewire-jack"
    "pipewire-pulse"
    "pavucontrol"
    "openssh"
    "nodejs" # needed for nvim
    "npm" # needed for nvim
    "neovim"
    "fzf"
    "ripgrep"
    "fastfetch"
    "bat"
    "base-devel"
    "figlet" # app used for making larger letters out of ordinary text
    "flatpak"
    "libnotify" # required for notification daemon
    "ttf-jetbrains-mono" # kitty font
    "ghostty"
    "terminus-font"
    "tlp" # battery stuff
    "noto-fonts" # google fonts and emojis
    "nvidia"
    # "power-profiles-daemon" # conflicts wtih tlp
    )

hypr=(
  "hyprland"
  "hyprlock"
  "hypridle"
  "hyprpaper"
  "xdg-desktop-portal"
  "xdg-desktop-portal-hyprland"
  "xdg-desktop-portal-gtk" # for file chooser
  "cliphist" # clipboard manager
  "grim" # screenshots
  "slurp" # screenshots
  # "network-manager-applet"
  "gvfs"
  "blueman" # bluethtooth
  "bluez" # bluetooth
  # "polkit-gnome" # polkit
  "font-manager"
  "playerctl" # volume etc
  # "thunar" # file manager
  # "kitty" # terminal
  # "firefox" # browser
  "waybar" # bar
  "rofi-wayland"
  # "nwg-look" # set gtk themes
  # "libadwaita"
  "brightnessctl"
  "swaync" # notification center
  # "gnome-bluetooth-3.0" # for ags bar
  # "libgtop" # required for resource monitoring modules
  # "dart-sass" # compiler for sass/scss
)

yay_hypr=(
  "hyprshot"
  # "aylurs-gtk-shell"
  # "kanata" # keyboard modifier
  )

# Flatpaks
flatpaks=(
  "io.github.zen_browser.zen"
  "md.obsidian.Obsidian"
  "com.github.tchx84.Flatseal"
)

sudo pacman -S --needed "${base_packages[@]}"
sudo pacman -S --needed "${hypr[@]}"
yay -S --needed --noconfirm --removemake --answerdiff None "${yay_hypr[@]}"
flatpak install flathub "${flatpaks[@]}"
sudo mkinitcpio -P
