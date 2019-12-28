#!/bin/bash

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xrdb -merge ~/.Xresources
feh --bg-center ~/Pictures/mywallpaper.png

setxkbmap -option ctrl:nocaps
exec slstatus &
exec dwm


