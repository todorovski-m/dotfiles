#!/bin/bash

# https://github.com/LukeSmithxyz/voidrice/blob/master/.local/bin/dmenuunicode
# Get user selection via dmenu from greek.txt file.
chosen=$(cut -d ';' -f1 ~/.config/greek/greek.txt | dmenu -i -l 10 -fn 'Menlo:bold:pixelsize=20' | sed "s/ .*//")

# Exit if none chosen.
[ -z "$chosen" ] && exit

printf "$chosen" | xclip -selection clipboard
