#!/bin/bash

# Directory Pre-Requisites
mkdir -p /home/pi/Applications
# Download and Install Arduino IDE
wget -O /home/pi/Downloads/arduino-1.6.12-linuxarm.tar.xz https://downloads.arduino.cc/arduino-1.6.12-linuxarm.tar.xz
tar xfv /home/pi/Downloads/arduino-1.6.12-linuxarm.tar.xz -C /home/pi/Applications/
/home/pi/Applications/arduino-1.6.12/install.sh
sudo mv /home/pi/.local/share/applications/arduino-arduinoide.desktop /usr/share/raspi-ui-overrides/applications/arduino-arduinoide.desktop
sudo sed -i -e 's:Categories=Development;IDE;Electronics;:Categories=AmateurRadio:' /usr/share/raspi-ui-overrides/applications/arduino-arduinoide.desktop
rm -Rf /home/pi/Desktop/arduino-arduinoide.desktop
rm -Rf /home/pi/.gnome/apps/arduino-arduinoide.desktop
rm -Rf /home/pi/Downloads/arduino-1.6.12-linuxarm.tar.xz
# Download Source Code
git clone https://github.com/g4klx/MMDVM.git /home/pi/Applications/MMDVM
git clone https://github.com/g4klx/MMDVMHost.git /home/pi/Applications/MMDVMHost
git clone https://github.com/g4klx/MMDVMCal.git /home/pi/Applications/MMDVMCal
# Add Bash Shortcut
bash -c 'echo " " >> ~/.bash_profile'
bash -c 'echo "# Shortcuts" >> ~/.bash_profile'
bash -c 'echo "alias smm=\"/home/pi/Applications/MMDVMHost/MMDVMHost /home/pi/MMDVM.ini\"" >> ~/.bash_profile'
