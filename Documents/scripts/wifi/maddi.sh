#!/usr/bin/fish
echo (sudo /usr/bin/iw dev wlp1s0 connect -w FASTWEB-1-0021965C946C key 0:B7641B3331DC824D5791D7CB6A)
echo (sudo dhcpcd wlp1s0)

