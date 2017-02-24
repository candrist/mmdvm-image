#!/bin/bash

#Install Required Software
apt-get -y install build-essential oracle-java8-jdk mousepad mlocate screen libnotify-bin

# VNC Mods
bash -c 'echo " " >> /boot/config.txt'
bash -c 'echo "# Change VNC Resolution" >> /boot/config.txt'
bash -c 'echo "hdmi_force_hotplug=1" >> /boot/config.txt'
bash -c 'echo "hdmi_ignore_edid=0xa5000080" >> /boot/config.txt'
bash -c 'echo "hdmi_group=2" >> /boot/config.txt'
bash -c 'echo "hdmi_mode=16" >> /boot/config.txt'

# DV-Mega Mods
systemctl stop serial-getty@ttyAMA0.service
systemctl disable serial-getty@ttyAMA0.service
systemctl stop hciuart
systemctl disable hciuart
sed -i -e 's/console=serial0,115200 console=tty1/console=tty1/' /boot/cmdline.txt
sed -i -e 's/enable_uart=0/enable_uart=1/' /boot/config.txt
bash -c 'echo " " >> /boot/config.txt'
bash -c 'echo "# Disable Bluetooth on Raspberry Pi 3" >> /boot/config.txt'
bash -c 'echo "dtoverlay=pi3-disable-bt" >> /boot/config.txt'

#Create Ham Radio Menu Directory
cat > /usr/share/raspi-ui-overrides/desktop-directories/lxde-amateur-radio.directory  << EOL
[Desktop Entry]
Name=Amateur Radio
Comment=Amateur Radio Appiications
Icon=
Type=Directory
EOL
