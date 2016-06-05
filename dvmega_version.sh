#!/bin/bash
set -m
PORT="/dev/ttyAMA0"
stty -F ${PORT} ospeed 115200 ispeed 115200 -crtscts
#cat -v < $PORT &
dd if=${PORT} bs=1 count=17 status=none | sed -e "s/$/\n/" &
echo -ne '\xE0\x03\x00' > ${PORT}
sleep 0.1
exit 0
