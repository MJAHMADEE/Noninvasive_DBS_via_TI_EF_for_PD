% 1-sphere comsol range plot for cutplane2

clc
clear
close all

load datacut2ex.mat

% data parameters
x = datacut2ex(:,1);
y = datacut2ex(:,2);
z = datacut2ex(:,3);
ecEx = datacut2ex(:,4);
ec2Ex = datacut2ex(:,5);
ecEy = datacut2ex(:,6);
ec2Ey = datacut2ex(:,7);
ecEz = datacut2ex(:,8);
ec2Ez = datacut2ex(:,9);

% Electric potential
ecSum = ecEy+ec2Ey;
% amplitude modulation y
ecAmpy = abs(sqrt((ecEy+ec2Ey).^2)-sqrt((ecEy-ec2Ey).^2));
% amplitude modulation x
ecAmpx = abs(sqrt((ecEx+ec2Ex).^2)-sqrt((ecEx-ec2Ex).^2));
% amplitude modulation z
ecAmpz = abs(sqrt((ecEz+ec2Ez).^2)-sqrt((ecEz-ec2Ez).^2));


%%   data from Cutplane2

%%%%%%%%%%%%%%%%%%%%%%%%% Range %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% extremely fine mesh data
% AMy in z view
figure;
s = 100*ones(1,numel(ecAmpy));
scatter3(x, z, ecAmpy, s, ecAmpy,'.');
title('E_{AM_y} z-range');
view(90,0); h = colorbar; h.Label.String = 'Modulation Amplitude (V/m)';
zlabel('E_{AM_y}')
ylabel('z')




