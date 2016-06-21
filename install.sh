#!/bin/bash

#Update, Upgrade and Install Required Software
apt-get update
apt-get -y dist-upgrade
apt-get -y install xserver-xorg xinit
apt-get -y install xfce4 xfce4-goodies
apt-get -y install lightdm wpagui
apt-get -y install software-properties-common python-software-properties build-essential debian-keyring oracle-java8-jdk mousepad iceweasel rc-gui mlocate synaptic screen xrdp piclone
#Older ircircDDBGateway
apt-get -y install libwxbase2.8-0 libwxgtk2.8-0 gawk ntpdate libsigsegv2
#Newer ircDDBGateway
# apt-get -y install libwxgtk3.0-dev portaudio19-dev libusb-1.0-0-dev chkconfig python-serial wiringPi / 
apt-get -y remove xscreensaver xscreensaver-data xfburn
apt-get -y autoremove
apt-get -y autoclean

#Create PolicyKit File - This Allows You to Shutdown and Restart the Pi from XFCE
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

#Create Ham Radio Menu Directory
cat > /usr/share/desktop-directories/ham-radio.directory  << EOL
[Desktop Entry]
Version=1.0
Type=Ham Radio
Icon=
Name=Ham Radio
Comment=Ham Radio Tools
EOL

#Enables Tab Autocomplete Inside Remote Desktop
cp /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml.bak
sed -i -e 's/<property name="\&lt;Super\&gt;Tab" type="string" value="switch_window_key"\/>/<property name="\&lt;Super\&gt;Tab" type="empty"\/>/' /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
#Enable wpa_gui to Make Changes to wpa_supplicant.conf
sed -i -e 's/Exec=\/usr\/sbin\/wpa_gui/Exec=sudo \/usr\/sbin\/wpa_gui/' /usr/share/applications/wpa_gui.desktop
#Enables Raspberry Pi Config App in XFCE
sed -i '/NotShowIn=/d' /usr/share/applications/rc_gui.desktop
#Enables Synaptics Package Manager to Run
sed -i -e 's/Exec=synaptic-pkexec/Exec=sudo synaptic-pkexec/' /usr/share/applications/synaptic.desktop
#Enables Raspberry Pi Clone App in XFCE
sed -i '/NotShowIn=/d' /usr/share/applications/piclone.desktop
#Copies Custom Background to Correct Folder
cp /home/pi/Scripts/xfce-blue-utah.jpg /usr/share/backgrounds/xfce/xfce-blue-utah.jpg
#Change lightdm Background to Custom Background
sed -i -e 's/background=\/usr\/share\/images\/desktop-base\/login-background.svg/background=\/usr\/share\/backgrounds\/xfce\/xfce-blue-utah.jpg/' /etc/lightdm/lightdm-gtk-greeter.conf

# DV-Mega Mods
systemctl stop serial-getty@ttyAMA0.service
systemctl disable serial-getty@ttyAMA0.service
systemctl stop hciuart
systemctl disable hciuart
sed -i -e 's/enable_uart=0/enable_uart=1/' /boot/config.txt
bash -c 'echo " " >> /boot/config.txt'
bash -c 'echo "# Disable Bluetooth on Raspberry Pi 3" >> /boot/config.txt'
bash -c 'echo "dtoverlay=pi3-disable-bt" >> /boot/config.txt'
