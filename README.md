#Steps in Ubutu 24.04 LTS
#Install ddcutil
apt-get install ddcutil


#Get a USB fool pedal

#Use this tutorial for reference
https://medium.com/@etdu/programming-a-macro-keypad-for-ubuntu-e430451f5e43

In my case I had to do set the following :

cat /etc/udev/hwdb.d/90-custom-keyboard.hwdb  
...
evdev:input:b0003v5131p2019*
 KEYBOARD_KEY_70028=prog1
...
Run 
sudo systemd-hwdb update && sudo udevadm trigger 
for the settings to take effect

After that find a way in the UI to create a short cut & point to the shell script


