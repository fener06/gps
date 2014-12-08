#!/bin/bash
# Script to start our application
before=$(date +%s)
echo "GPS-Gerät wird geladen"
#sudo killall gpsd
#sudo gpsd /dev/ttyUSB0 -F /var/run/gpsd.sock
#sudo service ntp restart
#sudo ntpd
sudo python /home/pi/gps/gpstime.py
echo "Zeitsychronisiert"
sudo python /home/pi/gps/python/ordner.py
echo "Ordner erstellt"
sudo gpxlogger -d -f /home/pi/gps/output/`date +"%Y-%m-%d"`/GPX_`date +"%Y.%m.%d_%H:%M:%S"`.gpx -m 50
echo "GPX-Daten geschrieben"
sudo python /home/pi/gps/python/gpsdData.py
echo "GPS-Daten geschrieben"
after=$(date +%s)
echo "elapsed time:" $((after - $before)) "seconds"
