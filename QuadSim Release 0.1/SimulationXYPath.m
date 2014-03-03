% Trajectory of X-Y path --- Time Series for Position Control

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


X = [ 0, 1, 1,-1, 0, 0, 0]; % meters
Y = [ 0, 0, 1, 0, 0, 0, 0]; % meters
Z = [ 3, 3, 3, 3, 3, 3, 3]; % meters
t = [ 0, 5,10,15,20,25,30]; % seconds
Yaw = [0,0,0,0,0,0,0]; % radians
X_in = timeseries(X,t);
Y_in = timeseries(Y,t);
Z_in = timeseries(Z,t);
Yaw_in = timeseries(Yaw,t); 