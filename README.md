# Steps in Ubutu 24.04 LTS

### 1. Install ddcutil  
And run some commands to find information about your monitor.
The script essentialy essentially uses VCP (Virtual Control Panel) commands to interact with the monitor.
Comamnd go via the DDC(Display Data Channel) protocol to your monitor
```
apt-get install ddcutil
ddcutil detect
ddcutil getvcp all
ddcutil getvcp 0x60
```
### 2. Get a USB fool pedal!

### 3. Use this tutorial to associate your USB foot pedal with Linux
https://medium.com/@etdu/programming-a-macro-keypad-for-ubuntu-e430451f5e43

In my case I had to do set the following :
```
cat /etc/udev/hwdb.d/90-custom-keyboard.hwdb  
evdev:input:b0003v5131p2019*
 KEYBOARD_KEY_70028=prog1
```
### 4. Run
```
sudo systemd-hwdb update && sudo udevadm trigger
```
Now the foot pedal's events are receive-able.

Ther are now multiple ways to associate the USB button press event to running a command

### A. Headless system or without any Graphical UI stack getting involved
       This could be the best approach as it does not depend upon X or Wayload or any GUI.
       Even if the GUI is messed up. this is expected to work
### B. System with some GUI that can process events
       Find a way in the UI to create a short cut to run a command (In our case, it would be the executable shell script).


