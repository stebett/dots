#!/bin/bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

rofi_command="rofi -theme ~/.config/rofi/scripts/themes/network.rasi
-location 3
-yoffset 56
-xoffset -13
-no-fullscreen"

## Get info
IFACE='wlp3s0'
CONN=$(iw wlp3s0 link)
if [[ $CONN = *"Not connected"* ]];then
	STATUS='Disconnected'
    MSG="Offline"
    connected="睊"
else
	STATUS='Connected'
	connected="直"
	MSG="﬉ Online"
fi

## Icons
launch_cli=""
options="$connected\n$launch_cli"

## Main
chosen="$(echo -e "$options" | $rofi_command -p "$MSG" -dmenu -selected-row 1)"
case $chosen in
    $connected)
		if [[ $STATUS == *"Connected"* ]]; then
			sudo ~/Documents/scripts/wifi/./plane-mode
		else
			sudo ~/Documents/scripts/wifi/./scan_bash
		fi 
		;;
    $launch_cli)
        kitty -e nvim ~/Documents/scripts/wifi/scan_bash
        ;;
esac

