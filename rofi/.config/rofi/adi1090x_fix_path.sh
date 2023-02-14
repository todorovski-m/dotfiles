for f in $(find ./adi1090x -type f \( -iname \*.rasi -o -iname \*.sh -o -iname \*.bash \))
do
    sed -i 's!.config/rofi!.config/rofi/adi1090x!g' $f
done
