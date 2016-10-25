#!/bin/bash

#Create Shortcuts in Ham Radio Menu
cat > /usr/share/applications/mmdvm-edit_mmdvmini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit MMDVM.ini
GenericName=Edit MMDVM.ini
Exec=mousepad /home/pi/MMDVM.ini
Icon=
Terminal=false
Categories=AmateurRadio;
EOL

cat > /usr/share/applications/mmdvm-mmdvmcal.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVM Calibration
GenericName=Start MMDVMCal
Exec=lxterminal --working-directory="/home/pi/Applications/MMDVMCal" --command="/home/pi/Applications/MMDVMCal/MMDVMCal /dev/ttyACM0"
Icon=
Terminal=false
Categories=AmateurRadio;
EOL

cat > /usr/share/applications/mmdvm-mmdvmhost_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVMHost Start
GenericName=MMDVMHost Start
Exec=lxterminal --working-directory="/home/pi/Applications/MMDVMHost" --command="/home/pi/Applications/MMDVMHost/MMDVMHost /home/pi/MMDVM.ini"
Icon=
Terminal=false
Categories=AmateurRadio;
EOL

cat > /usr/share/applications/mmdvm-mmdvmhost_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVMHost Stop
GenericName=MMDVMHost Stop
Exec=pkill -f /home/pi/Applications/MMDVMHost
Icon=
Terminal=false
Categories=AmateurRadio;
EOL

cat > /usr/share/applications/mmdvm-mmdvmhost_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVMHost Background Service Console
GenericName=MMDVMHost Background Service Console
Exec=screen -r MMDVMHost
Icon=
Terminal=true
Categories=AmateurRadio;
EOL

cat > /usr/share/applications/mmdvm-mmdvmhost_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVMHost Background Service Start
GenericName=MMDVMHost Background Service Start
Exec=sudo systemctl start mmdvmhost.service
Icon=
Terminal=false
Categories=AmateurRadio;
EOL

cat > /usr/share/applications/mmdvm-mmdvmhost_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVMHost Background Service Stop
GenericName=MMDVMHost Background Service Stop
Exec=sudo systemctl stop mmdvmhost.service
Icon=
Terminal=false
Categories=AmateurRadio;
EOL

cat > /usr/share/applications/mmdvm-mmdvmhost_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVMHost Background Service Restart
GenericName=MMDVMHost Background Service Restart
Exec=sudo systemctl restart mmdvmhost.service
Icon=
Terminal=false
Categories=AmateurRadio;
EOL

cat > /usr/share/applications/mmdvm-update.desktop << EOL
[Desktop Entry]
Type=Application
Name=Update All
GenericName=Update All
Exec=/home/pi/Scripts/update.sh
Icon=
Terminal=true
Categories=AmateurRadio;
EOL

cat > /usr/share/applications/mmdvm-rebuild.desktop << EOL
[Desktop Entry]
Type=Application
Name=Rebuild From Source
GenericName=Rebuild From Source
Exec=/home/pi/Scripts/rebuild.sh
Icon=
Terminal=true
Categories=AmateurRadio;
EOL

cat > /usr/share/applications/mmdvm-resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset MMDVM.ini
GenericName=Reset MMDVM.ini
Exec=/home/pi/Scripts/resetini.sh
Icon=
Terminal=true
Categories=AmateurRadio;
EOL

cat > /usr/share/applications/mmdvm-updatedmriddb.desktop << EOL
[Desktop Entry]
Type=Application
Name=Update DMR ID Database
GenericName=Update DMR ID Database
Exec=/home/pi/Scripts/dmridupdate.sh
Icon=
Terminal=false
Categories=AmateurRadio;
EOL
