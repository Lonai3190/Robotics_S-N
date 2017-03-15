clear all;
close all;
clc;
%cd ~/hw_robs/hw5/my_robot/drive/
javaaddpath lcm.jar
javaaddpath my_types.jar
log_file = lcm.logging.Log('./lcm-log-2017-02-17-13-12-00', 'r');
rob=0;
sn=0;
clas=0;
while true
 try
    
     for i=1:1000000
           hw5 = log_file.readNext(); 
           if clas==0
               clas=hw5.utime;
           end
           
           %channel name is in ev.channel
          % there may be multiple channels but in this case you are only interested in RDI channel
           if strcmp(hw5.channel,'GPS_CHANNEL')
            % build rdi object from data in this record
              rob=rob+1;
              msg         =exlcm.gps(hw5.data);
              alt(rob) 	  =msg.alt;
              timestamp(rob)=hw5.utime;
              lon(rob)	  =msg.lon;
              lat(rob)	  =msg.lat;
              utm_e(rob)    =msg.utmx;
              utm_n(rob)    =msg.utmy;                  
           end
           
           if strcmp(hw5.channel,'IMU_CHANNEL')
                sn=sn+1;
                imu         =exlcm.imu(hw5.data);
                yaw(sn)	    =imu.yaw;
                pitch(sn)    =imu.pitch;
                roll(sn)	 =imu.roll;
                mag_x(sn)    =imu.magx;
                mag_y(sn)    =imu.magy;
                mag_z(sn)    =imu.magz;
                accel_x(sn)  =imu.accelx;
                accel_y(sn)  =imu.accely;
                accel_z(sn)  =imu.accelz;
                gyro_xrs(sn) =imu.gyrox;
                gyro_yrs(sn) =imu.gyroy;
                gyro_zrs(sn) =imu.gyroz;
                imutime(sn)  =hw5.utime;
          end
         
    end
   catch err   % exception will be thrown when you hit end of file
         break;
   
 end
end
timestamp=timestamp-clas;
imutime=imutime-clas;
imutime=imutime/1e6;
utm_n1=utm_n(1,:)-utm_n(1,1);
utm_e1=utm_e(1,:)-utm_e(1,1);

% gpst=[timestamp' lon' lat' alt' utm_n' utm_e'];
% findindices = find(gpst(:,1)==0);
% gpst(findindices,:) = [];
% timestamp=gpst(:,1)';
% lon=gpst(:,2)';
% lat=gpst(:,3)';
% alt=gpst(:,4)';
% utm_n=gpst(:,5)';
% utm_e=gpst(:,6)';
% imut=[imutime' yaw' pitch' roll' mag_x' mag_y' mag_z' accel_x' accel_y' accel_z' gyro_xrs' gyro_yrs' gyro_zrs'];
% findindices1 = find(imut(:,1)==0);
% imut(findindices1,:) = [];
% imutime=imut(:,1)';
% yaw=imut(:,2)';
% pitch=imut(:,3)';
% roll=imut(:,4)';
% mag_x=imut(:,5)';
% mag_y=imut(:,6)';
% mag_z=imut(:,7)';
% accel_x=imut(:,8)';
% accel_y=imut(:,9)';
% accel_z=imut(:,10)';
% gyro_xrs=imut(:,11)';
% gyro_yrs=imut(:,12)';
% gyro_zrs=imut(:,13)';
