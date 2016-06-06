#!/bin/bash

mkdir -p /home/pi/Applications

wget -O /home/pi/Downloads/arduino-1.6.9-linuxarm.tar.xz http://www.dmr-utah.net/support/mmdvm/arduino-1.6.9-linuxarm.tar.xz
tar /home/pi/Downloads/arduino-1.6.9-linuxarm.tar.xz -C /home/pi/Applications/

cd /home/pi/Applications/arduino-1.6.9
./install.sh

sudo mv /home/pi/.local/share/applications/arduino-arduinoide.desktop /usr/share/applications/arduino-arduinoide.desktop
rm -Rf /home/pi/Desktop/arduino-arduinoide.desktop
rm -Rf /home/pi/.gnome/apps/arduino-arduinoide.desktop
rm -Rf /home/pi/Downloads/arduino-1.6.9-linuxarm.tar.xz
