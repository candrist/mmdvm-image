# mmdvm-image
MMDVM Raspberry Pi Image Setup


1. Basic Raspberry Pi Config
  - sudo raspi-config
    - Expand Filesystem
    - Disable Serial
    - Localization
 - sudo reboot

2. Download Scripts
  - mkdir -p /home/pi/Applications
  - git clone https://github.com/candrist/mmdvm-image.git /home/pi/Scripts
  - chmod +x /home/pi/Scripts/*.sh

3. Run first install file
  - cd /home/pi/Scripts
  - ./install.sh

4. Add Ham Radio Menu in XFCE

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
