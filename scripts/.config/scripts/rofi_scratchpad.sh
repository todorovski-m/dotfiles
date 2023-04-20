#!/bin/bash
dir="$HOME/.config/rofi/adi1090x/launchers/type-5"
theme="style-3w"

# https://www.reddit.com/r/i3wm/comments/t39tr7/selecting_i3_windows_from_scratchpad_with_rofi
i3-msg -t get_tree | \
jq '.nodes[] | .nodes[] | .nodes[] | select(.name=="__i3_scratch") | .floating_nodes[] | .nodes[] | .window,.name' | \
sed 's/\"//g' | \
paste -d' ' - - | \
rofi -dmenu -theme ${dir}/${theme}.rasi | \
cut -d' ' -f1 | \
xargs -I "PID" i3-msg "[id=PID] scratchpad show"
