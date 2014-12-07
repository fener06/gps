#!/bin/bash
# Script to start our application
before=$(date +%s)
echo "GPS-Gerät wird geladen"
sudo killall gpsd
sudo gpsd /dev/ttyUSB0 -F /var/run/gpsd.sock
sudo service ntp restart
sudo ntpd
python /home/pi/gps/gpstime.py
python /home/pi/gps/python/ordner.py
echo "Ordner erstelltn"
python /home/pi/gps/python/gpsdData.py
echo "GPS-Daten geschrieben"
after=$(date +%s)
sudo ./gpio_writ
echo "elapsed time:" $((after - $before)) "seconds"
