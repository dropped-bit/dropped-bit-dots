#!/usr/bin/env bash

echo "swayidle is running"
exec swayidle -w timeout 300 'swaylock -f' \
         timeout 420 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' \
         before-sleep 'swaylock -f' \
         lock 'swaylock -f --grace 0' \
	 timeout 120 'brightnessctl --save && brightnessctl s 5%' \
	 resume 'brightnessctl --restore'
#
# This will lock your screen after 60 seconds of inactivity, then turn off
# your displays after 600 seconds, and turn your screens back on when
# resumed. It will also lock your screen before your computer goes to sleep.

