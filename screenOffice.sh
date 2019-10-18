#!/bin/sh

## This script refreshes the screens in my office to put turn the
## laptop off and fix the resolution size of my monitor

EXT="DP2"
IN="eDP1"

if (xrandr | grep "$EXT connected"); then
    xrandr --output $EXT --output $IN --off
    sed -i "$ c\ screen=$EXT" ~/.config/redshift.conf
    sed -i "s/temp-day=.*$/temp-day=5500" ~/.config/redshift.conf
    xrandr -r 75
    xrandr --size 1600x900
#elif (xrandr | grep "$TV connected"); then
#    xrandr --output $EXT --output $IN --off
#    sed -i "$ c\ screen=$TV" ~/.config/redshift.conf
#    sed -i "s/temp-day=.*$/temp-day=5500" ~/.config/redshift.conf
#    xrandr --size 1280x800
elif (xrandr | grep "HDMI2 connected.* 518mm x 324mm"); then
    xrandr --output "HDMI2" --output $IN --off
    sed -i "$ c\ screen=HDMI2" ~/.config/redshift.conf
    sed -i "s/temp-day=.*$/temp-day=5500" ~/.config/redshift.conf
    xrandr --size 1920x1200
elif (xrandr | grep "HDMI2 connected"); then
    xrandr --output "HDMI2" --output $IN --off
    sed -i "$ c\ screen=HDMI2" ~/.config/redshift.conf
    sed -i "s/temp-day=.*$/temp-day=5500" ~/.config/redshift.conf
    xrandr --size 1280x800
elif (xrandr | grep "$IN connected"); then
    xrandr --output $IN
    sed -i "$ c\ screen=0" ~/.config/redshift.conf
    sed -i "s/temp-day=.*$/temp-day=6200" ~/.config/redshift.conf
    xrandr --size 1902x1080
fi

# Set the wallpaper
feh --bg-max "$(find /home/luke/Pictures/wallpaper/ -iname '*.jpg' -o -iname '*.png' | shuf -n1)"
