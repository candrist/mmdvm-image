#!/bin/bash

LOG_DIRECTORY="/home/pi/Logs"
LOG_FILE="$LOG_DIRECTORY/scripts_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1


cd /home/pi/Applications/MMDVM
git fetch

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
	echo "[UPDATE][$(date)] MMDVM is Up-to-Date"
	notify-send 'UPDATE' 'MMDVM is Up-to-Date' --icon=dialog-information --urgency=critical
elif [ $LOCAL = $BASE ]; then
	echo "[UPDATE][$(date)] ===== Updating MMDVM From Repository ====="
	notify-send 'UPDATE' 'Updating MMDVM From Repository' --icon=dialog-information 
	git pull
	echo "[UPDATE][$(date)] !!!!! Make Sure You Run The Arudino IDE to Update Your DUE !!!!!"
	notify-send 'UPDATE' 'Run The Ardunio IDE to Update Your Due' --icon=dialog-error --urgency=critical
else
	echo "[UPDATE][$(date)] !!!!! Error with MMDVM Update !!!!!"
	notify-send 'UPDATE' 'Error with MMDVM Update!' --icon=dialog-error --urgency=critical

fi

sleep 3

cd /home/pi/Applications/MMDVMHost
git fetch

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
	echo "[UPDATE][$(date)] MMDVMHost is Up-to-Date"
	notify-send 'UPDATE' 'MMDVMHost is Up-to-Date' --icon=dialog-information --urgency=critical
elif [ $LOCAL = $BASE ]; then
	echo "[UPDATE][$(date)] ===== Stopping MMDVMHost ====="
	notify-send 'UPDATEt' 'Stopping MMDVMHost' --icon=dialog-information 
	pkill -f /home/pi/Applications/MMDVMHost
	sleep 2
	echo "[UPDATE][$(date)] ===== Updating MMDVMHost from Repository ====="
	notify-send 'UPDATE' 'Updating MMDVMHost from Repository' --icon=dialog-information 
	git pull
	make clean
	make
	sleep 2
	echo "[UPDATE][$(date)] ===== MMDVMHost Update Successful ====="
	notify-send 'UPDATE' 'MMDVMHost Update Successful' --icon=dialog-information --urgency=critical
else
	echo "[UPDATE][$(date)] !!!!! Error with MMDVMHost Update !!!!!"
	notify-send 'UPDATE' 'Error with MMDVMHost Update!' --icon=dialog-error --urgency=critical
fi

sleep 3

cd /home/pi/Applications/MMDVMCal
git fetch

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
	echo "[UPDATE][$(date)] MMDVMCal is Up-to-Date"
	notify-send 'UPDATE' 'MMDVMCal is Up-to-Date' --icon=dialog-information --urgency=critical
elif [ $LOCAL = $BASE ]; then
	echo "[UPDATE][$(date)] ===== Updating MMDVMCal from Repository ====="
	notify-send 'UPDATE' 'Updating MMDVMCal from Repository' --icon=dialog-information 
	git pull
	make clean
	make
	echo "[UPDATE][$(date)] ===== MMDVMCal Update Successful ====="
	notify-send 'UPDATE' 'MMDVMCal Update Successful' --icon=dialog-information --urgency=critical
else
	echo "[UPDATE][$(date)] !!!!! Error with MMDVMCal Update !!!!!"
	notify-send 'UPDATE' 'Error with MMDVMCal Update!' --icon=dialog-error --urgency=critical
fi

sleep 20

exit
