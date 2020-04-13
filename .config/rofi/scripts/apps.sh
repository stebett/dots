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

kb_now=$(setxkbmap -print -verbose 10 | grep layout)

if [[ $kb_now == *us* ]]; then
	kb_now=us
	kb_new=it
else
	kb_now=it
	kb_new=us
fi

terminal=""
files="ﱮ"
keyboard=""
browser=""
# music=""
# settings="漣"

# Variable passed to rofi
options="$terminal\n$files\n$browser\n$keyboard"

chosen="$(echo -e "$options" | $rofi_command -p "Most Used" -dmenu -selected-row 0)"
case $chosen in
    $terminal)
        kitty &
        ;;
    $files)
        nautilus &
        ;;
    $keyboard)
        setxkbmap $kb_new; setxkbmap -option ctrl:swapcaps
		;;
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

