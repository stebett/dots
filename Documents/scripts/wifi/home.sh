#!/usr/bin/fish
echo (sudo wpa_supplicant -B -i wlp1s0 -c /etc/wpa_supplicant/eolo.conf)
echo (sudo dhcpcd wlp1s0)
