#!/usr/bin/env bash
gnome-schema org.gnome.desktop.interface

gsettings set $gnome-schema gtk-theme 'Your theme'
gsettings set $gnome-schema icon-theme 'Your icon theme'
gsettings set $gnome-schema cursor-theme "volantes"
gsettings set $gnome-schema font-name "Fira Sans Condensed 11"
gsettings set $gnome-schema color-scheme "prefer-dark"
