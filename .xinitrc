#!/bin/bash

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

systemctl --user import-environment DISPLAY # dunst
xrdb -merge ~/.Xresources
feh --bg-center ~/Pictures/redhouse.png
setxkbmap -option ctrl:swapcaps
xbindkeys --poll-rc

exec slstatus &
exec dunst &
exec dwm


