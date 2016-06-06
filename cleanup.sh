#!/bin/bash

pkill -f /home/pi/Applications/MMDVMHost
rm -Rf /home/pi/MMDVM_*.ini
rm -Rf /home/pi/Logs/*
rm -Rf /home/pi/Applications/MMDVMHost/MMDVM-*.log
rm -Rf /usr/local/var/log/opendv/*
cat /dev/null > /home/pi/.bash_history
history -c
