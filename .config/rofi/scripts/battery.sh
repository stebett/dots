#!/bin/bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

rofi_command="rofi -theme ~/.config/rofi/scripts/themes/battery.rasi
-location 3
-yoffset 56
-xoffset -13
-no-fullscreen"

## Get data

batteries="$(acpi | awk -F ' ' '{print $4}' | tr -d \,)"
battery1=$( echo $batteries | awk '{print$1}')
battery2=$( echo $batteries | awk '{print$2}')

charges="$(acpi | awk -F ' ' '{print $3}' | tr -d \,)"
charge1=$( echo $charges | awk '{print$1}')
charge2=$( echo $charges | awk '{print$2}')

active=""
urgent=""

if [[ $charge1 = *"Charging"* ]]; then
    active1="-a 1"
    ICON_CHRG1="$battery1 ﮣ"
elif [[ $charge1 = *"Unknown"* ]]; then
    active1="-a 1"
    ICON_CHRG1="$battery1  "
else
    urgent1="-u 1"
    ICON_CHRG1="$battery1 ﮤ"
fi

if [[ $charge2 = *"Charging"* ]]; then
    active2="-a 1"
    ICON_CHRG2="$battery2 ﮣ"
elif [[ $charge2 = *"Unknown"* ]]; then
    active2="-a 1"
    ICON_CHRG2="$battery2  "
else
    urgent2="-u 1"
    ICON_CHRG2="$battery2 ﮤ"
fi

if [[ $charge2 = *"Charging"* ]] || [[  $charge1 = *"Charging"* ]]; then
	MSG="Charging"
elif [[ $charge2 = *"Discharging"* ]] || [[  $charge1 = *"Discharging"* ]]; then
	MSG="Discharging"
else
	MSG="Full"
fi

# Discharging
#if [[ $CHARGE -eq 1 ]] && [[ $BATTERY -eq 100 ]]; then
#    ICON_DISCHRG=""
if [[ $BATTERY -ge 5 ]] && [[ $BATTERY -le 19 ]]; then
    ICON_DISCHRG=""
elif [[ $BATTERY -ge 20 ]] && [[ $BATTERY -le 39 ]]; then
    ICON_DISCHRG=""
elif [[ $BATTERY -ge 40 ]] && [[ $BATTERY -le 59 ]]; then
    ICON_DISCHRG=""
elif [[ $BATTERY -ge 60 ]] && [[ $BATTERY -le 79 ]]; then
    ICON_DISCHRG=""
elif [[ $BATTERY -ge 80 ]] && [[ $BATTERY -le 100 ]]; then
    ICON_DISCHRG=""
fi

## Icons

options="$ICON_CHRG2\n$ICON_CHRG1"
## Main
chosen="$(echo -e "$options" | $rofi_command -p "$MSG" -dmenu)"
case $chosen in
    $ICON_CHRG2)
        ;;
    $ICON_CHRG1)
        ;;
esac

