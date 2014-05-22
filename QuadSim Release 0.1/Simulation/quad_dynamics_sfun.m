function quad_dynamics_sfun(block)

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


%MSFUNTMPL A Template for a MATLAB S-Function
%   The MATLAB S-function is written as a MATLAB function with the
%   same name as the S-function. Replace 'msfuntmpl' with the name
%   of your S-function.  
%
%   It should be noted that the MATLAB S-function is very similar
%   to Level-2 C-Mex S-functions. You should be able to get more 
%   information for each of the block methods by referring to the
%   documentation for C-Mex S-functions.
%  
%   Copyright 2003-2010 The MathWorks, Inc.
%   $Revision: 1.1.6.22 $  
  
%
% The setup method is used to setup the basic attributes of the
% S-function such as ports, parameters, etc. Do not add any other
% calls to the main body of the function.  
%   
setup(block);
  
%endfunction

% Function: setup ===================================================
% Abstract:
%   Set up the S-function block's basic characteristics such as:
%   - Input ports
%   - Output ports
%   - Dialog parameters
%   - Options
% 
%   Required         : Yes
%   C-Mex counterpart: mdlInitializeSizes
%
function setup(block)

  % Register the number of ports.
  block.NumInputPorts  = 4;
  block.NumOutputPorts = 12;
  
  % Set up the port properties to be inherited or dynamic.
  for i = 1:4;
  block.InputPort(i).Dimensions        = 1;
  block.InputPort(i).DirectFeedthrough = false;
  block.InputPort(i).SamplingMode      = 'Sample';
  end
  
  for i = 1:12;
  block.OutputPort(i).Dimensions       = 1;
  block.OutputPort(i).SamplingMode     = 'Sample';
  end

%   % Override the input port properties.
%   block.InputPort(1).DatatypeID  = 0;  % double
%   block.InputPort(1).Complexity  = 'Real';
%   
%   % Override the output port properties.
%   block.OutputPort(1).DatatypeID  = 0; % double
%   block.OutputPort(1).Complexity  = 'Real';

  % Register the parameters.
  block.NumDialogPrms     = 2;
  
  % Set up the continuous states.
  block.NumContStates = 12;

  % Register the sample times.
  %  [0 offset]            : Continuous sample time
  %  [positive_num offset] : Discrete sample time
  %
  %  [-1, 0]               : Inherited sample time
  %  [-2, 0]               : Variable sample time
  block.SampleTimes = [0 0];
  
  % -----------------------------------------------------------------
  % Options
  % -----------------------------------------------------------------
  % Specify if Accelerator should use TLC or call back to the 
  % MATLAB file
  block.SetAccelRunOnTLC(false);
  
  % Specify the block simStateCompliance. The allowed values are:
  %    'UnknownSimState', < The default setting; warn and assume DefaultSimState
  %    'DefaultSimState', < Same SimState as a built-in block
  %    'HasNoSimState',   < No SimState
  %    'CustomSimState',  < Has GetSimState and SetSimState methods
  %    'DisallowSimState' < Errors out when saving or restoring the SimState
  block.SimStateCompliance = 'DefaultSimState';
  
  % -----------------------------------------------------------------
  % The MATLAB S-function uses an internal registry for all
  % block methods. You should register all relevant methods
  % (optional and required) as illustrated below. You may choose
  % any suitable name for the methods and implement these methods
  % as local functions within the same file.
  % -----------------------------------------------------------------
   
  % -----------------------------------------------------------------
  % Register the methods called during update diagram/compilation.
  % -----------------------------------------------------------------
  
%   % 
%   % CheckParameters:
%   %   Functionality    : Called in order to allow validation of the
%   %                      block dialog parameters. You are 
%   %                      responsible for calling this method
%   %                      explicitly at the start of the setup method.
%   %   C-Mex counterpart: mdlCheckParameters
%   %
   block.RegBlockMethod('CheckParameters', @CheckPrms);

%   %
%   % SetInputPortSamplingMode:
%   %   Functionality    : Check and set input and output port 
%   %                      attributes and specify whether the port is operating 
%   %                      in sample-based or frame-based mode
%   %   C-Mex counterpart: mdlSetInputPortFrameData.
%   %   (The DSP System Toolbox is required to set a port as frame-based)
%   %
%   block.RegBlockMethod('SetInputPortSamplingMode', @SetInpPortFrameData);
  
%   %
%   % SetInputPortDimensions:
%   %   Functionality    : Check and set the input and optionally the output
%   %                      port dimensions.
%   %   C-Mex counterpart: mdlSetInputPortDimensionInfo
%   %
%   block.RegBlockMethod('SetInputPortDimensions', @SetInpPortDims);

%   %
%   % SetOutputPortDimensions:
%   %   Functionality    : Check and set the output and optionally the input
%   %                      port dimensions.
%   %   C-Mex counterpart: mdlSetOutputPortDimensionInfo
%   %
%   block.RegBlockMethod('SetOutputPortDimensions', @SetOutPortDims);
  
%   %
%   % SetInputPortDatatype:
%   %   Functionality    : Check and set the input and optionally the output
%   %                      port datatypes.
%   %   C-Mex counterpart: mdlSetInputPortDataType
%   %
%   block.RegBlockMethod('SetInputPortDataType', @SetInpPortDataType);
  
%   %
%   % SetOutputPortDatatype:
%   %   Functionality    : Check and set the output and optionally the input
%   %                      port datatypes.
%   %   C-Mex counterpart: mdlSetOutputPortDataType
%   %
%   block.RegBlockMethod('SetOutputPortDataType', @SetOutPortDataType);
  
%   %
%   % SetInputPortComplexSignal:
%   %   Functionality    : Check and set the input and optionally the output
%   %                      port complexity attributes.
%   %   C-Mex counterpart: mdlSetInputPortComplexSignal
%   %
%   block.RegBlockMethod('SetInputPortComplexSignal', @SetInpPortComplexSig);
%   
%   %
%   % SetOutputPortComplexSignal:
%   %   Functionality    : Check and set the output and optionally the input
%   %                      port complexity attributes.
%   %   C-Mex counterpart: mdlSetOutputPortComplexSignal
%   %
%   block.RegBlockMethod('SetOutputPortComplexSignal', @SetOutPortComplexSig);
  
%   %
%   % PostPropagationSetup:
%   %   Functionality    : Set up the work areas and the state variables. You can
%   %                      also register run-time methods here.
%   %   C-Mex counterpart: mdlSetWorkWidths
%   %
%   block.RegBlockMethod('PostPropagationSetup', @DoPostPropSetup);
% 
%   % -----------------------------------------------------------------
%   % Register methods called at run-time
%   % -----------------------------------------------------------------
%   
%   % 
%   % ProcessParameters:
%   %   Functionality    : Call to allow an update of run-time parameters.
%   %   C-Mex counterpart: mdlProcessParameters
%   %  
%   block.RegBlockMethod('ProcessParameters', @ProcessPrms);

  % 
  % InitializeConditions:
  %   Functionality    : Call to initialize the state and the work
  %                      area values.
  %   C-Mex counterpart: mdlInitializeConditions
  % 
  block.RegBlockMethod('InitializeConditions', @InitializeConditions);
  
%   % 
%   % Start:
%   %   Functionality    : Call to initialize the state and the work
%   %                      area values.
%   %   C-Mex counterpart: mdlStart
%   %
%   block.RegBlockMethod('Start', @Start);

  % 
  % Outputs:
  %   Functionality    : Call to generate the block outputs during a
  %                      simulation step.
  %   C-Mex counterpart: mdlOutputs
  %
  block.RegBlockMethod('Outputs', @Outputs);

%   % 
%   % Update:
%   %   Functionality    : Call to update the discrete states
%   %                      during a simulation step.
%   %   C-Mex counterpart: mdlUpdate
%   %
%   block.RegBlockMethod('Update', @Update);

  % 
  % Derivatives:
  %   Functionality    : Call to update the derivatives of the
  %                      continuous states during a simulation step.
  %   C-Mex counterpart: mdlDerivatives
  %
  block.RegBlockMethod('Derivatives', @Derivatives);
  
%   % 
%   % Projection:
%   %   Functionality    : Call to update the projections during a
%   %                      simulation step.
%   %   C-Mex counterpart: mdlProjections
%   %
%   block.RegBlockMethod('Projection', @Projection);
  
%   % 
%   % SimStatusChange:
%   %   Functionality    : Call when simulation enters pause mode
%   %                      or leaves pause mode.
%   %   C-Mex counterpart: mdlSimStatusChange
%   %
%   block.RegBlockMethod('SimStatusChange', @SimStatusChange);
%   
%   % 
%   % Terminate:
%   %   Functionality    : Call at the end of a simulation for cleanup.
%   %   C-Mex counterpart: mdlTerminate
%   %
%   block.RegBlockMethod('Terminate', @Terminate);

%   %
%   % GetSimState:
%   %   Functionality    : Return the SimState of the block.
%   %   C-Mex counterpart: mdlGetSimState
%   %
%   block.RegBlockMethod('GetSimState', @GetSimState);
%   
%   %
%   % SetSimState:
%   %   Functionality    : Set the SimState of the block using a given value.
%   %   C-Mex counterpart: mdlSetSimState
%   %
%   block.RegBlockMethod('SetSimState', @SetSimState);

  % -----------------------------------------------------------------
  % Register the methods called during code generation.
  % -----------------------------------------------------------------
  
%   %
%   % WriteRTW:
%   %   Functionality    : Write specific information to model.rtw file.
%   %   C-Mex counterpart: mdlRTW
%   %
%   block.RegBlockMethod('WriteRTW', @WriteRTW);
% %endfunction

% -------------------------------------------------------------------
% The local functions below are provided to illustrate how you may implement
% the various block methods listed above.
% -------------------------------------------------------------------

 function CheckPrms(block)
     quad   = block.DialogPrm(1).Data;
     IC     = block.DialogPrm(2).Data;
%      if ~exist(model)
%        me = MSLException(block.BlockHandle, message('Simulink:blocks:invalidParameter'));
%        throw(me);
%      end
     
%     if ~strcmp(class(a), 'double')
%       me = MSLException(block.BlockHandle, message('Simulink:blocks:invalidParameter'));
%       throw(me);
%     end
% %endfunction
% 
% function ProcessPrms(block)
% 
%   block.AutoUpdateRuntimePrms;
%  
% %endfunction
% 
% function SetInpPortFrameData(block, idx, fd)
%   
%   block.InputPort(idx).SamplingMode = fd;
%   block.OutputPort(1).SamplingMode  = fd;
%   
% %endfunction
% 
% function SetInpPortDims(block, idx, di)
%   
%   block.InputPort(idx).Dimensions = di;
%   block.OutputPort(1).Dimensions  = di;
% 
% %endfunction
% 
% function SetOutPortDims(block, idx, di)
%   
%   block.OutputPort(idx).Dimensions = di;
%   block.InputPort(1).Dimensions    = di;
% 
% %endfunction
% 
% function SetInpPortDataType(block, idx, dt)
%   
%   block.InputPort(idx).DataTypeID = dt;
%   block.OutputPort(1).DataTypeID  = dt;
% 
% %endfunction
%   
% function SetOutPortDataType(block, idx, dt)
% 
%   block.OutputPort(idx).DataTypeID  = dt;
%   block.InputPort(1).DataTypeID     = dt;
% 
% %endfunction  
% 
% function SetInpPortComplexSig(block, idx, c)
%   
%   block.InputPort(idx).Complexity = c;
%   block.OutputPort(1).Complexity  = c;
% 
% %endfunction 
%   
% function SetOutPortComplexSig(block, idx, c)
% 
%   block.OutputPort(idx).Complexity = c;
%   block.InputPort(1).Complexity    = c;
% 
% %endfunction 
%     
% function DoPostPropSetup(block)
%
%   block.NumDworks = 2;
%   
%   block.Dwork(1).Name            = 'x1';
%   block.Dwork(1).Dimensions      = 1;
%   block.Dwork(1).DatatypeID      = 0;      % double
%   block.Dwork(1).Complexity      = 'Real'; % real
%   block.Dwork(1).UsedAsDiscState = true;
%   
%   block.Dwork(2).Name            = 'numPause';
%   block.Dwork(2).Dimensions      = 1;
%   block.Dwork(2).DatatypeID      = 7;      % uint32
%   block.Dwork(2).Complexity      = 'Real'; % real
%   block.Dwork(2).UsedAsDiscState = true;
%   
%   % Register all tunable parameters as runtime parameters.
%   block.AutoRegRuntimePrms;
% 
% %endfunction

function InitializeConditions(block)
% Initialize 12 States

IC = block.DialogPrm(2).Data;

% IC.P, IC.Q, IC.R are in deg/s ... convert to rad/s
P = IC.P*pi/180; Q = IC.Q*pi/180; R = IC.R*pi/180; 
% IC.Phi, IC.The, IC.Psi are in deg ... convert to rads
Phi = IC.Phi*pi/180; The = IC.The*pi/180; Psi = IC.Psi*pi/180;
U = IC.U; V = IC.V; W = IC.W; 
X = IC.X; Y = IC.Y; Z = IC.Z;

init = [P,Q,R,Phi,The,Psi,U,V,W,X,Y,Z];
for i=1:12
block.OutputPort(i).Data = init(i);
block.ContStates.Data(i) = init(i);
end

% function Start(block)
% 
%   block.Dwork(1).Data = 0;
%   block.Dwork(2).Data = uint32(1); 
%    
% %endfunction
% 
% function WriteRTW(block)
%   
%    block.WriteRTWParam('matrix', 'M',    [1 2; 3 4]);
%    block.WriteRTWParam('string', 'Mode', 'Auto');
   
%endfunction

function Outputs(block)
for i = 1:12;
  block.OutputPort(i).Data = block.ContStates.Data(i);
end

%endfunction

% function Update(block)
%   
%   block.Dwork(1).Data = block.InputPort(1).Data;
  
%endfunction

function Derivatives(block)
% Name all the states and motor inputs

% Load model data selected in parameter block
%which('model')

quad = block.DialogPrm(1).Data;

% P Q R in units of rad/sec
P = block.ContStates.Data(1);
Q = block.ContStates.Data(2);
R = block.ContStates.Data(3);
% Phi The Psi in radians
Phi = block.ContStates.Data(4);
The = block.ContStates.Data(5);
Psi = block.ContStates.Data(6);
% U V W in units of m/s
U = block.ContStates.Data(7);
V = block.ContStates.Data(8);
W = block.ContStates.Data(9);
% X Y Z in units of m
X = block.ContStates.Data(10);
Y = block.ContStates.Data(11);
Z = block.ContStates.Data(12);
% w values in rpm
w1 = block.InputPort(1).Data;
w2 = block.InputPort(2).Data;
w3 = block.InputPort(3).Data;
w4 = block.InputPort(4).Data;
w  = [w1; w2; w3; w4];

% CALCULATE MOMENT AND THRUST FORCES

Mb = (quad.dctcq*(w.^2)); % Total Moment due to motor speeds

Fb = [0; 0; sum(quad.ct*(w.^2))]; % Thrust due to motor speeds

% Obtain dP dQ dR
omb_bi = [P; Q; R];
OMb_bi = [ 0,-R, Q;
           R, 0,-P;
          -Q, P, 0];

b_omdotb_bi = quad.Jbinv*(Mb-OMb_bi*quad.Jb*omb_bi);
H_Phi = [1,tan(The)*sin(Phi), tan(The)*cos(Phi);
         0,         cos(Phi),         -sin(Phi);
         0,sin(Phi)/cos(The),cos(Phi)/cos(The)];   
Phidot = H_Phi*omb_bi;

% Compute Rotation Matrix

Rib = [cos(Psi)*cos(The) cos(Psi)*sin(The)*sin(Phi)-sin(Psi)*cos(Phi) cos(Psi)*sin(The)*cos(Phi)+sin(Psi)*sin(Phi);
       sin(Psi)*cos(The) sin(Psi)*sin(The)*sin(Phi)+cos(Psi)*cos(Phi) sin(Psi)*sin(The)*cos(Phi)-cos(Psi)*sin(Phi);
       -sin(The)         cos(The)*sin(Phi)                            cos(The)*cos(Phi)];

Ceb = Rib;
Cbe = Ceb';
ge = [0; 0; -quad.g];
gb = Cbe*ge; 

% Compute Velocity and Position derivatives of body frame
vb = [U;V;W];
b_dv = (1/quad.mass)*Fb+gb-OMb_bi*vb; % Acceleration in body frame (FOR VELOCITY)
i_dp = Ceb*vb; % Velocity of body frame w.r.t inertia frame (FOR POSITION)

dP = b_omdotb_bi(1);
dQ = b_omdotb_bi(2);
dR = b_omdotb_bi(3);
dPhi = Phidot(1);
dTheta = Phidot(2);
dPsi = Phidot(3);
dU = b_dv(1);
dV = b_dv(2);
dW = b_dv(3);
dX = i_dp(1);
dY = i_dp(2);
dZ = i_dp(3);
if (Z>0) % This implements a VERY ROUGH ground condition to keep altitude >=0;
    dZ = i_dp(3);
else if (dZ<=0)
    dZ = 0;
    block.ContStates.Data(12) = 0;
    end
end

f = [dP dQ dR dPhi dTheta dPsi dU dV dW dX dY dZ].';
  %This is the state derivative vector
block.Derivatives.Data = f;


%endfunction