# MMDVM Raspberry Pi Image Scripts

### Purpose
This will enable you to take a stock Raspbian Jessie Lite and have a complete MMDVM System.

It uses XFCE4 for the GUI and you can access it via rdp.

This is created by Chris Andrist, KC7WSU. This process is used to create the DMR-UTAH MMDVM Images available [here](http://www.dmr-utah.net/support/mmdvm/images/).

### Step-by-Step
1. Basic Raspberry Pi Config
  - sudo raspi-config
    - Expand Filesystem
    - Disable Serial
    - Localization
 - sudo reboot

2. Download Scripts
  - git clone https://github.com/candrist/mmdvm-image.git /home/pi/Scripts

3. Run initial install file
  - /home/pi/Scripts/install.sh

4. Add Ham Radio Menu to XFCE

  - sudo nano /etc/xdg/menus/xfce-applications.menu

  - Add Ham Radio Section

  ```xml
    <Menu>
        <Name>HamRadio</Name>
        <Directory>ham-radio.directory</Directory>
        <Include>
            <Category>HamRadio</Category>
        </Include>
    </Menu>
  ```

5. XFCE Customizations
  - Panel
    - Action Items - Add Restart
    - Remove Lower Panel
  - Set Background

6. Install Applications from  "Xfce Terminal"
  - /home/pi/Scripts/install_apps.sh
  
7. Create Shortcuts
  - sudo /home/pi/Scripts/shortcuts.sh

8. Create Service
  - sudo /home/pi/Scripts/create_service.sh

9. Run from Ham Radio Menu
  - Rebuild From Source
  - Reset MMDVM.ini

10. Build ircDDBGateway (OPTIONAL)
  - cd /home/pi/Applications/OpenDV/ircDDBGateway
  - ./configure
  - make
  - sudo make install

11. Cleanup
  - /home/pi/Scripts/cleanup.sh
