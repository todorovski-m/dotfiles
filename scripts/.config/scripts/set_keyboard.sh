# !/bin/bash
dir="$HOME/.config/rofi/adi1090x/launchers/type-5"
theme="style-3"

keyboard=$(echo -e "EN\nMK\nRU" | rofi -dmenu -theme ${dir}/${theme}.rasi -i)

case $keyboard in

    EN)
        xkb-switch -s "us"
    ;;

    MK)
        xkb-switch -s "mk"
    ;;

    RU)
        xkb-switch -s "ru(mkd)"
    ;;

esac
