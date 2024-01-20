#!/usr/bin/env bash

# wofi_style="$HOME/.config/wofi/themes/mocha.css"
pkill wofi
wofi --show drun --allow-images --normal-window --style $wofi_style
# wofi --show drun --allow-images --style $wofi_style
