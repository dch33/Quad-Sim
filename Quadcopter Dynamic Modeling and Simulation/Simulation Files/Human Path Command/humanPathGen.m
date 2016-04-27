%make human's path
t = 0:0.1:30;
x = t/5;
y = cos(5*x)+3;
z = zeros(1,size(t,2));
slope = -5*sin(5*x);
psi = atan(slope);

%test plot to make sure direction and positioning are correct
plot(x,y,'r')
hold on
quiver(x,y,cos(psi),sin(psi))
axis equal

%save as timeseries into human structure
human.x = timeseries(x,t);
human.y = timeseries(y,t);
human.z = timeseries(z,t);
human.psi = timeseries(psi,t);

% save as .mat for later ;)
save('humanPath.mat','human')
