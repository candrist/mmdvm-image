#!/bin/bash

sudo apt-get update /
&& sudo apt-get -y dist-upgrade /
&& sudo apt-get -y install xserver-xorg xinit /
&& sudo apt-get -y install xfce4 xfce4-goodies / 
&& sudo apt-get -y install lightdm wpagui /
&& sudo apt-get -y install software-properties-common python-software-properties build-essential debian-keyring oracle-java8-jdk mousepad iceweasel rc-gui git mlocate synaptic screen xrdp piclone geany libwxgtk3.0-dev portaudio19-dev libusb-1.0-0-dev chkconfig python-serial wiringPi / 
&& sudo apt-get -y remove xscreensaver xscreensaver-data xfburn / 
&& sudo apt-get -y autoremove /
&& sudo apt-get -y autoclean


sudo su
cat > /etc/polkit-1/localauthority/50-local.d/org.freedesktop.pkla << EOL
[freedesktop]
Identity=unix-user:*
Action=org.freedesktop.*
ResultAny=yes

[reboot]
Identity=unix-user:*
Action=org.freedesktop.login1.reboot
ResultAny=yes

[power-off]
Identity=unix-user:*
Action=org.freedesktop.login1.power-off
ResultAny=yes

[nm-applet]
Identity=unix-user:*
Action=org.freedesktop.NetworkManager.*
ResultAny=yes
EOL

cat > /usr/share/desktop-directories/ham-radio.directory  << EOL
[Desktop Entry]
Version=1.0
Type=Ham Radio
Icon=
Name=Ham Radio
Comment=Ham Radio Tools
EOL

exit

sudo cp /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml.bak

sudo sed -i -e 's/<property name="\&lt;Super\&gt;Tab" type="string" value="switch_window_key"\/>/<property name="\&lt;Super\&gt;Tab" type="empty"\/>/' /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml

sudo sed -i -e 's/Exec=\/usr\/sbin\/wpa_gui/Exec=sudo \/usr\/sbin\/wpa_gui/' /usr/share/applications/wpa_gui.desktop

sudo cp /usr/share/applications/wpa_gui.desktop /home/pi/Desktop/wpa_gui.desktop

sudo sed -i '/NotShowIn=/d' /usr/share/applications/rc_gui.desktop

sudo sed -i -e 's/Exec=synaptic-pkexec/Exec=sudo synaptic-pkexec/' /usr/share/applications/synaptic.desktop

sudo sed -i '/NotShowIn=/d' /usr/share/applications/piclone.desktop

sudo cp /home/pi/Scripts/xfce-blue-utah.jpg /usr/share/backgrounds/xfce/xfce-blue-utah.jpg

sudo sed -i -e 's/background=\/usr\/share\/images\/desktop-base\/login-background.svg/background=\/usr\/share\/backgrounds\/xfce\/xfce-blue-utah.jpg/' /etc/lightdm/lightdm-gtk-greeter.conf

# DV-Mega Mods
sudo systemctl stop serial-getty@ttyAMA0.service
sudo systemctl disable serial-getty@ttyAMA0.service

sudo bash -c 'echo " " >> /boot/config.txt'
sudo bash -c 'echo "# Disable Bluetooth on Raspberry Pi 3" >> /boot/config.txt'
sudo bash -c 'echo "dtoverlay=pi3-disable-bt" >> /boot/config.txt'
