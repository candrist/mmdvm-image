#!/bin/bash

LOG_DIRECTORY="/home/pi/Logs"
LOG_FILE="$LOG_DIRECTORY/scripts_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping MMDVMHost ====="
notify-send 'RESETINI' 'Stopping MMDVMHost' --icon=dialog-information 
pkill -f /home/pi/Applications/MMDVMHost
sleep 2
echo "[RESETINI][$(date)] ===== Rebuilding MMDVM.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding MMDVM.ini from Repository' --icon=dialog-information 
mv /home/pi/MMDVM.ini /home/pi/MMDVM_$(date +'%F').ini
cp /home/pi/Applications/MMDVMHost/MMDVM.ini /home/pi/MMDVM.ini
sleep 2
echo "[RESETINI][$(date)] ===== MMDVM.ini Rebuilt Successful. Remember to Edit the MMDVM.ini ====="
notify-send 'RESETINI' 'MMDVM.ini Rebuilt Successful. Remember to Edit the MMDVM.ini' --icon=dialog-error --urgency=critical

sleep 20

exit
