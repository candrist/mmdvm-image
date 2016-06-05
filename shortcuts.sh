#!/bin/bash

sudo su

cat > /usr/share/applications/mmdvm-edit_mmdvmini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit MMDVM.ini
GenericName=Edit MMDVM.ini
Exec=mousepad /home/pi/MMDVM.ini
Icon=
Terminal=false
Categories=HamRadio;
EOL

cat > /usr/share/applications/mmdvm-mmdvmcal.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVM Calibration
GenericName=Start MMDVMCal
Exec=xfce4-terminal --working-directory /home/pi/Applications/MMDVMCal -e "/home/pi/Applications/MMDVMCal/MMDVMCal /dev/ttyACM0"
Icon=
Terminal=false
Categories=HamRadio;
EOL

cat > /usr/share/applications/mmdvm-mmdvmhost_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVMHost Start
GenericName=MMDVMHost Start
Exec=xfce4-terminal --working-directory /home/pi/Applications/MMDVMHost -e "/home/pi/Applications/MMDVMHost/MMDVMHost /home/pi/MMDVM.ini"
Icon=
Terminal=false
Categories=HamRadio;
EOL

cat > /usr/share/applications/mmdvm-mmdvmhost_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVMHost Stop
GenericName=MMDVMHost Stop
Exec=pkill -f /home/pi/Applications/MMDVMHost
Icon=
Terminal=false
Categories=HamRadio;
EOL

cat > /usr/share/applications/mmdvm-mmdvmhost_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVMHost Background Service Console
GenericName=MMDVMHost Background Service Console
Exec=screen -r MMDVMHost
Icon=
Terminal=true
Categories=HamRadio;
EOL

cat > /usr/share/applications/mmdvm-mmdvmhost_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVMHost Background Service Start
GenericName=MMDVMHost Background Service Start
Exec=sudo systemctl start mmdvmhost.service
Icon=
Terminal=false
Categories=HamRadio;
EOL

cat > /usr/share/applications/mmdvm-mmdvmhost_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVMHost Background Service Stop
GenericName=MMDVMHost Background Service Stop
Exec=sudo systemctl stop mmdvmhost.service
Icon=
Terminal=false
Categories=HamRadio;
EOL

cat > /usr/share/applications/mmdvm-mmdvmhost_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVMHost Background Service Restart
GenericName=MMDVMHost Background Service Restart
Exec=sudo systemctl restart mmdvmhost.service
Icon=
Terminal=false
Categories=HamRadio;
EOL

cat > /usr/share/applications/mmdvm-update.desktop << EOL
[Desktop Entry]
Type=Application
Name=Update All
GenericName=Update All
Exec=/home/pi/update.sh
Icon=
Terminal=true
Categories=HamRadio;
EOL

cat > /usr/share/applications/mmdvm-rebuild.desktop << EOL
[Desktop Entry]
Type=Application
Name=Rebuild From Source
GenericName=Rebuild From Source
Exec=/home/pi/rebuild.sh
Icon=
Terminal=true
Categories=HamRadio;
EOL

cat > /usr/share/applications/mmdvm-resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset MMDVM.ini
GenericName=Reset MMDVM.ini
Exec=/home/pi/resetini.sh
Icon=
Terminal=true
Categories=HamRadio;
EOL

cat > /usr/share/applications/mmdvm-ircddb.desktop << EOL
[Desktop Entry]
Type=Application
Name=ircDDB Gateway
GenericName=ircDDB Gateway
Exec=ircddbgateway -gui -nolog
Icon=
Terminal=false
Categories=HamRadio;
EOL

cat > /usr/share/applications/mmdvm-ircddbconfig.desktop << EOL
[Desktop Entry]
Type=Application
Name=ircDDB Gateway Config
GenericName=ircDDB Gateway Config
Exec=ircddbgatewayconfig
Icon=
Terminal=false
Categories=HamRadio;
EOL

exit
