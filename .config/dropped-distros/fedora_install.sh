# SET UP SOME APPS IN SOFTWARE UI

via_software_store = [
	nvidia-drivers
	brave-browser
	tweaks
	extension-manager
	gradience
]

# In Extension Manager install
extension_amanger_apps = [
	user-themes
	dash-to-dock
	blur-my-shell
	windows-gestures
]

# Install Basic Apps

utils = [
	neovim
	g++
	npm
	python
	python-pip
	eza
	stow
	fish
	alacritty
	tldr
	unzip
	tmux
	make
	gcc
	ripgrep
	fastfetch
]

# lazygit
sudo dnf copr enable atim/lazygit -y
sudo dnf install lazygit

# Install Starhip
curl -sS https://starship.rs/install.sh | sh

# Install Yazi + Dependencies
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install --locked yazi-fm

yazi_dependencies = [
	file
	ffmpegthumbs
	unar
	jq
	poppler
	fd-find
	ripgrep
	fzf
	zoxide
]

theming = [
	adw-gtk3-theme
]
