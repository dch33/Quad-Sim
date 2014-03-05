%% Quad plots --- from Simulink diagram

% Copyright (C) 2014 D. Hartman, K. Landis, S. Moreno, J. Kim, M. Mehrer

% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/


close all, clc;
A = yout;
T = tout;
t = T;
P = A(:,1); % rad/s for now, converted before plotting
Q = A(:,2);
R = A(:,3);
Phi   = A(:,4); % In radians for now, converted before plotting
Theta = A(:,5);
Psi   = A(:,6);
U = A(:,7)*3.2808399; % convert from m/s to ft/s
V = A(:,8)*3.2808399;
W = A(:,9)*3.2808399;
X = A(:,10)*3.2808399; % convert from m to ft
Y = A(:,11)*3.2808399;
Z = A(:,12)*3.2808399;
w1 = A(:,13);
w2 = A(:,14);
w3 = A(:,15);
w4 = A(:,16);
mc1 = A(:,17);
mc2 = A(:,18);
mc3 = A(:,19);
mc4 = A(:,20);
% Plots ___________________________________________________________________
figure
subplot(4,3,1)
plot(T,P,'b')
xlabel('Time (s)')
ylabel('Angular Velocity (deg/sec)')
xlim([min(t) max(t)])
title('P')
grid on

subplot(4,3,2)
plot(T,Q,'r')
xlabel('Time (s)')
ylabel('Angular Velocity (deg/sec)')
xlim([min(t) max(t)])
title('Q')
grid on

subplot(4,3,3)
plot(T,R,'g')
xlabel('Time (s)')
ylabel('Angular Velocity (deg/sec)')
xlim([min(t) max(t)])
title('R')
grid on

subplot(4,3,4)
plot(T,Phi*180/pi,'b')
xlabel('Time (s)')
ylabel('Angle (deg)')
xlim([min(t) max(t)])
title('Phi')
grid on
 
subplot(4,3,5)
plot(T,Theta*180/pi,'r')
xlabel('Time (s)')
ylabel('Angle(deg)')
xlim([min(t) max(t)])
title('Theta')
grid on

subplot(4,3,6)
plot(T,Psi*180/pi,'g')
xlabel('Time (s)')
ylabel('Angle (deg)')
xlim([min(t) max(t)])
title('Psi')
grid on

subplot(4,3,7)
plot(T,U,'b')
xlabel('Time (s)')
ylabel('Velocity (ft/s)')
xlim([min(t) max(t)])
title('U')
grid on

subplot(4,3,8)
plot(T,V,'r')
xlabel('Time (s)')
ylabel('Velocity (ft/s)')
xlim([min(t) max(t)])
title('V')
grid on

subplot(4,3,9)
plot(T,W,'g')
xlabel('Time (s)')
ylabel('Velocity (ft/s)')
xlim([min(t) max(t)])
title('W')
grid on

subplot(4,3,10)
plot(T,X,'b')
xlabel('Time (s)')
ylabel('Position (ft)')
xlim([min(t) max(t)])
title('X')
grid on

subplot(4,3,11)
plot(T,Y,'r')
xlabel('Time (s)')
ylabel('Position (ft)')
xlim([min(t) max(t)])
title('Y')
grid on

subplot(4,3,12)
plot(T,Z,'g')
xlabel('Time (s)')
ylabel('Position (ft)')
xlim([min(t) max(t)])
title('Z')
grid on

% Create a new figure for motor speeds
figure
subplot(4,1,1)
[AX,H1,H2] = plotyy(T,mc1,T,w1);
xlabel('Time (s)')
ylabel(AX(1),'Motor Throttle Command (%)')
ylabel(AX(2),'Motor Speed (RPM)')
xlim([min(t) max(t)])
title('w1')
grid on

subplot(4,1,2)
[AX,H1,H2] = plotyy(T,mc2,T,w2);
xlabel('Time (s)')
ylabel(AX(1),'Motor Throttle Command (%)')
ylabel(AX(2),'Motor Speed (RPM)')
xlim([min(t) max(t)])
title('w2')
grid on

subplot(4,1,3)
[AX,H1,H2] = plotyy(T,mc3,T,w3);
xlabel('Time (s)')
ylabel(AX(1),'Motor Throttle Command (%)')
ylabel(AX(2),'Motor Speed (RPM)')
xlim([min(t) max(t)])
title('w3')
grid on

subplot(4,1,4)
[AX,H1,H2] = plotyy(T,mc4,T,w4);
xlabel('Time (s)')
ylabel(AX(1),'Motor Throttle Command (%)')
ylabel(AX(2),'Motor Speed (RPM)')
xlim([min(t) max(t)])
title('w4')
grid on
