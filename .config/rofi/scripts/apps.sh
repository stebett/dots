#!/bin/bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## browser : @adi1090x
## music : @adi1090x

rofi_command="rofi
-theme /home/ginko/.config/rofi/scripts/themes/apps.rasi
-location 3
-yoffset 56
-xoffset -13
-no-fullscreen"

# Links
terminal=""
files="ﱮ"
# editor=""
browser=""
# music=""
# settings="漣"

# Variable passed to rofi
options="$terminal\n$files\n$browser"

chosen="$(echo -e "$options" | $rofi_command -p "Most Used" -dmenu -selected-row 0)"
case $chosen in
    $terminal)
        kitty &
        ;;
    $files)
        nautilus &
        ;;
    # $editor)
    #     geany &
    #     ;;
    $browser)
        brave &
        ;;
    # $music)
    #     lxmusic &
    #     ;;
    # $settings)
    #     xfce4-settings-manager &
    #     ;;
esac

