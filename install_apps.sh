#!/bin/bash

#Directory Pre-Requisites
mkdir -p /home/pi/Applications
sudo mkdir -p /usr/local/var/log/opendv
sudo chown pi:pi /usr/local/var/log/opendv
sudo mkdir -p /usr/local/etc/opendv
sudo chown pi:pi /usr/local/etc/opendv
#Download and Install Arduino IDE
wget -O /home/pi/Downloads/arduino-1.6.9-linuxarm.tar.xz http://www.dmr-utah.net/support/mmdvm/arduino-1.6.9-linuxarm.tar.xz
tar xfv /home/pi/Downloads/arduino-1.6.9-linuxarm.tar.xz -C /home/pi/Applications/
/home/pi/Applications/arduino-1.6.9/install.sh
sudo mv /home/pi/.local/share/applications/arduino-arduinoide.desktop /usr/share/applications/arduino-arduinoide.desktop
sudo sed -i -e 's/Categories=Development;IDE;Electronics;/Categories=HamRadio/' /usr/share/applications/arduino-arduinoide.desktop
rm -Rf /home/pi/Desktop/arduino-arduinoide.desktop
rm -Rf /home/pi/.gnome/apps/arduino-arduinoide.desktop
rm -Rf /home/pi/Downloads/arduino-1.6.9-linuxarm.tar.xz
#Download Source Code
git clone https://github.com/g4klx/MMDVM.git /home/pi/Applications/MMDVM
git clone https://github.com/g4klx/MMDVMHost.git /home/pi/Applications/MMDVMHost
git clone https://github.com/g4klx/MMDVMCal.git /home/pi/Applications/MMDVMCal
#Install ircDDBGateway From DEB
#sudo apt-get -y install libwxbase2.8-0 libwxgtk2.8-0 gawk ntpdate libsigsegv2
wget -O /home/pi/Downloads/opendvdata_20151116-2_all.deb http://download.prgm.org/dl5di-soft/opendv/repositories/raspbian/opendvdata_20151116-2_all.deb
wget -O /home/pi/Downloads/ircddbgateway_20151116-2_armhf.deb http://download.prgm.org/dl5di-soft/opendv/repositories/raspbian/ircddbgateway_20151116-2_armhf.deb
sudo dpkg -i /home/pi/Downloads/opendvdata_20151116-2_all.deb
sudo dpkg -i /home/pi/Downloads/ircddbgateway_20151116-2_armhf.deb
rm -Rf /home/pi/Downloads/opendvdata_20151116-2_all.deb /home/pi/Downloads/ircddbgateway_20151116-2_armhf.deb
#Build ircDDBGateway From Source
# git clone https://github.com/dl5di/OpenDV.git /home/pi/Applications/OpenDV
# cd /home/pi/Applications/OpenDV/ircDDBGateway
# ./configure
# make
# sudo make install
