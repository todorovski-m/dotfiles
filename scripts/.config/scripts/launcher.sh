dir="$HOME/.config/rofi/adi1090x/launchers/type-5"
theme="style-3"

if [ -z "$1" ]
then
      mode="drun"
else
      mode=$1
fi
rofi \
    -modes "drun,run,window" \
    -show $mode \
    -theme ${dir}/${theme}.rasi
