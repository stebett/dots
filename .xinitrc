#!/bin/bash

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xsetroot -cursor_name left_ptr
~/./.fehbg
xrdb -merge ~/.Xresources
setxkbmap -option ctrl:swapcaps
xbindkeys --poll-rc
picom -b

exec bspwm


