close all;
magthet1=atan2(-mag_y,mag_x);

Maccl=mean(accel_x);
accel_x1=accel_x-Maccl;
D1=cumtrapz(accel_x1);
D2=cumtrapz(D1);
newaccel=diff(D2);
%matrix correction
disp=[0 newaccel];

[x y]=pol2cart(magthet1,disp);
% Cor1=cor(1,:)
% Cor2=cor(2,:)
D3= cumsum(x);%+3.2826e+05;
D4= cumsum(y);%-4.6899e+06;

figure
plot(-D3/1e3,D4/1e4)
hold on
plot(utm_e1+300,utm_n1+340,'g')
