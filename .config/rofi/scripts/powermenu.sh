#!/bin/bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

rofi_command="rofi 
-theme ~/.config/rofi/scripts/themes/powermenu.rasi
-xoffset 12
-yoffset 56
-location 1
-no-fullscreen
"
uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown="襤"
reboot="ﰇ"
suspend="鈴"

# Variable passed to rofi
options="$shutdown\n$reboot\n$suspend"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $suspend)
        systemctl suspend
        ;;
esac

