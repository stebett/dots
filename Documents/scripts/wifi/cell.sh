#!/usr/bin/fish
echo (sudo ip link set wlp1s0 up)
echo (sudo /usr/bin/iw dev wlp1s0 connect -w FoxFi94)
echo (sudo dhcpcd wlp1s0)
