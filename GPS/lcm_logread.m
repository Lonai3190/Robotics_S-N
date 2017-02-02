
clear all;
log_file = lcm.logging.Log('/home/lonai/Downloads/lcm-1.2.1/GPS/log/lcm-log-2017-02-01-02:28:26', 'r');
%import gps_t.*
while true
 try
    for i=1:1000 
           GPS = log_file.readNext(); 

           % channel name is in GPS.channel
           

           if strcmp(GPS.channel, 'GPS')
            % builds the  GPS object from data in this record
              self.packet = gps_trans.direction(GPS.data);
              time(i)=self.packet.timestamp;
            
              utm_east(i)=self.packet.utm_x;
              utm_north(i)=self.packet.utm_y;
              for j=1:(size(utm_east,2))
              if(utm_east(j)== 0) || (utm_north(j)==0)
                  utm_east(j)=utm_east(j-1);
                  utm_north(j)=utm_north(j-1);
              end
              end
           end
           
    end
   
 end
end
figure
plot(utm_east,utm_north,'x')