#!/bin/bash

#Stop MMDVMHost
sudo pkill -f /home/pi/Applications/MMDVMHost
sudo pkill -f ircddbgateway
sudo pkill -f ircddbgatewayconfig
sudo pkill -f ircddbgw_conf
#Remove Old MMDVM.ini
rm -Rf /home/pi/MMDVM_*.ini
#Remove Script Logs
rm -Rf /home/pi/Logs/*
#Remove MMDVMHost Logs
rm -Rf /home/pi/Applications/MMDVMHost/MMDVM-*.log
#Make Sure Folders Exist and Have Correct Permissions for ircDDBGateway
#sudo mkdir -p /usr/local/var/log/opendv
#sudo chown pi:pi /usr/local/var/log/opendv
#sudo mkdir -p /usr/local/etc/opendv
#sudo chown pi:pi /usr/local/etc/opendv
#Remove ircDDBGateway Config and Logs
#rm -Rf /usr/local/var/log/opendv/*
#rm -Rf /usr/local/etc/opendv/*
rm -Rf /home/pi/*.log
#Clear Bash History
cat /dev/null > /home/pi/.bash_history
history -c
