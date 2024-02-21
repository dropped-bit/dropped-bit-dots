#!/usr/bin/env bash

DATE=$(date '+%F')
DISTRO=$(awk -F= '$1=="ID" { print $2 }' /etc/os-release | grep -v '^$')

rsync -avz --progress /home/holmes/ /run/media/holmes/HolmesSSD/Fedora\ Vault/"$DISTRO"_"$DATE"_1/
