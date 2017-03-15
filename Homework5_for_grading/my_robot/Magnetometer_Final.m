close all;
%For plotting initial magnetometer readings
avgx=mag_x(1,(length(imutime)/2)-1000:(length(imutime)/2)+2000);
avgy=mag_y(1,(length(imutime)/2)-1000:(length(imutime)/2)+2000);
figure
plot(avgx,avgy);

%hard iron and Soft iron correction
ellipse=fit_ellipse(avgx,avgy);

R=[ cos(ellipse.phi) sin(ellipse.phi);
    -sin(ellipse.phi) cos(ellipse.phi)];
magz=[ellipse.X0_in-avgx;ellipse.Y0_in-avgy];
v=R*magz;
mag_x1=v(1,:);
mag_y1=v(2,:);

figure
plot(mag_x1,mag_y1,'.r');

figure
plot(avgx,avgy);
hold on
plot(mag_x1,mag_y1,'.r');
imutime1=imutime(1,(length(imutime)/2)-1000:(length(imutime)/2)+2000);
imutime1=imutime1/1e14;
%Yaw angle calculations
magthet=atan2(-mag_y1,mag_x1);

figure
subplot(3,1,1)
plot(imutime1,magthet)

newgyroz=gyro_zrs(1,(length(imutime)/2)-1000:(length(imutime)/2)+2000);

yawangle1= cumtrapz(newgyroz);
subplot(3,1,2)
plot(imutime1,yawangle1)

ya_final=0.98*yawangle1+0.02*magthet;
subplot(3,1,3)
plot(imutime1,ya_final)

figure
hold on
plot(imutime1,magthet)
hold on
plot(imutime1,yawangle1)
hold on
plot(imutime1,ya_final)
