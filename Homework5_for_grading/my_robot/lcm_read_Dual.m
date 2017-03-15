clear all;
javaaddpath lcm.jar
javaaddpath my_types.jar
log_file = lcm.logging.Log('./lcm-log-2017-02-17-13-12-00', 'r');
%clear java;


while true
 try
    for i=1:1000000 
           IMU = log_file.readNext(); 
            val(i)=i;
           % channel name is in ev.channel
           % there may be multiple channels but in this case you are only interested in RDI channel
            if strcmp(IMU.channel, 'GPS_CHANNEL')
            % build rdi object from data in this record
              self.packet = exlcm.gps(IMU.data);
              utm_e(i)=self.packet.utmx;
              utm_n(i)=self.packet.utmy;
            end
           
           if strcmp(IMU.channel, 'IMU_CHANNEL')
            % build rdi object from data in this record
              
              self.packet = exlcm.imu(IMU.data);
              yaw(i)=self.packet.yaw;
              pitch(i)=self.packet.pitch;
              roll(i)=self.packet.roll;
              magx(i)=self.packet.magx;
              magy(i)=self.packet.magy;
              magz(i)=self.packet.magz;
              accelx(i)=self.packet.accelx;  
              accely(i)=self.packet.accely;
              accelz(i)=self.packet.accelz;     
              gyrox(i)=self.packet.gyrox;
              gyroy(i)=self.packet.gyroy;
              gyroz(i)=self.packet.gyroz;                               
              time(i)=self.packet.mtime;
           end
         % channel name is in ev.channel
         % there may be multiple channels but in this case you are only interested in RDI channel

          
           
    end
           
    
      % exception will be thrown when you hit end of file
          %break;
 end
 end
 
utm_n1=utm_n(1,:)-utm_n(1,1);
utm_e1=utm_e(1,:)-utm_e(1,1);