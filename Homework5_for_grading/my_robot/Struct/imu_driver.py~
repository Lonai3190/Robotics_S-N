#!/usr/bin/env python


import sys
import lcm
import time
import utm
import serial
from gps_trans import imud


class IMU(object):
    def __init__(self, port_name):
        self.port = serial.Serial(port_name, 115200, timeout=1.)  
        self.lcm = lcm.LCM()
        self.packet = imud()

    def readloop(self):
       while True:
	      line = self.port.readline()
              im   = line.split(',')
              
	      
              if im[0] == '$VNYMR' :
                   
                   self.packet.ya= im[1]
		   self.packet.pit = im[2] 
                   self.packet.rol  = im[3]
                   self.packet.magx= im[4]
                   self.packet.magy = im[5]
		   self.packet.magz = im[6]
		   self.packet.accx= im[7]
		   self.packet.accy = im[8]
         	   self.packet.accz =im[9]
		   self.packet.gyrox_radps=im[10]
		   self.packet.gyroy_radps=im[11]
		   line1=im[12]
		   im1=line1.split('*')
		   self.packet.gyroz_radps=im1[0]
                   self.lcm.publish("IMU",self.packet.encode())
		   time.sleep(1)
		
       pass
                #print 'CODE not working (' + line + ')'
        
if __name__ == "__main__":
   imu_log = IMU('/dev/ttyUSB1')
   imu_log.readloop()
