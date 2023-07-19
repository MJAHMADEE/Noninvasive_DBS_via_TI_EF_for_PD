% 4-sphere comsol AM plot for cutplane1


clc
clear
close all

load data4sph.mat

% data parameters
x = data4sph(:,1);
y = data4sph(:,2);
z = data4sph(:,3);
ecEx = data4sph(:,4);
ec2Ex = data4sph(:,5);
ecEy = data4sph(:,6);
ec2Ey = data4sph(:,7);
ecEz = data4sph(:,8);
ec2Ez = data4sph(:,9);

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
T = delaunay(zx,y);
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

