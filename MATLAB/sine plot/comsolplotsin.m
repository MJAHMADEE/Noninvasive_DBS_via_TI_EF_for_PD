% 1-sphere comsol sine plot for cutplane1

clc
clear
close all

load dataall.mat

% data parameters
x = dataall(:,1);
y = dataall(:,2);
z = dataall(:,3);
ecEx = dataall(:,4);
ec2Ex = dataall(:,5);
ecEy = dataall(:,6);
ec2Ey = dataall(:,7);
ecEz = dataall(:,8);
ec2Ez = dataall(:,9);

% Electric potential
ecSum = ecEy+ec2Ey;
% amplitude modulation y
ecAmpy = abs(sqrt((ecEy+ec2Ey).^2)-sqrt((ecEy-ec2Ey).^2));
% amplitude modulation x
ecAmpx = abs(sqrt((ecEx+ec2Ex).^2)-sqrt((ecEx-ec2Ex).^2));
% amplitude modulation z
ecAmpz = abs(sqrt((ecEz+ec2Ez).^2)-sqrt((ecEz-ec2Ez).^2));


%% data from all-time

% sinusoidal modulation diagram (For all-time data)
t = 0:0.1:7.5;
figure
subplot(2,1,1) % x=0, y=0, z=0 
plot(t,ecEy(6,:), 'k')
hold on
plot(t,ec2Ey(6,:), 'b')
hold on
plot(t,ecSum(6,:), 'r')

% subplot(2,1,2) % x=0, y=0.11, z=0.07
plot(t,ecEy(222,:),'k')
hold on
plot(t,ec2Ey(222,:),'b')
hold on
plot(t,ecSum(222,:),'r')



