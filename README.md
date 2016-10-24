# MMDVM Raspberry Pi Image Scripts

### Purpose
This will enable you to take a stock Raspbian Jessie and have a complete MMDVM System.

This is created by Chris Andrist, KC7WSU. This process is used to create the DMR-UTAH MMDVM Images available [here](http://www.dmr-utah.net/support/mmdvm/images/).

### Step-by-Step
1. Basic Raspberry Pi Config
  - sudo raspi-config
    - Expand Filesystem
    - Disable Serial
    - Enable VNC
    - Localization
 - sudo reboot

2. Update Raspberry Pi
 - sudo apt-get update
 - sudo apt-get -y dist-upgrade
 
3. Download Scripts
  - git clone https://github.com/candrist/mmdvm-image.git /home/pi/Scripts

4. Run initial install file
  - sudo /home/pi/Scripts/install.sh

5. Add Amateur Radio Menu

  - sudo nano /etc/xdg/menus/lxde-pi-applications.menu

  - Add Amateur Radio Section

  ```xml
        <!-- Amateur Radio -->
        <Menu>
                <Name>Amateur Radio</Name>
                <Directory>lxde-amateur-radio.directory</Directory>
                <Include>
                        <And>
                                <Category>AmateurRadio</Category>
                        </And>
                </Include>
        </Menu> <!-- End Amateur Radio -->
  ```

  - Edit Layout Section

  ```xml
		<Menuname>Amateur Radio</Menuname>
  ```
  
 - sudo reboot

6. Install Applications from  "lxTerminal"
  - /home/pi/Scripts/install_apps.sh
  
7. Create Shortcuts
  - sudo /home/pi/Scripts/shortcuts.sh

8. Create Service
  - sudo /home/pi/Scripts/create_service.sh

9. Run from Amateur Radio Menu
  - Rebuild From Source
  - Reset MMDVM.ini

10. Cleanup
  - /home/pi/Scripts/cleanup.sh
