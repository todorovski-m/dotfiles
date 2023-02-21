# !/bin/bash
# install xorg-xgamma
if [ $(hostname) = "dell3060" ]
then
    xrandr --output HDMI-1 --primary --mode 2560x1440 --pos 0x0
    #xrandr --output HDMI-1 --primary --mode 3840x2160 --pos 0x0
    xgamma -gamma 0.9
fi

if [ $(hostname) = "dell-3567" ]
then
    xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --output HDMI-1 --off
    xgamma -gamma 0.95
fi

if [ $(hostname) = "hp4740s" ]
then
    xrandr --output LVDS-1 --off --output HDMI-1 --primary --mode 1920x1200 --pos 0x0
    xgamma -gamma 1.00
fi


# https://wiki.archlinux.org/title/HiDPI
# If you are not using a desktop environment such as KDE, Xfce, or other that
# manipulates the X settings for you, you can set the desired DPI setting
# manually via the Xft.dpi variable in Xresources:

# ~/.Xresources

# Xft.dpi: 192

# These might also be useful depending on your monitor and personal preference:
# Xft.autohint: 0
# Xft.lcdfilter:  lcddefault
# Xft.hintstyle:  hintfull
# Xft.hinting: 1
# Xft.antialias: 1
# Xft.rgba: rgb

# For Xft.dpi, using integer multiples of 96 usually works best, e.g. 192 for 200% scaling.

# Make sure the settings are loaded properly when X starts, for instance in your
# ~/.xinitrc with xrdb -merge ~/.Xresources (see Xresources for more information).
