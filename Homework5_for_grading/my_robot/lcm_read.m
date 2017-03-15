close all
clear all;
% Let’s assume the logging file is lcm-l.02 in the dir below
% open log file for reading

%filename = 'sitting_imu_3';
%filename = 'sitting_imu_2';
%filename = 'sitting_imu_1';
filename = 'driving_data.bin';

plottitle = strsplit(filename, '.');
plottitle = plottitle(1);
plottitle = plottitle{1};

log_file = lcm.logging.Log(filename, 'r') ;

% now read the file 
dataArr = zeros(2396, 2);
firstSample = true;
firstIMUDat = true;
imuArr = zeros(96362, 2);
imuX = zeros(96362, 2);
imuY = zeros(96362, 2);
magx = zeros(96362, 2);
magy = zeros(96362, 2);
magz = zeros(96362, 2);

accelx = zeros(96362, 2);
accely = zeros(96362, 2);
accelz = zeros(96362, 2);

gyrox = zeros(96362, 2);
gyroy = zeros(96362, 2);
gyroz = zeros(96362, 2);

i = 1;

while true
  try
    ev = log_file.readNext();
    % channel name is in ev.channel
    % there may be multiple channels but in this case you are only interested in GPS channel
    if strcmp(ev.channel, 'GPSDATA')
      % build gps object from data in this record
      gps = class_rob.gps_t(ev.data);
      
      if (firstSample == true)
         firstDataPoint = [gps.utm_x, gps.utm_y];
         dataArr(i,:) = [0,0];
         %baseline = currSample;
         firstSample = false;
      else
          currSample = [(gps.utm_x - firstDataPoint(1)), (gps.utm_y - firstDataPoint(2))];
          if (abs(currSample(1)) < 10000) && (abs(currSample(2)) < 10000) 
            dataArr(i,:) = currSample;
          end
      end
      
    end
    if strcmp(ev.channel, 'IMUDATA')
        imu = class_rob.imu_t(ev.data);
        if (firstIMUDat == true)
            firstIMU = [imu.time, imu.MagX, imu.MagY];
            imuArr(i,:) = [firstIMU(2), firstIMU(3)];
            imuX(i,:) = [0, firstIMU(2)];
            imuY(i,:) = [0, firstIMU(3)];
            accelx(i,:) = [0, imu.AccelX];
            accely(i,:) = [0, imu.AccelY];
            accelz(i,:) = [0, imu.AccelZ];
            gyrox(i,:) = [0, imu.GyroX];
            gyroy(i,:) = [0, imu.GyroY];
            gyroz(i,:) = [0, imu.GyroZ];
            magx(i,:) = [0, imu.MagX];
            magy(i,:) = [0, imu.MagY];
            magz(i,:) = [0, imu.MagZ];
            firstIMUDat = false;
        else
            imuArr(i,:) = [imu.MagX, imu.MagY];
            imuX(i,:) = [(imu.time - firstIMU(1)), imu.MagX];
            imuY(i,:) = [(imu.time - firstIMU(1)), imu.MagY];
            accelx(i,:) = [(imu.time - firstIMU(1)), imu.AccelX];
            accely(i,:) = [(imu.time - firstIMU(1)), imu.AccelY];
            accelz(i,:) = [(imu.time - firstIMU(1)), imu.AccelZ];
            gyrox(i,:) = [(imu.time - firstIMU(1)), imu.GyroX];
            gyroy(i,:) = [(imu.time - firstIMU(1)), imu.GyroY];
            gyroz(i,:) = [(imu.time - firstIMU(1)), imu.GyroZ];
            magx(i,:) = [(imu.time - firstIMU(1)), imu.MagX];
            magy(i,:) = [(imu.time - firstIMU(1)), imu.MagY];
            magz(i,:) = [(imu.time - firstIMU(1)), imu.MagZ];
        end
        i = i+1;
    end
  catch err % exception will be thrown when you hit end of file
     err;
     break;
  end
end

figure;
plot(imuArr(:,1), imuArr(:,2), '.b')

figure;
subplot(2, 1, 1);
plot(imuX(:,1), imuX(:,2), '.');
subplot(2, 1, 2);
plot(imuY(:,1), imuY(:,2), '.r');

figure;
plot(dataArr(:,1), dataArr(:,2), '.b', 'DisplayName', '(utm\_x,utm\_y)');
title(strrep(strcat(plottitle,' utm_x vs utm_y'),'_','\_'));
xlabel('utm\_x dist (m)');
ylabel('utm\_y dist (m)');

figure;
subplot(3, 1, 1);
plot(accelx(:,1), accelx(:,2), '.');
subplot(3, 1, 2);
plot(accely(:,1), accely(:,2), '.r');
subplot(3, 1, 3);
plot(accelz(:,1), accelz(:,2), '.g');

figure;
subplot(3, 1, 1);
plot(gyrox(:,1), gyrox(:,2), '.');
subplot(3, 1, 2);
plot(gyroy(:,1), gyroy(:,2), '.r');
subplot(3, 1, 3);
plot(gyroz(:,1), gyroz(:,2), '.g');

ellipse_data=[imuArr(18000:20000,1), imuArr(18000:20000,2)];

