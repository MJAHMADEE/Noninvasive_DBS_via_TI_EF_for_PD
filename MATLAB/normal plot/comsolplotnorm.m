% 1-sphere comsol AM plot for cutplane1

clc
clear
close all

load datanorm.mat

% data parameters
x = datanorm(:,1);
y = datanorm(:,2);
z = datanorm(:,3);
ecEx = datanorm(:,4);
ec2Ex = datanorm(:,5);
ecEy = datanorm(:,6);
ec2Ey = datanorm(:,7);
ecEz = datanorm(:,8);
ec2Ez = datanorm(:,9);

% Electric potential
ecSum = ecEy+ec2Ey;
% amplitude modulation y
ecAmpy = abs(sqrt((ecEy+ec2Ey).^2)-sqrt((ecEy-ec2Ey).^2));
% amplitude modulation x
ecAmpx = abs(sqrt((ecEx+ec2Ex).^2)-sqrt((ecEx-ec2Ex).^2));
% amplitude modulation z
ecAmpz = abs(sqrt((ecEz+ec2Ez).^2)-sqrt((ecEz-ec2Ez).^2));

%% data from cutplane1

%%%%%%%%%%%%%%%%%%%%%%%%% Amplitude Modulation %%%%%%%%%%%%%%%%%%%%%%%%%
% normal mesh data
% AMy plot
figure
T = delaunay(x,y);
trisurf(T,x,y,ecAmpy); hold on;
axis tight equal
shading interp
view(0,90); h = colorbar; h.Label.String = 'Modulation Amplitude (V/m)';
h.AxisLocation = 'out';
title('E_{AM_y}');
xlabel('x')
ylabel('y')

% AMx plot
figure
T = delaunay(x,y);
trisurf(T,x,y,ecAmpx); hold on;
axis tight equal
shading interp
view(0,90); h = colorbar; h.Label.String = 'Modulation Amplitude (V/m)';
h.AxisLocation = 'out';
title('E_{AM_x}');
xlabel('x')
ylabel('y')

% AMz plot
figure
T = delaunay(x,y);
trisurf(T,x,y,ecAmpz); hold on;
axis tight equal
shading interp
view(0,90); h = colorbar; ylabel(h, {'Modulation Amplitude (V/m)'}); axis vis3d;
h.AxisLocation = 'out';
title('E_{AM_z}');
xlabel('x')
ylabel('y')


% Electric potential plot
figure
trisurf(T,x,y,ecSum); hold on;
axis tight equal
shading flat
title('E');
view(0,90); h = colorbar; ylabel(h, {'Electric Fields (V)'});  axis vis3d;
h.AxisLocation = 'out';
xlabel('x')
ylabel('y')




