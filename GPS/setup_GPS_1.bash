#/usr/bin/env bash
sudo chmod 666 /dev/ttyUSB0
export CLASSPATH=$PWD
python gps_improv.py &
lcm-logger -s ./log/lcm-log-%F-%T &
lcm-spy &
kill %1 %2
