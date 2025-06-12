#!/usr/bin/env bash
set -euo pipefail

GREEN=$(tput setaf 2)
NONE=$(tput sgr0)

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

sudo pacman -S --needed figlet

echo -e "${GREEN}"
figlet "INSTALL ARCH BITCH"
echo -e "${NONE}"

sleep 3

source "$SCRIPT_DIR/arch-scripts/yay.sh"
# source "$SCRIPT_DIR/arch-scripts/graphics.sh"

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

copy_sys_files "$SCRIPT_DIR/sys-files/etc/issue" /etc/issue
copy_sys_files "$SCRIPT_DIR/sys-files/etc/vconsole.conf" /etc/vconsole.conf
copy_sys_files "$SCRIPT_DIR/sys-files/etc/locale.gen" /etc/locale.gen
copy_sys_files "$SCRIPT_DIR/sys-files/etc/locale.conf" /etc/locale.conf
copy_sys_files "$SCRIPT_DIR/sys-files/etc/systemd/timesyncd.conf" /etc/systemd/timesyncd.conf
copy_sys_files "$SCRIPT_DIR/sys-files/etc/systemd/system/kanata.service" /etc/systemd/system/kanata.service
# copy_sys_files "$SCRIPT_DIR/sys-files/etc/systemd/system/external_monitor.service" /etc/systemd/system/external_monitor.service
# copy_sys_files "$SCRIPT_DIR/sys-files/etc/udev/rules.d/99-monitor-hotplug.rules" /etc/udev/rules.d/99-monitor-hotplug.rules

base_packages=(
  jq socat intel-ucode man-db unzip ufw zsh eza yazi zoxide lazygit
  stow tmux zellij starship sof-firmware wireplumber pipewire pipewire-alsa
  pipewire-audio pipewire-jack pipewire-pulse pavucontrol openssh nodejs npm
  neovim fzf ripgrep fastfetch bat base-devel figlet flatpak libnotify
  ttf-jetbrains-mono ghostty terminus-font tlp noto-fonts nvidia
)

hypr=(
  hyprland hyprlock hypridle hyprpaper xdg-desktop-portal
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk cliphist grim
  slurp gvfs blueman bluez font-manager playerctl waybar rofi-wayland
  brightnessctl swaync
)

yay_hypr=(
  hyprshot
)

flatpaks=(
  io.github.zen_browser.zen
  md.obsidian.Obsidian
  com.github.tchx84.Flatseal
)

echo "==> Installing base packages..."
sudo pacman -S --needed "${base_packages[@]}"

echo "==> Installing Hyprland packages..."
sudo pacman -S --needed "${hypr[@]}"

echo "==> Installing AUR packages via yay..."
yay -S --needed --noconfirm --removemake --answerdiff None "${yay_hypr[@]}"

echo "==> Installing Flatpak apps..."
flatpak install -y flathub "${flatpaks[@]}"

sudo mkinitcpio -P

