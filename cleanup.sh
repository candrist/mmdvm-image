#!/bin/bash

# Stop MMDVMHost
sudo pkill -f /home/pi/Applications/MMDVMHost
# Remove Old MMDVM.ini
rm -Rf /home/pi/MMDVM_*.ini
# Remove Script Logs
rm -Rf /home/pi/Logs/*
# Remove MMDVMHost Logs
rm -Rf /home/pi/Applications/MMDVMHost/MMDVM-*.log
# Remove Old DMRIds.dat files
#rm -Rf /home/pi/Applications/MMDVMHost/DMRIds.dat
rm -Rf /home/pi/Applications/MMDVMHost/DMRIds.dat.*
# Clear Bash History
cat /dev/null > /home/pi/.bash_history
history -c
