#!/usr/bin/env bash

DATE=$(date '+%F')
DISTRO=$(awk -F= '$1=="ID" { print $2 }' /etc/os-release | grep -v '^$')

DESTINATION="/run/media/holmes/Ventoy/BackUp/fedora_240629"
# rsync -avjz --progress /home/holmes/ /run/media/holmes/HolmesSSD/Fedora\ Vault/"$DISTRO"_"$DATE"_1/
rsync -avz --progress $HOME/.config $DESTINATION
rsync -avz --progress $HOME/Projects $DESTINATION

rsync -avz --progress $HOME/dropped-bit-dots $DESTINATION
rsync -avz --progress $HOME/.ssh $DESTINATION
rsync -avz --progress $HOME/.gitconfig $DESTINATION
rsync -avz --progress $HOME/.zsh_history $DESTINATION

