close all;
avgx=mag_x(1,(length(imutime)/2)-1000:(length(imutime)/2)+2000);
avgy=mag_y(1,(length(imutime)/2)-1000:(length(imutime)/2)+2000);
figure
plot(avgx,avgy)

ellipse=fit_ellipse(avgx,avgy);

R=[ cos(ellipse.phi) sin(ellipse.phi);
    -sin(ellipse.phi) cos(ellipse.phi)];
magz=[ellipse.X0_in-avgx;ellipse.Y0_in-avgy];
v=R*magz;
mag_x1=v(1,:);
mag_y1=v(2,:);

figure
plot(mag_x1,mag_y1)


