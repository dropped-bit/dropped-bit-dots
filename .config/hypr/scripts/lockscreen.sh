#!/bin/env bash

# swaylock -C $HOME/.config/swaylock/config

#CHECK IF EXTERNAL MONITOR IS PLUGGED IN
EXTERNAL_MONITOR=$(hyprctl monitors | grep "Monitor" | grep -v "eDP-1")

if [[ -n $EXTERNAL_MONITOR ]]; then
    echo "External Monitor is connected"
    hyprctl dispatch dpms toggle eDP-1  
    hyprctl dispatch moveworkspacetomonitor 5 DP-4
else
    hyprlock
fi
