Based on this repo: https://gitlab.com/eflinux/arch-basic
## Not FINISHED ##
# Best install tutorial but watch out for boot/efi path
https://www.youtube.com/watch?v=8T0vvf1xm58

## add initial and pacstrap stuff here

1. Get keys working and iwctl

```
loadkeys de-latin1
iwctl
station wlan connect0 [NAME OF STATION]
```

2. Formatting
   - Use fdisk
3. Mount
I think just mount the EFI partition to /boot. YOu might have issues with this so probably check and change on next install

## arch-chroot /mnt (do once chrooted)

```#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
## Do not know how this works but you need to uncomment the correct locale. sed -i '178s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=de_CH-latin1" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
echo root:password | chpasswd

# You can add xorg to the installation packages, I usually add it at the DE or WM install script
# You can remove the tlp package if you are installing on a desktop or vm

pacman -S sudo grub efibootmgr networkmanager mtools dosfstools base-devel linux-headers xdg-user-dirs xdg-utils bluez bluez-utils alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack openssh rsync reflector sof-firmware os-prober ntfs-3g terminus-font dconf-editor fish exa

# pacman -S --noconfirm xf86-video-amdgpu
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB #change the directory to /boot/efi is you mounted the EFI partition at /boot/efi

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable sshd
systemctl enable reflector.timer

useradd -m holmes
echo ermanno:password | chpasswd
usermod -aG wheel holmes

# Edit sudoers file
EDITOR=nvim visudo

printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"
```

## INSTALL GNOME
```
#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo reflector -c Germany -a 12 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Sy

# Install Yay AUR HELPER

sudo pacman -S --noconfirm gnome firefox
yay -S gdm-prime google-chrome-stable oreo-cursors-git

# sudo flatpak install -y spotify
# sudo flatpak install -y kdenlive

sudo systemctl enable gdm
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
sudo reboot
```


## GET NVIDIA TO WORK
https://forum.manjaro.org/t/howto-use-wayland-with-proprietary-nvidia-drivers/36130

Add to /etc/mkinitcpio.conf
MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)

Add to /etc/default/grub
GRUB_CMDLINE_LINUX="nvidia_drm.modeset=1"

This also describes how to add a hook to handle updates to driver to generate mkinitcpio automatically: https://bbs.archlinux.org/viewtopic.php?id=275184

For GNOME integration, install switcheroo-control and enable switcheroo-control.service.

GNOME will respect the PrefersNonDefaultGPU property in the desktop entry. Alternatively, you can launch applications with GPU by right clicking on the icon and choosing Launch using Discrete Graphics Card

if you are having trouble with gnome wayland, try runnign this and mREBOOTING
ln -s /dev/null /etc/udev/rules.d/61-gdm.rules

## Fix issue with super + num key with dash-to-dock
```
gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false
```

## Extensions
Forge - Tiling
https://extensions.gnome.org/extension/4481/forge/

Gradience - Colouring
https://github.com/GradienceTeam/Gradience
```yay -S gradience```

JustPerfection - tweaking for topbar
https://extensions.gnome.org/extension/3843/just-perfection/

Workspace Indicator
https://extensions.gnome.org/extension/3952/workspace-indicator/

Blur My Shell
https://extensions.gnome.org/extension/3193/blur-my-shell/

Touchpad Gestures for Wayland
https://extensions.gnome.org/extension/4245/gesture-improvements/

Hide Top Bar
https://extensions.gnome.org/extension/545/hide-top-bar/
Set Super+Y to shortcut

Add Rounded COrners:
https://extensions.gnome.org/extension/5237/rounded-window-corners/https://extensions.gnome.org/extension/5237/rounded-window-corners/

## Theming
- icons Tela Dark
- theme https://github.com/catppuccin/gtk (install via yay)
- gradience - using the preset for Catppuccin Mocha
- cursor Volantes Cursors - https://www.pling.com/p/1356095
- I like Fira Sans Regular for interface / document and monospace text https://fonts.google.com/specimen/Fira+Sans

## nvim + tmux
nvim Chad set up
https://www.youtube.com/watch?v=4BnVeOUeZxc&t=64s
!!! REMEMBER ON UBUNTU YOU MIGHT NEED TO INSTALL VENV FOR PYTHON ```sudo apt install python3.11-venv```

Tmux: https://www.youtube.com/watch?v=DzNmUNvnB04&t=231s
Install tmux
```sudo pacman -S tmux```

TPM:
```git clone https://github.com/tmux-plugins/tmp ~/.tmux/plugins/tpm```

## Force alacritty to use GTK
env -u WAYLAND_DISPLAY alacritty
Add above to shortcut and add to desktop file /usr/share/applications/Alacritty.desktop
```
[Desktop Entry]
Type=Application
TryExec=alacritty
Exec=alacritty
Icon=Alacritty
Terminal=false
Categories=System;TerminalEmulator;

Name=Alacritty
GenericName=Terminal
Comment=A fast, cross-platform, OpenGL terminal emulator
StartupWMClass=Alacritty
Actions=New;

[Desktop Action New]
Name=New Terminal
Exec=alacritty
```
