# SET UP SOME APPS IN SOFTWARE UI

via_software_store=(
	"nvidia-drivers"
	"brave-browser"
	"tweaks"
	"extension-manager"
	"gradience"
)

# In Extension Manager install
extension_amanger_apps=(
	"user-themes"
	"dash-to-dock"
	"blur-my-shell"
	"windows-gestures"
)

# Install Basic Apps

utils=(
	"neovim"
	"g++"
	"npm"
	"python"
	"python-pip"
	"eza"
    "bat"
    "zoxide"
	"stow"
	"fish"
	"alacritty"
	"tldr"
	"unzip"
	"tmux"
	"make"
	"gcc"
	"ripgrep"
	"fastfetch"
    "btop"
    "cmake"
)

battery=(
    "tlp" # https://www.youtube.com/watch?v=GDdGK8Z_qzs&t=248s
    "tlp-rdw"
    "smartmontools"
    "libva-utils"
    )

# lazygit
sudo dnf copr enable atim/lazygit -y
sudo dnf install lazygit

# Install Starhip
curl -sS https://starship.rs/install.sh | sh

# Install Yazi + Dependencies
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install --locked yazi-fm

yazi_dependencies=(
	"file"
	"ffmpegthumbs"
	"unar"
	"jq"
	"poppler"
	"fd-find"
	"ripgrep"
	"fzf"
	"zoxide"
)

theming=(
	"adw-gtk3-theme"
)

# USE THIS INSTEAD: https://copr.fedorainfracloud.org/coprs/solopasha/hyprland
hyprland=(
    "hyprland"
    "waybar"
    "brightnessctl"
    "network-manager-applet"
    "swayidle"
    "lz4" # swww dependency
    "blueman"
    "pamixer"
    "mako"
    )

# Build from source stuff for hyprland

## SWWW - https://github.com/LGFae/swww
git clone https://github.com/LGFae/swww.git $HOME/Builds/swww

# xremap
git clone https://github.com/k0kubun/xremap.git $HOME/Builds/xremap
cargo install xremap --features wlroots

# gtklock
# Ready the wiki on the gitpage to know how to make sure it works with auth and fingerprint
dnf install gcc meson pkgconf scdoc pam-devel wayland-devel gtk3-devel gtk-layer-shell-devel
git clone https://github.com/jovanlanik/gtklock

# Dev
# You need to install docker using instructions: https://developer.fedoraproject.org/tools/docker/docker-installation.html
dev=(
    "dnf-plugins-core"
    "docker-ce"
    "docker-ce-cli"
    "containerd.io"
    "docker-compose"
    )

# This helps to make sure mysqlclient via pip install works
python_dev_django=(
    "python-devel"
    "mysql-devel"
    )
