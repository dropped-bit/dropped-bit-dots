# ------------------------------------------------------
# Check if yay is installed
# ------------------------------------------------------
echo -e "${GREEN}"
figlet "yay"
echo -e "${NONE}"
if sudo pacman -Qs yay > /dev/null ; then
    echo ":: yay is already installed!"
else
    echo ":: yay is not installed. Starting the installation!"
    git clone https://aur.archlinux.org/yay-git.git $HOME/builds/yay-git
    cd $HOME/builds/yay-git
    makepkg -si
    echo ":: yay has been installed successfully."
fi
echo ""
