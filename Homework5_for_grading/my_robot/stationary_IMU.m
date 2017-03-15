
clear all;
javaaddpath lcm.jar
javaaddpath my_types.jar
log_file = lcm.logging.Log('/home/lonai/Robotics_S-N/Homework5/my_robot/data/lcm-log-2017-02-25-21:37:52', 'r');
%import gps_t.*


while true
 try
    for i=1:1000000 
           IMU = log_file.readNext(); 
            val(i)=i;
           % channel name is in ev.channel
           % there may be multiple channels but in this case you are only interested in RDI channel

           if strcmp(IMU.channel, 'IMU')
            % build rdi object from data in this record
              
              self.packet = gps_trans.imud(IMU.data);
              yaw(i)=self.packet.ya;
              pitch(i)=self.packet.pit;
              roll(i)=self.packet.rol;
              magx1(i)=self.packet.magx;
              magy1(i)=self.packet.magy;
              magz1(i)=self.packet.magz;
              accx1(i)=self.packet.accx;  
              accy1(i)=self.packet.accy;
              accz1(i)=self.packet.accz;     
              gyrox_radps1(i)=self.packet.gyrox_radps;
              gyroy_radps1(i)=self.packet.gyroy_radps;
              gyroz_radps1(i)=self.packet.gyroz_radps;                               
              
           end
    
    end
   catch err   % exception will be thrown when you hit end of file
         break;
   
 end
end
          
%axis([0,10,0,10]) %uncomment this line to see point from large a bit
%zoomed in
%figure
% plot(magx1,magy1,magz1,'b')
% 
% figure
% plot(gyrox_radps1,gyroy_radps1,gyroz_radps1,'g')

% %axis([-10,140,-10,70])
% %axis([(min(utm_n1)+10)/100000,(max(utm_n1)+10)/100000,(min(utm_e1)+10)/1000000,(max(utm_e1)+10)/1000000])