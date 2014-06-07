function varargout = QuadAnim4(varargin)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %{
 This GUI provides an "animation-like" view of simulation output.

    Additional quadcopter modeling and simulation materials available at:
    github.com/dch33/Quad-Sim

Copyright (C) 2014 D. Hartman, K. Landis, S. Moreno, J. Kim, M. Mehrer

License:
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU LESSER GENERAL PUBLIC LICENSE as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU LESSER GENERAL PUBLIC LICENSE
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{
Quadcopter "Animation" GUI.
(c) David Hartman, 2014

If you're looking in this code for "answers" or a quick fix...good luck.
Though I've tried to add some comments throughout, altering this code is 
likely to be an unpleasant exercise.
If it's any consolation, it wasn't very fun to make this mess either :P
I hope to release a more clearly written and faster version of this
code sometime in the future. Or feel free to do it for me and email it to
me!! Please!?!
%}

%.

% QuadAnim4 MATLAB code for QuadAnim4.fig
%      QuadAnim4, by itself, creates a new QuadAnim4 or raises the existing
%      singleton*.
%
%      H = QuadAnim4 returns the handle to a new QuadAnim4 or the handle to
%      the existing singleton*.
%
%      QuadAnim4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in QuadAnim4.M with the given input arguments.
%
%      QuadAnim4('Property','Value',...) creates a new QuadAnim4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before QuadAnim4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to QuadAnim4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help QuadAnim4

% Last Modified by GUIDE v2.5 30-Apr-2014 10:38:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @QuadAnim4_OpeningFcn, ...
                   'gui_OutputFcn',  @QuadAnim4_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before QuadAnim4 is made visible.
function QuadAnim4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to QuadAnim4 (see VARARGIN)

% Choose default command line output for QuadAnim4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
handles.AZval = get(handles.AZslider,'Value')*360; % Get azimuth view in degrees
handles.ELval = get(handles.ELslider,'Value')*90;
handles.j     = 1; % Initialize animation frame counting variable
handles.skipFlag = 0;
% Move GUI to center of screen
movegui('center')
% This sets up the initial plot - only do when we are invisible
% so window can get raised using QuadAnim4.
A = evalin('base', 'yout');
% Generate the geometry used to draw the quadcopter
r = .5; d = 1.25; h = .25; %inches: rotor dia., quad motor distance from 
% center of mass, and rotor height above arms (entirely cosmetic)
a = 1; b = 1; c = 0.2; % Top , bottom, and sides lengths of hub (?)

% Construct rotor representations
N = [d  0 h].';% m1 rotor center [X Y Z]
E = [0 -d h].';% m4 rotor center
W = [0  d h].';% m2 rotor center
S = [-d 0 h].';% m3 rotor center
Nr = circlePoints(N, r, 10); Nr = [Nr Nr(:,1)]; % Rotor blade circles
Er = circlePoints(E, r, 10); Er = [Er Er(:,1)];
Wr = circlePoints(W, r, 10); Wr = [Wr Wr(:,1)];
Sr = circlePoints(S, r, 10); Sr = [Sr Sr(:,1)];
% Motors connecting to center of blade circles
mN = [d,d;
      0,0;
      h,0];
mE = [0,0;
     -d,-d;
      h,0];
mW = [0,0;
      d,d;
      h,0];
mS = [-d,-d;
       0,0;
       h,0];
% Construct body plot points
bNS = [ d, -d;
        0,  0;
        0,  0]; %For drawing the body "X" shape
bEW = [ 0,  0;
        d, -d;
        0,  0];
% Body (HUB) Squares
Top = [ a/2,   0,-a/2,   0;
          0, b/2,   0,-b/2;
        c/2, c/2, c/2, c/2];
Bot = vertcat(Top(1:2,:),-Top(3,:)); % Bot is same as top just below the center of mass
NEB = [ a/2, a/2,   0,   0;
          0,   0, b/2, b/2;
        c/2,-c/2,-c/2, c/2]; % By the way... north east is actually north west from above since x is north and y is east :P
NWB = [ a/2, a/2,   0,   0;
          0,   0,-b/2,-b/2;
        c/2,-c/2,-c/2, c/2];
SEB = -NWB;
SWB = -NEB;

phi = A(1,4);
the = A(1,5);
psi = A(1,6);

% ROTATION MATRIX --- ZYX ROTATION (R = Rib)
R = [cos(psi)*cos(the) cos(psi)*sin(the)*sin(phi)-sin(psi)*cos(phi) cos(psi)*sin(the)*cos(phi)+sin(psi)*sin(phi);
       sin(psi)*cos(the) sin(psi)*sin(the)*sin(phi)+cos(psi)*cos(phi) sin(psi)*sin(the)*cos(phi)-cos(psi)*sin(phi);
       -sin(the)         cos(the)*sin(phi)                            cos(the)*cos(phi)];

% Rotate body frame velocity vector
U = A(:,7);
V = A(:,8);
W = A(:,9);
Vi = zeros(length(A),3);
MvMax= max(sqrt(U.^2+V.^2+W.^2)); 
Vb = 3/MvMax*[U(1), V(1), W(1)]'; % Scale velocity
Vi(1,:) = R*Vb; % Rotate velocity vector to inertial frame for plotting

% Support for X-configuration nifty trick (Requires that quadModel
% structure is in base workspace)
if (~evalin('base','quadModel.plusConfig'))
    Rz = [ sqrt(2)/2, sqrt(2)/2, 0;
          -sqrt(2)/2,sqrt(2)/2, 0;
                   0,          0, 1];
    Nr = Rz*Nr;
    Er = Rz*Er;
    Wr = Rz*Wr;
    Sr = Rz*Sr;
    mN = Rz*mN;
    mE = Rz*mE;
    mW = Rz*mW;
    mS = Rz*mS;
    bNS = Rz*bNS;
    bEW = Rz*bEW;
    Top = Rz*Top;
    Bot = Rz*Bot;
    NEB = Rz*NEB;
    NWB = Rz*NWB;
    SWB = Rz*SWB;
    SEB = Rz*SEB;
end

% Rotate body parts Via Initialized R
NrR = R*Nr;
ErR = R*Er;
WrR = R*Wr;
SrR = R*Sr;
mNr = R*mN;
mEr = R*mE;
mWr = R*mW;
mSr = R*mS;
bNSR = R*bNS;
bEWR = R*bEW;
TopR = R*Top;
BotR = R*Bot;
NEBR = R*NEB;
NWBR = R*NWB;
SWBR = R*SWB;
SEBR = R*SEB;

% Plot the box rotation and ang. velocity and inertial frame velocity
% vector
axes(handles.axes1)
plot3(bNSR(1,:),bNSR(2,:),bNSR(3,:),'b','LineWidth',3) % Body Arm
hold on
plot3(bEWR(1,:),bEWR(2,:),bEWR(3,:),'b','LineWidth',3) % Body Arm
plot3(mNr(1,:),mNr(2,:),mNr(3,:),'k','LineWidth',4) % Motor
plot3(mEr(1,:),mEr(2,:),mEr(3,:),'k','LineWidth',4) % Motor
plot3(mWr(1,:),mWr(2,:),mWr(3,:),'k','LineWidth',4) % Motor
plot3(mSr(1,:),mSr(2,:),mSr(3,:),'k','LineWidth',4) % Motor
plot3(NrR(1,:),NrR(2,:),NrR(3,:),'g') % Motor 1 blades
plot3(ErR(1,:),ErR(2,:),ErR(3,:),'k') % Motor 4 blades
plot3(WrR(1,:),WrR(2,:),WrR(3,:),'k') % Motor 2 blades
plot3(SrR(1,:),SrR(2,:),SrR(3,:),'g') % Motor 3 blades
grey = [0.5 0.5 0.5];
top = fill3(TopR(1,:),TopR(2,:),TopR(3,:),'r'); alpha(top,0.8); % Top Surface
bot = fill3(BotR(1,:),BotR(2,:),BotR(3,:),'g'); alpha(bot,0.8); % Bottom Surface
ne  = fill3(NEBR(1,:),NEBR(2,:),NEBR(3,:),'c'); alpha(ne,0.8); % North East surface
nw  = fill3(NWBR(1,:),NWBR(2,:),NWBR(3,:),grey); alpha(nw,0.8); % North West surface
sw  = fill3(SWBR(1,:),SWBR(2,:),SWBR(3,:),grey); alpha(sw,0.8); % South West surface
se  = fill3(SEBR(1,:),SEBR(2,:),SEBR(3,:),grey); alpha(se,0.8); % South East surface
axis square
xlabel('X')
ylabel('Y')
zlabel('Z')
xlim([-3 3])
ylim([-3 3])
zlim([-3 3])
view(handles.AZval,handles.ELval)
grid on

omi = zeros(length(A),3); % Initialize omega inertiaF points array (L(A)x3)
P = A(:,1); Q = A(:,2); Rw = A(:,3);
MombMax = max(sqrt(P.^2+Q.^2+Rw.^2)); % Calculate max magnitude of omb
omb = 3/MombMax*[P,Q,Rw].'; % Store and scale current omega bodyF
omi(1,:) = R*omb(:,1); % Rotate omegab to inertiaF store in omegai array
qp1 = quiver3(0,0,0,omi(1,1),omi(1,2),omi(1,3),'ro');
qp2 = quiver3(0,0,0,Vi(1,1),Vi(1,2),Vi(1,3),'k');
hold off
% legend([qp1 qp2],'Angular Velocity','I-Frame Velocity','Location',...
%      'SouthOutside')
%  pp1 = plot3(omi(1,1),omi(1,2),omi(1,3),'b.');
%  pp2 = plot3(Vi(1,1),Vi(1,2),Vi(1,3),'k.');
%  legend([qp1 qp2 pp1 pp2],'Angular Velocity','I-Frame Velocity',...
%      'Ang. Vel. Track','I-Frame Vel. Track','Location','SouthOutside')
% hold off

minX = min(A(:,10))*3.28;
minY = min(A(:,11))*3.28;
% minZ = min(A(:,12))*3.28;
maxX = max(A(:,10))*3.28;
maxY = max(A(:,11))*3.28;
maxZ = max(A(:,12))*3.28;

% Plot the three dimensional trajectory of the box
axes(handles.axes2)
X = A(1:1,10)*3.28; Y = A(1:1,11)*3.28; Z = A(1:1,12)*3.28;
scatter3(X,Y,Z,36,'blue')
hold on
fill3([minX-1 maxX+1 maxX+1 minX-1],...
    [minY-1 minY-1 maxY+1 maxY+1],...
    [0 0 0 0],'g');
%alpha(0.7);
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
xlim([minX-1 maxX+1])
ylim([minY-1 maxY+1])
zlim([-0.1 maxZ+1])
view(handles.AZval,handles.ELval)
axis square
grid on
hold off

% phi_A = A(:,4);
% the_A = A(:,5);
% psi_A = A(:,6);

% Choose default command line output for animationGUI2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes QuadAnim4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = QuadAnim4_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in startStop.
function startStop_Callback(hObject, eventdata, handles)
% hObject    handle to startStop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plotAnim(hObject, handles) % Pass handle to start/stop button to plot function



% --- Executes on slider movement.
function ELslider_Callback(hObject, eventdata, handles)
% hObject    handle to ELslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.ELval = get(hObject,'Value')*90; % Set elevation view in degrees
handles.AZval = get(handles.AZslider,'Value')*360; % Set aximuth view in degrees
view(handles.axes1,handles.AZval,handles.ELval);
view(handles.axes2,handles.AZval,handles.ELval);
drawnow
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function ELslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ELslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function AZslider_Callback(hObject, eventdata, handles)
% hObject    handle to AZslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.AZval = get(hObject,'Value')*360; % Set azimuth view in degrees
handles.ELval = get(handles.ELslider,'Value')*90; % Set elevation view in degrees
view(handles.axes1,handles.AZval,handles.ELval);
view(handles.axes2,handles.AZval,handles.ELval);
drawnow
guidata(hObject,handles);



% --- Executes during object creation, after setting all properties.
function AZslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AZslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


function points = circlePoints(center, radius, numberOfPoints)
% Helper function for plotting points
% Inspired by "circle()" from Peter Corke's MATLAB Robotics Toolbox
c = center.'; % [x;y] location of center
r = radius;
n = numberOfPoints;
% compute points around the circumference
th = (0:n-1)'/n*2*pi; % angles coresponding to each point
x = r*cos(th) + c(1); % x part
y = r*sin(th) + c(2); % y part
points = [x,y].';
    if length(c) > 2
        z = ones(size(x))*c(3); % z part
        points = [x, y, z].';
    end



function frameSkips_Callback(hObject, eventdata, handles)
% hObject    handle to frameSkips (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of frameSkips as text
%        str2double(get(hObject,'String')) returns contents of frameSkips as a double
handles.frameSkipVal = str2double(get(hObject,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function frameSkips_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frameSkips (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.frameSkipVal = str2double(get(hObject,'String'));
guidata(hObject,handles);

function plotAnim(button, handles)
hObject = button;
mode = get(hObject,'String');
handles = guidata(gcbo);
j = handles.j;
if strcmp(mode,'Start')
    set(hObject,'String','Stop')
    guidata(hObject,handles)
    A = evalin('base', 'yout');
    tout = evalin('base', 'tout');
    frameSkipVal = str2double(get(handles.frameSkips,'String'))+1; % Size of steps to take for plotting animation (1 plots 
    % every frame, 2 about every other, etc.
    

    r = .5; d = 1.25; h = .25; %inches: rotor dia., quad motor distance from 
    % cm, and rotor height above arms (entirely cosmetic)
    a = 1; b = 1; c = 0.2;

    % Construct rotor representations
    N = [d  0 h].';% m1 rotor center
    E = [0 -d h].';% m4 rotor center
    W = [0  d h].';% m2 rotor center
    S = [-d 0 h].';% m3 rotor center
    Nr = circlePoints(N, r, 20); Nr = [Nr Nr(:,1)]; % Rotor blade circles
    Er = circlePoints(E, r, 20); Er = [Er Er(:,1)];
    Wr = circlePoints(W, r, 20); Wr = [Wr Wr(:,1)];
    Sr = circlePoints(S, r, 20); Sr = [Sr Sr(:,1)];
    % Motors connecting to center of blade circles
    mN = [d,d;
          0,0;
          h,0];
    mE = [0,0;
         -d,-d;
          h,0];
    mW = [0,0;
          d,d;
          h,0];
    mS = [-d,-d;
           0,0;
           h,0];
    % Construct body plot points
    bNS = [ d, -d;
            0,  0;
            0,  0]; %For drawing the body "X" shape
    bEW = [ 0,  0;
            d, -d;
            0,  0];
    % Body
    Top = [ a/2,   0,-a/2,   0;
              0, b/2,   0,-b/2;
            c/2, c/2, c/2, c/2];
    Bot = vertcat(Top(1:2,:),-Top(3,:));
    NEB = [ a/2, a/2,   0,   0;
          0,   0, b/2, b/2;
        c/2,-c/2,-c/2, c/2];
    NWB = [ a/2, a/2,   0,   0;
              0,   0,-b/2,-b/2;
            c/2,-c/2,-c/2, c/2];
    SEB = -NWB;
    SWB = -NEB;

    phi = A(1,4);
    the = A(1,5);
    psi = A(1,6);
    % Rib
    R = [cos(psi)*cos(the) cos(psi)*sin(the)*sin(phi)-sin(psi)*cos(phi) cos(psi)*sin(the)*cos(phi)+sin(psi)*sin(phi);
           sin(psi)*cos(the) sin(psi)*sin(the)*sin(phi)+cos(psi)*cos(phi) sin(psi)*sin(the)*cos(phi)-cos(psi)*sin(phi);
           -sin(the)         cos(the)*sin(phi)                            cos(the)*cos(phi)];
    
    % Support for X-configuration
    if (~evalin('base','quadModel.plusConfig'))
        Rz = [ sqrt(2)/2, sqrt(2)/2, 0;
               -sqrt(2)/2,sqrt(2)/2, 0;
                       0,          0, 1];
        Nr=Rz*Nr;
        Er=Rz*Er;
        Wr=Rz*Wr;
        Sr=Rz*Sr;
        mN = Rz*mN;
        mE = Rz*mE;
        mW = Rz*mW;
        mS = Rz*mS;
        bNS = Rz*bNS;
        bEW = Rz*bEW;
        Top = Rz*Top;
        Bot = Rz*Bot;
        NEB = Rz*NEB;
        NWB = Rz*NWB;
        SWB = Rz*SWB;
        SEB = Rz*SEB;
    end
    
    % Bring in and rotate body frame velocity vector
    U = A(:,7);
    V = A(:,8);
    W = A(:,9);
    Vi = zeros(length(A),3);
    MvMax= max(sqrt(U.^2+V.^2+W.^2)); 
    Vb = 3/MvMax*[U, V, W].'; % Scale velocity vector points for plotting
    Vi(1,:) = R*Vb(:,1); % Rotate velocity vector to inertial frame for plotting
    % Angular Velocity Vector
    P = A(:,1); 
    Q = A(:,2); 
    Rw = A(:,3);
    omi = zeros(length(A),3); % Initialize omega inertiaF points array (L(A)x3)
    MombMax = max(sqrt(P.^2+Q.^2+Rw.^2)); % Calculate max magnitude of omb
    omb = 3/MombMax*[P,Q,Rw].'; % Store and scale current omega bodyF
    omi(1,:) = R*omb(:,1); % Rotate omegab to inertiaF store in omegai array

    phi = A(:,4);
    the= A(:,5);
    psi = A(:,6);

    % Next we run through the points in the vector A as an
    % animation until we get a command to stop
    minX = min(A(:,10))*3.28; % meters to feet
    minY = min(A(:,11))*3.28;
    %minZ = min(A(:,12))*3.28;
    maxX = max(A(:,10))*3.28;
    maxY = max(A(:,11))*3.28;
    maxZ = max(A(:,12))*3.28;
    colors = jet(length(A(:,10))); % color the path for time info
    
    % Precompute R
    % ROTATION MATRIX BELOW --- ZYX ROTATION
    R = cell(length(A),1); % create empty cell array for R matrices
    for i = 1:length(A)
    R{i,1} = [cos(psi(i))*cos(the(i)) cos(psi(i))*sin(the(i))*sin(phi(i))-sin(psi(i))*cos(phi(i)) cos(psi(i))*sin(the(i))*cos(phi(i))+sin(psi(i))*sin(phi(i));
              sin(psi(i))*cos(the(i)) sin(psi(i))*sin(the(i))*sin(phi(i))+cos(psi(i))*cos(phi(i)) sin(psi(i))*sin(the(i))*cos(phi(i))-cos(psi(i))*sin(phi(i));
              -sin(the(i))         cos(the(i))*sin(phi(i))                            cos(the(i))*cos(phi(i))];
    end
    % set up a j vector to straighten out skipping issues
%     if (skipFlag == 1)
%         jSkip = 1:frameSkipVal:j;
%     end
    while ( strcmp(get(hObject,'String'),'Stop'))
        handles = guidata(gcbo);
        j = handles.j;
        
        guidata(hObject,handles); % Update handles data
        Vi(j,:) = R{j,1}*Vb(:,j);

        NrR = R{j,1}*Nr;
        ErR = R{j,1}*Er;
        WrR = R{j,1}*Wr;
        SrR = R{j,1}*Sr;
        bNSR = R{j,1}*bNS;
        bEWR = R{j,1}*bEW;
        TopR = R{j,1}*Top;
        BotR = R{j,1}*Bot;
        % Rotate body parts Via Initialized R
        mNr = R{j,1}*mN;
        mEr = R{j,1}*mE;
        mWr = R{j,1}*mW;
        mSr = R{j,1}*mS;
        NEBR = R{j,1}*NEB;
        NWBR = R{j,1}*NWB;
        SWBR = R{j,1}*SWB;
        SEBR = R{j,1}*SEB;

        % Plot the quad rotation and ang. velocity and inertial frame velocity vector
        axes(handles.axes1)
        plot3(bNSR(1,:),bNSR(2,:),bNSR(3,:),'b','LineWidth',3)
        hold on
        plot3(bEWR(1,:),bEWR(2,:),bEWR(3,:),'b','LineWidth',3)
        plot3(NrR(1,:),NrR(2,:),NrR(3,:),'g')
        plot3(ErR(1,:),ErR(2,:),ErR(3,:),'k')
        plot3(WrR(1,:),WrR(2,:),WrR(3,:),'k')
        plot3(SrR(1,:),SrR(2,:),SrR(3,:),'g')
        plot3(mNr(1,:),mNr(2,:),mNr(3,:),'k','LineWidth',4) % Motor
        plot3(mEr(1,:),mEr(2,:),mEr(3,:),'k','LineWidth',4) % Motor
        plot3(mWr(1,:),mWr(2,:),mWr(3,:),'k','LineWidth',4) % Motor
        plot3(mSr(1,:),mSr(2,:),mSr(3,:),'k','LineWidth',4) % Motor
        fill3(TopR(1,:),TopR(2,:),TopR(3,:),'r'); alpha(0.8);
        fill3(BotR(1,:),BotR(2,:),BotR(3,:),'g'); alpha(0.8);
        grey = [0.5 0.5 0.5];
        ne  = fill3(NEBR(1,:),NEBR(2,:),NEBR(3,:),'c'); alpha(ne,0.8); % North East surface
        nw  = fill3(NWBR(1,:),NWBR(2,:),NWBR(3,:),grey); alpha(nw,0.8); % North West surface
        sw  = fill3(SWBR(1,:),SWBR(2,:),SWBR(3,:),grey); alpha(sw,0.8); % South West surface
        se  = fill3(SEBR(1,:),SEBR(2,:),SEBR(3,:),grey); alpha(se,0.8); % South East surface
        xlabel('X')
        ylabel('Y')
        zlabel('Z')
        xlim([-3 3])
        ylim([-3 3])
        zlim([-3 3])
        % set(gca,'Color',[215/255 244/255 247/255]) % This is a technique
        % that can be used for setting the plot background color
        handles.AZval = get(handles.AZslider,'Value')*360;
        handles.ELval = get(handles.ELslider,'Value')*90;
        view(handles.axes1,handles.AZval,handles.ELval)
%         P = A(j,1); Q = A(j,2); Rw = A(j,3);
%         M = sqrt(P^2+Q^2+Rw^2);
%         omb = 3/M*[P,Q,Rw].';%/M; % Scaling of angular velocity vector
        omi(j,:) = R{j,1}*omb(:,j);
        qp1 = quiver3(0,0,0,omi(j,1),omi(j,2),omi(j,3),'r');
        qp2 = quiver3(0,0,0,Vi(j,1),Vi(j,2),Vi(j,3),'k');
        axis square
        grid on
        hold off
        drawnow
        
        % Plot the three dimensional trajectory of the box
        if (j==1)
            cla(handles.axes2)
        else if (handles.skipFlag==1)
                cla(handles.axes2)
                X = A(1:frameSkipVal:j,10)*3.28; 
                Y = A(1:frameSkipVal:j,11)*3.28; 
                Z = A(1:frameSkipVal:j,12)*3.28;
                axes(handles.axes2)
                hold on
                scatter3(X,Y,Z,36,colors(1:frameSkipVal:j,:)); 
            end
        end
        % Ordinary plotting sequence (one frame at a time using hold on to
        % create persistance
        X = A(j,10)*3.28; Y = A(j,11)*3.28; Z = A(j,12)*3.28;
        axes(handles.axes2)
        hold on
        scatter3(X,Y,Z,36,colors(j,:));
        if (j == 1 || handles.skipFlag==1)
            fill3([minX-1 maxX+1 maxX+1 minX-1],...
                  [minY-1 minY-1 maxY+1 maxY+1],...
                  [0 0 0 0],'g'); % make a plane to represent the ground (Z = 0)
            alpha(0.7); % Makes the ground "see-through"
            handles.skipFlag = 0;
            guidata(hObject,handles)
        end
        xlabel('X (ft)')
        ylabel('Y (ft)')
        zlabel('Z (ft)')
        xlim([minX-1 maxX+1])
        ylim([minY-1 maxY+1])
        zlim([-0.1 maxZ+1]) % Keep ground within view
        % These calls are necessarry to avoid stutter in the frames if adjusting slider while animation is running
        handles.AZval = get(handles.AZslider,'Value')*360; 
        handles.ELval = get(handles.ELslider,'Value')*90;
        view(handles.axes2,handles.AZval,handles.ELval) % Set the current vie
        axis square
%         axis equal
%         xlimz = xlim;
%         ylimz = ylim;
%                     fill3([xlimz(1) xlimz(2) xlimz(2) xlimz(1)],...
%                   [ylimz(1) ylimz(1) ylimz(2) ylimz(2)],...
%                   [0 0 0 0],'k'); % make a plane to represent the ground (Z = 0)
%             alpha(0.9); % Makes the ground "see-through"
        grid on
        drawnow
        hold off
%         if (firstRunFlag==1)
%             firstRunFlag = 0;
%         end
        if (j == size(A,1)) % If we've reached the last group of data
            handles.j = 1; % Reset j to 1
            set(hObject,'String','Start'); % Reset button state
            guidata(hObject,handles);
            return % exit the function
            
        else if (j+frameSkipVal<size(A,1)) % If the next index won't exceed total frames...
        j = j+frameSkipVal; % increase the index by frame skip value
            else
            j = size(A,1); % We're almost out of data so to the last value for the final plot
            end
        end
        set(handles.simTime,'String',num2str(tout(j))); % update time display
        handles = guidata(gcbo); % update handles structure again...
        if (handles.skipFlag == 1)
            guidata(hObject,handles) % this nightmare is used to catch skip events which otherwise tend to go unheeded.
            return
        else
        handles.j = j; % store j as a handles value for persistance
        guidata(hObject,handles); 
        end
    end
    else if strcmp(get(hObject,'String'),'Stop')
        set(hObject,'String','Start');
        end
end


% --- Executes during object creation, after setting all properties.
function simTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to simTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes on button press in XYview.
function XYview_Callback(hObject, eventdata, handles)
% hObject    handle to XYview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.ELslider,'Value',1);
set(handles.AZslider,'Value',0);
view(handles.axes1,0,90);
view(handles.axes2,0,90);
drawnow
guidata(hObject,handles);


% --- Executes on button press in XZview.
function XZview_Callback(hObject, eventdata, handles)
% hObject    handle to XZview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.ELslider,'Value',0);
set(handles.AZslider,'Value',0);
view(handles.axes1,0,0);
view(handles.axes2,0,0);
drawnow
guidata(hObject,handles);


% --- Executes on button press in YZview.
function YZview_Callback(hObject, eventdata, handles)
% hObject    handle to YZview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.ELslider,'Value',0);
set(handles.AZslider,'Value',90/360);
view(handles.axes1,90,0);
view(handles.axes2,90,0);
drawnow
guidata(hObject,handles);


% --- Executes on button press in defaultView.
function defaultView_Callback(hObject, eventdata, handles)
% hObject    handle to defaultView (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.ELslider,'Value',25/90);
set(handles.AZslider,'Value',35/360)
view(handles.axes1,35,25);
view(handles.axes2,35,25);
drawnow
guidata(hObject,handles);


% --- Executes on button press in timeSkipButton.
function timeSkipButton_Callback(hObject, eventdata, handles)
% hObject    handle to timeSkipButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.startStop,'String','Start');
tout = evalin('base', 'tout');
TimeSkip = str2double(get(handles.timeSkipEditBox,'String'));
handles.j = find(tout<=TimeSkip, 1,'last');
handles.skipFlag = 1;
% if handles.doubleRunFlag == 0
%     timeSkipButton_Callback(hObject, eventdata, handles) % run it again
% end
% handles.doubleRunFlag = 1;
guidata(hObject,handles);
% yes i'm seriously resorting to this...





function timeSkipEditBox_Callback(hObject, eventdata, handles)
% hObject    handle to timeSkipEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timeSkipEditBox as text
%        str2double(get(hObject,'String')) returns contents of timeSkipEditBox as a double
handles.TimeSkip = str2double(get(hObject,'String'));
handles.skipFlag = 0;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function timeSkipEditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeSkipEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.TimeSkip = 0;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
