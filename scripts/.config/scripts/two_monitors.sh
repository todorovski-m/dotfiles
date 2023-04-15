#!/bin/bash
if [ $(hostname) = "dell-3567" ]
then
    xrandr --output HDMI-1 --auto --right-of eDP-1
    xgamma -gamma 0.95
    i3-msg "workspace 8, move workspace to output HDMI-1"
    i3-msg "workspace 9, move workspace to output HDMI-1"
    i3-msg "workspace 10, move workspace to output HDMI-1"
    i3-msg "workspace 1"
    bg=$(cat ~/.fehbg | awk -F "'" '{ print $2 }')
    feh --bg-fill $bg $bg
fi
