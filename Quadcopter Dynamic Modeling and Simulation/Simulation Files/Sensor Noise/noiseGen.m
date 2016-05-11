% http://www.mathworks.com/matlabcentral/fileexchange/34467-pink--flicker--noise-generator
close all;
%make random noise
t = 0:0.01:50;
psi = 1.2.*flicker(length(t));
theta = 1.2.*flicker(length(t));

%test plot to make sure direction and positioning are correct
figure(1);
plot(t,psi,'r');
hold on
plot(t,theta,'b');
legend('psi noise', 'theta noise');

%save as timeseries
psiNoise = timeseries(psi,t);
thetaNoise = timeseries(theta,t);

% save as .mat for later ;)
save('noise.mat','psiNoise','thetaNoise');
