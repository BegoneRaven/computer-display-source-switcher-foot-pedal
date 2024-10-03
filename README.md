# Steps in Ubutu 24.04 LTS with GUI

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
Now the foot pedal's events can be used to create a short cut in GUI

### 5. After that find a way in the UI to create a short cut to run a command (In our case, it would be the executable shell script).


