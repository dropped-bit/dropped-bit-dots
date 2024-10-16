#!/bin/env bash

#CHECK IF EXTERNAL MONITOR IS PLUGGED IN
EXTERNAL_MONITOR=$(hyprctl monitors | grep "Monitor" | grep -v "eDP-1")
WORKSPACES=("1", "2", "3", "4", "5", "6")

if [[ -n $EXTERNAL_MONITOR ]]; then
	hyprctl dispatch dpms toggle eDP-1
else
    hyprlock
fi
