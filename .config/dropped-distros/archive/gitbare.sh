#!/usr/bin/env bash

if [ -d $HOME/Builds ];
then
	mkdir -p $HOME/Builds
fi

alias config='/usr/bin/git --git-dir=$HOME/Builds/dropped-bit-dots --work-tree=$HOME'

echo "$HOME/Builds/dropped-bit-dots" >> $HOME/.gitignore

git clone --bare git@github.com:dropped-bit/dropped-bit-dots.git $HOME/Builds/dropped-bit-dots

echo "Please type 'config checkout' to install dotfiles"
