#!/bin/bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

rofi_command="rofi -theme themes/quicklinks.rasi
-location 3
-yoffset 56
-xoffset -13
-no-fullscreen"

# Links
google=""
facebook=""
twitter=""
github=""
reddit=""
youtube=""

# Variable passed to rofi
options="$google\n$facebook\n$twitter\n$github\n$reddit\n$youtube"

chosen="$(echo -e "$options" | $rofi_command -p "Open In  :  Brave" -dmenu -selected-row 0)"
case $chosen in
    $google)
        brave --new-tab https://www.google.com
        ;;
    $facebook)
        brave --new-tab https://www.facebook.com
        ;;
    $twitter)
        brave --new-tab https://www.twitter.com
        ;;
    $github)
        brave --new-tab https://www.github.com
        ;;
    $reddit)
        brave --new-tab https://www.reddit.com
        ;;
    $youtube)
        brave --new-tab https://www.youtube.com
        ;;
esac

