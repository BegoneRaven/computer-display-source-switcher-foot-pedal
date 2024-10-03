# Steps in Ubutu 24.04 LTS with GUI

### 1. Install ddcutil  
```
apt-get install ddcutil
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


