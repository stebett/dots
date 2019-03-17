#!/usr/bin/env python3


def rgb_to_hex(r, g, b):
    return '#%02x%02x%02x' % (r, g, b)


print("Hello, we're gonna change some color here!")
print("Ohh geez, why am I so nerd")
print("*-*-*-*-*-*-*-*-*-*-*\n")

# r_val = int(input("Red value [0-255]: "))
# g_val = int(input("Green value [0-255]: "))
# b_val = int(input("Blue value [0-255]: "))

# print("\033[48;2;%s;%s;%sm\033  " % (r_val, g_val, b_val))
for i in range(0, 255, 15):
    print("\033[48;2;%s;0;0m    \033" % i, end='')

# disegna il tuo schermo stilizzato?
