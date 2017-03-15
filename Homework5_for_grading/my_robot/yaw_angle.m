%Yaw angle calculations


magthet=atan2(-mag_y,mag_x);
magthet=unwrap(magthet);

magthet1=magthet-mean(magthet(1,1:40));
figure
subplot(3,1,1)
plot(imutime,magthet1/10)

newgyroz=gyro_zrs(1,(length(imutime)/2)-1000:(length(imutime)/2)+2000);

yawangle1= cumtrapz(gyro_zrs);
subplot(3,1,2)
plot(imutime,yawangle1/100,'r')

ya_final=0.98*yawangle1+0.02*magthet;
subplot(3,1,3)
plot(imutime,ya_final/100)

figure
hold on
plot(imutime,magthet/10,'b')
hold on
plot(imutime,yawangle1/100,'r')
hold on
plot(imutime,ya_final/100,'g')