#!/bin/sh

## This script refreshes the screens in my office to put turn the
## laptop off and fix the resolution size of my monitor

EXT="DP2"
IN="eDP1"

if (xrandr | grep "$EXT connected"); then
    xrandr --output $EXT --auto --output $IN --off && xrandr -r 75
    sed -i "$ c\ screen=$EXT" ~/.config/redshift.conf
else
    xrandr --output $IN --auto
    sed -i "$ c\ screen=0" ~/.config/redshift.conf
fi

# Set the wallpaper
feh --bg-max "$(find /home/luke/Pictures/wallpaper/ -iname '*.jpg' -o -iname '*.png' | shuf -n1)"
