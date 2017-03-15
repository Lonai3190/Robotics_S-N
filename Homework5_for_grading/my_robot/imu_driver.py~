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
                   
		   im1  = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
                   im1[0]  = im[1]
                   im1[1]  = im[2]
                   im1[2]  = im[3]
                   im1[3]  = im[4]
		   im1[4]  = im[5]
                   im1[5]  = im[6]
                   im1[6]  = im[7]
                   im1[7]  = im[8]
		   im1[8]  = im[9]
                   im1[9]  = im[10]
                   im1[10]  = im[11]
                   
                   
		   for i in range(0,11) :
                       if im1[i]=='' :
                          im1[i]=0

	    	   val = [float(x) for x in im1]
                   self.packet.ya= val[1]
		   self.packet.pit = val[2] 
                   self.packet.rol  = val[3]
                   self.packet.magx= val[4]
                   self.packet.magy = val[5]
		   self.packet.magz = val[6]
		   self.packet.accx= val[7]
		   self.packet.accy = val[8]
         	   self.packet.accz =val[9]
		   self.packet.gyrox_radps=val[10]
		   self.packet.gyroy_radps=val[11]
		   line1=im[12]
		   im2=line1.split('*')
		   self.packet.gyroz_radps=float(im2[0])
                   self.lcm.publish("IMU",self.packet.encode())
		   
		
       pass
                #print 'CODE not working (' + line + ')'
        
if __name__ == "__main__":
   data_log = IMU('/dev/ttyUSB0')
   data_log.readloop()
