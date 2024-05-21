#!/bin/env bash
#
# Read this article: htttps://linuxiac.com/nvidia-with-wayland-on-arch-setup-guide"
battery=(
	# "tlp"
	# "tlp-rdw"
	# "smartmontools"
	)
if [ ! -d $HOME/builds/auto-cpufreq ]; then
	git clone https://github.com/AdnanHodzic/auto-cpufreq.git $HOME/builds/auto-cpufreq
	cd $HOME/builds/auto-cpufreq && sudo ./auto-cpufreq-installer
else
	echo "auto-cpu exists already, skipping"
fi

battery_yay=(
	"envycontrol"
	)

# Update the system adn install the packages, --needed ensures that installed packages aren't reinstalled
sudo pacman -S --needed "${battery[@]}"
yay -S --needed "${battery_yay[@]}"

sleep 4

# sudo tlp start
# sudo systemctl enable tlp
echo "Installing dev packages (Terminal, Docker, CLIs, etc...)"
sleep 2
dev_packages=(
	"alacritty"
	"neovim"
	"npm"
	"python"
	"python-pip"
	"eza"
	"bat"
	"zoxide"
	"stow"
	"fish"
	"tmux"
	"make"
	"gcc"
	"ripgrep"
	"fastfetch"
	"btop"
	"cmake"
	"fzf"
	"sk" # fuzzy finder in rust
	"openssh"
	"docker"
	"docker-compose"
	"mariadb"
	"python"
	"python-devtools"
	"lazygit"
	"yazi"
	)

sudo pacman -S --needed "${dev_packages[@]}"

desktop_env=(
	"plasma"
	"firefox"
	"dolphin"
	"flatpak"
	)

sudo pacman -S --needed "${desktop_env[@]}"

desktop_env_yay=(
	"flatseal"
	)
yay -S --needed "${desktop_env_yay[@]}"
