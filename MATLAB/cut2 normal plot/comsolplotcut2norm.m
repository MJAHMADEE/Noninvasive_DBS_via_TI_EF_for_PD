% 1-sphere comsol AM plot for cutplane2

clc
clear
close all

load datacut2norm.mat

% data parameters
x = datacut2norm(:,1);
y = datacut2norm(:,2);
z = datacut2norm(:,3);
ecEx = datacut2norm(:,4);
ec2Ex = datacut2norm(:,5);
ecEy = datacut2norm(:,6);
ec2Ey = datacut2norm(:,7);
ecEz = datacut2norm(:,8);
ec2Ez = datacut2norm(:,9);

% Electric potential
ecSum = ecEy+ec2Ey;
% amplitude modulation y
ecAmpy = abs(sqrt((ecEy+ec2Ey).^2)-sqrt((ecEy-ec2Ey).^2));
% amplitude modulation x
ecAmpx = abs(sqrt((ecEx+ec2Ex).^2)-sqrt((ecEx-ec2Ex).^2));
% amplitude modulation z
ecAmpz = abs(sqrt((ecEz+ec2Ez).^2)-sqrt((ecEz-ec2Ez).^2));


%%   data from Cutplane2

%%%%%%%%%%%%%%%%%%%%%%%% Amplitude Modulation %%%%%%%%%%%%%%%%%%%%%%%%%
% normal mesh data
% AMy plot
figure
T = delaunay(x,z);
trisurf(T,x,z,ecAmpy); hold on;
axis tight equal
shading interp
view(0,90); h = colorbar; ylabel(h, {'Modulation Amplitude (V/m)'}); axis vis3d;
h.AxisLocation = 'out';
title('E_{AM_y}');
xlabel('x')
ylabel('z')

