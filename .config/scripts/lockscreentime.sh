#!/usr/bin/env bash

echo "swayidle is running"
exec swayidle -w 150 'gtklock -i -d'\
         timeout 300 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' \
         before-sleep 'gtklock -i' \
         lock 'gtklock -i' \
	 timeout 120 'brightnessctl --save && brightnessctl s 5%' \
	 resume 'brightnessctl --restore'
#
# This will lock your screen after 60 seconds of inactivity, then turn off
# your displays after 600 seconds, and turn your screens back on when
# resumed. It will also lock your screen before your computer goes to sleep.
#
#TEST:
# exec swayidle -w timeout 10 'gtklock -i' \
#          timeout 20 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' \
#          before-sleep 'gtklock -i' \
#          lock 'gtklock -i' \
# 	 timeout 5 'brightnessctl --save && brightnessctl s 5%' \
# 	 resume 'brightnessctl --restore'
