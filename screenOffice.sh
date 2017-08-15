#!/bin/sh

## This script refreshes the screens in my office to put turn the
## laptop off and fix the resolution size of my monitor

EXT="DP2"
IN="eDP1"

if (xrandr | grep "$EXT connected"); then
    xrandr --output $EXT --size 1600x900 --output $IN --off && xrandr -r 75
    sed -i "$ c\ screen=$EXT" ~/.config/redshift.conf
    sed -i "s/temp-day=.*$/temp-day=5500" ~/.config/redshift.conf
elif (xrandr | grep "$IN connected"); then
    xrandr --output $IN --size 1600x900
    sed -i "$ c\ screen=0" ~/.config/redshift.conf
    sed -i "s/temp-day=.*$/temp-day=6200" ~/.config/redshift.conf
fi

# Set the wallpaper
feh --bg-max "$(find /home/luke/Pictures/wallpaper/ -iname '*.jpg' -o -iname '*.png' | shuf -n1)"
