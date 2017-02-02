#!/usr/bin/env python


import sys
import lcm
import time
import utm
import serial
import pynmea2 #https://github.com/Knio/pynmea2
from gps_trans import direction


class GPS(object):
    def __init__(self, port_name):
        self.port = serial.Serial(port_name, 4800, timeout=1.)  
        self.lcm = lcm.LCM()
        self.packet = direction()

    def readloop(self):
       while True:
	      line = self.port.readline()
              gp   = line.split(',')
              
	      
              if gp[0] == '$GPGGA' :
		   msg= pynmea2.parse(line)
                   #print gp
                   #print gp1
                   gp1  = [0,0,0,0]
                   gp1[0]  = gp[1]
                   gp1[1]  = gp[2]
                   gp1[2]  = gp[4]
                   gp1[3]  = gp[9]
                   for i in range(0,4) :
                       if gp1[i]=='' :
                          gp1[i]=0
	
                   #print gp
                   #print gp1
                   vals = [float(x) for x in gp1]
                   self.packet.latitude= msg.latitude
		   self.packet.timestamp = vals[0] 
                   #self.packet.latitude  = vals[1]
                   self.packet.direction1= gp[3]
                   #self.packet.longitude = vals[2]
		   self.packet.longitude = msg.longitude
		   self.packet.direction2= gp[5]
		   self.packet.altitude  = vals[3]
          	   utyum= utm.from_latlon(self.packet.latitude,self.packet.longitude)
		   self.packet.utm_x=utyum[0]
		   self.packet.utm_y=utyum[1]
                   self.lcm.publish("GPS",self.packet.encode())
		   time.sleep(1)
		
       pass
                #print 'CODE not working (' + line + ')'
        
if __name__ == "__main__":
   data_log = GPS('/dev/ttyUSB0')
   data_log.readloop()
