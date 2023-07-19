% 1-sphere comsol range plot for cutplane1

clc
clear
close all

load dataex.mat

% data parameters
x = dataex(:,1);
y = dataex(:,2);
z = dataex(:,3);
ecEx = dataex(:,4);
ec2Ex = dataex(:,5);
ecEy = dataex(:,6);
ec2Ey = dataex(:,7);
ecEz = dataex(:,8);
ec2Ez = dataex(:,9);

% Electric potential
ecSum = ecEy+ec2Ey;
% amplitude modulation y
ecAmpy = abs(sqrt((ecEy+ec2Ey).^2)-sqrt((ecEy-ec2Ey).^2));
% amplitude modulation x
ecAmpx = abs(sqrt((ecEx+ec2Ex).^2)-sqrt((ecEx-ec2Ex).^2));
% amplitude modulation z
ecAmpz = abs(sqrt((ecEz+ec2Ez).^2)-sqrt((ecEz-ec2Ez).^2));

%% data from cutplane1

% Max position AMy
[My,Iy] = max(ecAmpy);
Xy = x(Iy);
Yy = y(Iy);
Zy = z(Iy);

% Max position AMx
[Mx,Ix] = max(ecAmpx);
Xx = x(Ix);
Yx = y(Ix);
Zx = z(Ix);

% Max position AMx
[Mz,Iz] = max(ecAmpx);
Xz = x(Iz);
Yz = y(Iz);
Zz = z(Iz);

%%%%%%%%%%%%%%%%%%%%%%%%% Range %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% extremely fine mesh data
% AMy in y view
figure;
s = 100*ones(1,numel(ecAmpy));
scatter3(x, y, ecAmpy, s, ecAmpy,'.');
title('E_{AM_y} y-range');
view(90,0); h = colorbar; h.Label.String = 'Modulation Amplitude (V/m)';
h.AxisLocation = 'out';
zlabel('E_{AM_y}')
ylabel('y')

% AMy in x view
figure;
s = 100*ones(1,numel(ecAmpy));
scatter3(x, y, ecAmpy, s, ecAmpy,'.');
title('E_{AM_y} x-range');
view(0,0); h = colorbar; h.Label.String = 'Modulation Amplitude (V/m)';
zlabel('E_{AM_y}')
xlabel('x')


