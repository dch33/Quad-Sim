% Trajectory of X-Y path --- Time Series for Position Control


X = [ 0, 1, 1,-1, 0, 0, 0]; % meters
Y = [ 0, 0, 1, 0, 0, 0, 0]; % meters
Z = [ 3, 3, 3, 3, 3, 3, 3]; % meters
t = [ 0, 5,10,15,20,25,30]; % seconds
Yaw = [0,0,0,0,0,0,0]; % radians
X_in = timeseries(X,t);
Y_in = timeseries(Y,t);
Z_in = timeseries(Z,t);
Yaw_in = timeseries(Yaw,t); 
