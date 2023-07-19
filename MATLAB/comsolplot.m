% datanorm.mat, dataex.mat, datacut2norm.mat ,and datacut2ex.mat,
% data4sph.mat are exported from COMSOL Multiphysics different mesh sizes
% at t=4.2ms (Max amplitude) with following specs :
%%%%% Target: 10mm < x < 13mm , 21mm < y < 23.5mm (Brain right STN)
% 1-sphere 140mm head model
% cyl1 x:130mm - y:42mm - z:-18mm
% cyl2 x:140mm - y:11mm - z:-18mm
% cyl3 x:-138mm - y:42mm - z:-18mm
% cyl4 x:-135mm - y:6mm - z:-18mm
% I1 = 9mA, 1000 Hz - I2 = 13mA, 1130Hz ==> Deltaf = 130Hz, T = 7.69ms
%%%%% Result: 11mm < x < 14mm , 14mm < y < 22mm

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


%%   data from Cutplane2

%%%%%%%%%%%%%%%%%%%%%%%%% Amplitude Modulation %%%%%%%%%%%%%%%%%%%%%%%%%
% % normal mesh data
% % AMy plot
% figure
% T = delaunay(x,z);
% trisurf(T,x,z,ecAmpy); hold on;
% axis tight equal
% shading interp
% view(0,90); h = colorbar; ylabel(h, {'Modulation Amplitude (V/m)'}); axis vis3d;
% h.AxisLocation = 'out';
% title('E_{AM_y}');
% xlabel('x')
% ylabel('z')

%%%%%%%%%%%%%%%%%%%%%%%%% Range %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% extremely fine mesh data
% AMy in z view
% figure;
% s = 100*ones(1,numel(ecAmpy));
% scatter3(x, z, ecAmpy, s, ecAmpy,'.');
% title('E_{AM_y} z-range');
% view(90,0); h = colorbar; h.Label.String = 'Modulation Amplitude (V/m)';
% zlabel('E_{AM_y}')
% ylabel('z')

%% data from all-time

% % sinusoidal modulation diagram (For all-time data)
% t = 0:0.1:7.5;
% figure
% subplot(2,1,1) % x=0, y=0, z=0 
% plot(t,ecEy(6,:), 'k')
% hold on
% plot(t,ec2Ey(6,:), 'b')
% hold on
% plot(t,ecSum(6,:), 'r')

% % subplot(2,1,2) % x=0, y=0.11, z=0.07
% plot(t,ecEy(222,:),'k')
% hold on
% plot(t,ec2Ey(222,:),'b')
% hold on
% plot(t,ecSum(222,:),'r')



