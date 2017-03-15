#/usr/bin/env bash
#sudo chmod 666 /dev/ttyUSB0
sudo chmod 666 /dev/ttyUSB0
export LCM_DEFAULT_URL=udpm://230.0.0.0:8080?ttl=1
export CLASSPATH=$PWD
lcm-logger -s ./data/lcm-log-%F-%T &
lcm-spy 
#python gps_improv.py &
python imu_driver.py &
kill %1 %2 
