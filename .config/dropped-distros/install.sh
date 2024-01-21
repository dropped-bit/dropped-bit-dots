# GRAPHIC DRIVERS
sudo pacman -S nvidia-dkms mesa intel-ucode nvidia-utils
yay -S envycontrol
yay -S libva-vdpau-driver-vp9-git # might help with chrome launches https://wiki.archlinux.org/title/chromium

# GENERAL PACAKGES PACMAN
pacman -S hyprland make btop alacritty eza fish starship font-manager gparted polkit-gnome gnome-keyring libsecret imagemagick wofi python-pip python-pywal grim slurp wl-clipboard cliphist mako libnotify network-manager-applet brightnessctl jq python3 fzf ripgrep nodejs npm unzip swayidle flatpak fastfetch

# THUNAR
pacman -S thunar-volman tumbler gvfs

# AUDIO
pacman -S pipewire wireplumber pipewire-alsa pipewire-pulse helvum pamixer

# BLUETOOTH
pacman -S bluez bluez-utils blueman

# PRINTER
pacman -S cups

# GENERAL PACKAGES YAY
yay -S waybar-hyprland swww-git swaylock-effects wlogout nwg-look adw-gtk3-git

# THEMING
pacman -S ttf-font-awesome ttf-hack-nerd ttf-fira-sans noto-fonts noto-fonts-emoji

pacman -S gnome-themes-extra
yay -S catppuccin-gtk-theme-mocha 

yay -S tela-circle-icon-theme-git volantes-cursors flat-remix-gtk

# ENABLE SERVICES

systemctl enable bluetooth
systemctl enable NetworkManager
systemctl enable cups
systemctl enable nvidia-suspend.service
systemctl enable nvidia-hibernate.service
systemctl enable nvidia-resume.service

# GRUB CONFIG
# https://wiki.hyprland.org/Nvidia/
# GRUB_CMDLINE_LINUX="nvidia_drm.modeset=1 nvidia.NVreg_PreserveVideoMemoryAllocations=1"

# LOW PRIORITY ITEMS

pacman -S loupe # gnome image viewer
# XREMAP: please read xremap.md

# DEVELOPMENT TOOLS
#
pacman -S tmux docker docker-compose mariadb

systemctl enable docker

# VMs
#
pacman -S libvirt qemu-full virt-manager dnsmasq

user -aG libvirt $USER

systemctl enable libvirtd
systemctl enable virtlogd

# enable network
sudo virsh net-start default
sudo virsc net-autostart default

