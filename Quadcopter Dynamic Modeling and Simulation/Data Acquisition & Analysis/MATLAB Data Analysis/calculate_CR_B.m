function [CR, b] = calculate_CR_B(Seconds, Throttle, RPM, varargin)
% This function calculates the parameters of a linear fit between percent
% throttle and motor RPM of the form:
% RPM = (%Throttle)*CR + B
% Output is given in the form of returned CR and B values and plots.
%
% See also calculate_CQ, calculate_CT.

% Assign input arguments
if ((nargin-3)==0) % if no input arguments are given for cutoff range:
LowCutoff = min(Throttle); % Use full range of input throttle data
HighCutoff = max(Throttle);
else
LowCutoff = varargin{1}; % Ignore data below this throttle value
HighCutoff = varargin{2}; % Ignore data above this throttle value
end

% Find unique Throttle Setting values (Not counting 0)
ThrottleU = unique(Throttle(Throttle~=0));

% Find unique/filtered Throttle Setting values between low/high cutoff limits
ThrottleUF = ThrottleU(ThrottleU>=LowCutoff & ThrottleU<=HighCutoff);

% Preallocate for averages vector
RPMAverages100 = zeros(length(ThrottleUF),1);

% Find an average RPM value for each unique/filtered Throttle Setting
for i = 1:length(ThrottleUF) % For all of the unique and filtered throttle settings:
    RPMUF = RPM(Throttle==ThrottleUF(i));  % get RPM values cooresponding to unique/filtered Throttle value
    if length(RPMUF)>=120 % check to make sure there are enough data points for filtering
        RPMfilt100 = RPMUF(100:end); % RPMUF minus the first 100 data points (to remove transient RPM fluctuation as steady state value is reached)
    else RPMfilt100 = RPMUF((fix(length(RPMUF)/2)):end); % If there's a limited number of points, just take the second half of the values as steady state  
    end
    RPMAverages100(i,1) = mean(RPMfilt100); % Take the average RPM value from these filtered data points
end

% Linear fit of RPM Average Values vs. Unique/Filtered Throttle Settings
% Calculates the linear polynomial coefficients CR and b
[CR_b, S] = polyfit(ThrottleUF,RPMAverages100,1); % Perfom a linear fit on data
CR = CR_b(1); % First entry in CR_b is CR value
b = CR_b(2);  % Next entry is b value

% Plot the linear relationship and display calculated CR and b values
figure
% Plot all of the average RPM values for each throttle, and also plot a
% line showing the linear fit generated.
plot(ThrottleUF,RPMAverages100,'*',ThrottleUF,polyval(CR_b,ThrottleUF))
xlabel('Throttle (%)','FontSize',12)
ylabel('RPM (rev/min)','FontSize',12)
title({['Linear Fit of RPM vs. Throttle Setting']; ... 
    ' ';['C_R: ' num2str(CR) ' (RPM/%), b: ' num2str(b) ' (RPM)']},'FontSize',14)
grid on

% Plot Residuals for assesing general quality of fit
predictedRPM = polyval(CR_b, ThrottleUF); % predict RPM for each throttle setting of interest
residuals = RPMAverages100 - predictedRPM; % find absolute error between prediction and actual
figure
plot(predictedRPM,residuals,'r*',[min(predictedRPM) max(predictedRPM)],[0 0])
title('C_R, b Residuals Plot','FontSize',14)
xlabel('Predicted RPM','FontSize',12)
ylabel('Prediction Error (RPM)','FontSize',12)
grid on
axis tight
end