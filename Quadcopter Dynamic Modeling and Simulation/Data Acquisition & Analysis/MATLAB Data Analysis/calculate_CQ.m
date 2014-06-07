function [CQ] = calculate_CQ(Seconds, Throttle, RPM, L, gramsMeas, varargin)
% This function calculates the parameter for a zero intercept linear fit 
% between RPM^2 and torque of the form:
%   Torque = (RPM^2)*CQ
% Output is given in the form of returned CQ value and plots.
%
% Argument definitions:
%   L = length of torque rig arm from center of motor to scale contact
%   point (MUST BE IN INCHES)
%   gramsMeas = user measured values direct from scale, MUST BE IN GRAMS!
%   These values must correspond to ALL unique throttle values, even those
%   outside of "LowCutoff" and "HighCutoff."
% (Note: values of gramsMeas corresponding to throttle setting outside 
% "LowCutoff" and "HighCutoff" are not used in calculation, therefore if
% measurements are only available for the range of "LowCutoff" to
% "HighCutoff", the vector can be padded with zeros in the appropriate
% locations.
%
% See also calculate_CR_B, calculate_CT.

% Assign variable length input arguments
if ((nargin-5)==0) % if no input arguments are given for cutoff range:
LowCutoff = min(Throttle); % Use full range of input throttle data
HighCutoff = max(Throttle);
else
LowCutoff = varargin{1}; % Ignore data below this throttle value
HighCutoff = varargin{2}; % Ignore data above this throttle value
end

% Find unique Throttle Setting values (Not counting 0)
ThrottleU = unique(Throttle(Throttle~=0));

% Check length of inputs match
lengthGM = length(gramsMeas);
lengthTU = length(ThrottleU);
if lengthGM ~= lengthTU
    msgbox({['Length of measured grams values vector (' num2str(lengthGM) ')'];
        [' and number of unique Throttle values (' num2str(lengthTU) ')']; ...
       ' do not match! Check input data!'},'Argument Error','warn');
    return
end

% Find unique/filtered Throttle Setting values between low/high cutoff limits
ThrottleUF = ThrottleU(ThrottleU>=LowCutoff & ThrottleU<=HighCutoff);

% Find coresponding grams measurments
gramsMeasU = gramsMeas(ThrottleU>=LowCutoff & ThrottleU<=HighCutoff); % Unique scale values

% Find an average RPM value for each unique/filtered Throttle Setting
RPMAverages100 = zeros(length(ThrottleUF),1); % preallocate
for i = 1:length(ThrottleUF) % For all of the unique and filtered throttle settings:
    RPMUF = RPM(Throttle==ThrottleUF(i));  % get RPM values cooresponding to unique/filtered Throttle value
    if length(RPMUF)>=120 % check to make sure there are enough data points for filtering
        RPMfilt100 = RPMUF(100:end); % RPMUF minus the first 100 data points (to remove transient RPM fluctuation as steady state value is reached)
    else RPMfilt100 = RPMUF((fix(length(RPMUF)/2)):end); % If there's a limited number of points, just take the second half of the values as steady state  
    end
    RPMAverages100(i,1) = mean(RPMfilt100); % Take the average RPM value from these filtered data points
end
RPMsq = RPMAverages100.^2;

g = 9.81; % Gravity (m/s^2)
newtonMetersTorque = g*L*gramsMeasU/(1000*39.3701); % Torque in N*m (Conversion: (g-->kg and in-->m))
CQ = RPMsq\newtonMetersTorque; % This is a technique for forcing a zero intercept using matrix division techniques
CQp = [CQ;0];

% Plot the linear relationship and display calculated CQ value
figure
plot(RPMsq, newtonMetersTorque, '*', RPMsq, polyval(CQp, RPMsq))
xlabel('RPM^2 (rev^2/min^2)','FontSize',12)
ylabel('Torque (N*m)','FontSize',12)
title({['Linear Fit of Torque vs. RPM^2'];...
    [' ']; ['CQ: ' num2str(CQ) ' (N*m/RPM^2)']},'FontSize',14)
xlims = get(gca,'xlim');
ylims = get(gca,'ylim');
grid on

% Plot Residuals for assesing general quality of fit
predictedTorque = polyval(CQp, RPMsq); % predict thrust for each throttle setting of interest
residuals = newtonMetersTorque - predictedTorque; % find absolute error between prediction and actual
figure
plot(predictedTorque,residuals,'r*',[min(predictedTorque) max(predictedTorque)],[0 0])
title('CQ Residuals Plot','FontSize',14)
xlabel('Predicted Thrust (N)','FontSize',12)
ylabel('Prediction Error (N)','FontSize',12)
grid on
axis tight