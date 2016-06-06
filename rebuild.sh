#!/bin/bash

LOG_DIRECTORY="/home/pi/Logs"
LOG_FILE="$LOG_DIRECTORY/scripts_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[REBUILD][$(date)] ===== Rebuilding MMDVM from Repository ====="
notify-send 'REBUILD' 'Rebuilding MMDVMCal from Repository' --icon=dialog-information 
cd /home/pi/Applications/MMDVM
git fetch --all
git reset --hard origin/master
echo "[REBUILD][$(date)] !!!!! Make Sure You Run The Arudino IDE to Update Your DUE !!!!!"
notify-send 'REBUILD' 'Run The Ardunio IDE to Update Your Due' --icon=dialog-error --urgency=critical


echo "[REBUILD][$(date)] ===== Stopping MMDVMHost ====="
notify-send 'REBUILD' 'Stopping MMDVMHost' --icon=dialog-information 
pkill -f /home/pi/Applications/MMDVMHost
sleep 2
echo "[REBUILD][$(date)] ===== Rebuilding MMDVMHost from Repository ====="
notify-send 'REBUILD' 'Rebuilding MMDVMHost from Repository' --icon=dialog-information 
cd /home/pi/Applications/MMDVMHost
git fetch --all
git reset --hard origin/master
make clean
make
sleep 2
echo "[REBUILD][$(date)] ===== MMDVMHost Rebuilt Successfully ====="
notify-send 'REBUILD' 'MMDVMHost Rebuilt Successfully' --icon=dialog-information --urgency=critical


echo "[REBUILD][$(date)] ===== Rebuilding MMDVMCal from Repository ====="
notify-send 'REBUILD' 'Rebuilding MMDVMCal from Repository' --icon=dialog-information 
cd /home/pi/Applications/MMDVMCal
git fetch --all
git reset --hard origin/master
make clean
make
echo "[REBUILD][$(date)] ===== MMDVMCal Rebuilt Successfully ====="
notify-send 'REBUILD' 'MMDVMCal Rebuilt Successfully' --icon=dialog-information --urgency=critical


sleep 20

exit
