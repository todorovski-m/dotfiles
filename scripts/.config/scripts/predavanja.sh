# !/bin/bash
dir="$HOME/.config/rofi/adi1090x/launchers/type-5"
theme="style-3w"

head=/home/mirko/Dropbox/Mirko/
file_name=$(cat $HOME/Dropbox/Mirko/bookmarks | sed '/^#/d' | sed s!$head!! | rofi -dmenu -theme ${dir}/${theme}.rasi -i)

xdg-open "$head$file_name" > /dev/null 2>&1 & disown
