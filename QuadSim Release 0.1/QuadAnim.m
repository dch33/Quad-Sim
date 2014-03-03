function varargout = QuadAnim(varargin)
% QUADANIM MATLAB code for QuadAnim.fig
%      QUADANIM, by itself, creates a new QUADANIM or raises the existing
%      singleton*.
%
%      H = QUADANIM returns the handle to a new QUADANIM or the handle to
%      the existing singleton*.
%
%      QUADANIM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in QUADANIM.M with the given input arguments.
%
%      QUADANIM('Property','Value',...) creates a new QUADANIM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before QuadAnim_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to QuadAnim_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help QuadAnim

% Last Modified by GUIDE v2.5 28-Feb-2014 00:06:31

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

% The following functions were adapted from Peter Corke's Robotics Toolbox (rvctools),
% and are covered under the Lesser GNU General Public License.
%	- circle.m (adapted into the GUI program below)
% 	- tb_optparse.m (helper function for circle.m)
%
%	The full toolbox is available for free download from the author at:
% 	http://www.petercorke.com/Home.html


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @QuadAnim_OpeningFcn, ...
                   'gui_OutputFcn',  @QuadAnim_OutputFcn, ...
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

% --- Executes just before QuadAnim is made visible.
function QuadAnim_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to QuadAnim (see VARARGIN)

% Choose default command line output for QuadAnim
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
handles.AZval = get(handles.AZslider,'Value')*360; % Get azimuth view in degrees
handles.ELval = get(handles.ELslider,'Value')*90;

% Move GUI to center of screen
movegui('center')

A = evalin('base', 'A');
% Generate the geometry used to draw the quadcopter
r = .5; d = 1.25; h = .25; %inches: rotor dia., quad motor distance from 
% center of mass, and rotor height above arms (entirely cosmetic)
a = 1; b = 1; c = 0.2; % Top , bottom, and sides lengths of hub

% Construct rotor representations
N = [d  0 h].';% m1 rotor center [X Y Z]
E = [0 -d h].';% m4 rotor center
W = [0  d h].';% m2 rotor center
S = [-d 0 h].';% m3 rotor center
Nr = circle2(N, r, 'n', 10); Nr = [Nr Nr(:,1)]; % Rotor blade circles
Er = circle2(E, r, 'n', 10); Er = [Er Er(:,1)];
Wr = circle2(W, r, 'n', 10); Wr = [Wr Wr(:,1)];
Sr = circle2(S, r, 'n', 10); Sr = [Sr Sr(:,1)];

% Construct body plot points
bNS = [ d, -d;
        0,  0;
        0,  0]; %For drawing the body "X" shape
bEW = [ 0,  0;
        d, -d;
        0,  0];
% Body (HUB)
Top = [ a/2,   0,-a/2,   0;
          0, b/2,   0,-b/2;
        c/2, c/2, c/2, c/2];
Bot = vertcat(Top(1:2,:),-Top(3,:)); % Bot is same as top just below the center of mass

phi = A(1,4);
the = A(1,5);
psi = A(1,6);

% Construct Rotation Matrix
Rib = [cos(psi)*cos(the) cos(psi)*sin(the)*sin(phi)-sin(psi)*cos(phi) cos(psi)*sin(the)*cos(phi)+sin(psi)*sin(phi);
       sin(psi)*cos(the) sin(psi)*sin(the)*sin(phi)+cos(psi)*cos(phi) sin(psi)*sin(the)*cos(phi)-cos(psi)*sin(phi);
       -sin(the)         cos(the)*sin(phi)                            cos(the)*cos(phi)];
R = Rib;

% Bring in and rotate body frame velocity vector
U = A(1,7);
V = A(1,8);
W = A(1,9);
Vi = zeros(length(A),3);
Mv= sqrt(U^2+V^2+W^2); 
Vb = 2*[U, V, W]'/Mv; % Scale velocity
Vi(1,:) = R*Vb; % Rotate velocity vector to inertial frame for plotting

% Rotate body parts Via Initialized R
NrR=R*Nr;
ErR=R*Er;
WrR=R*Wr;
SrR=R*Sr;
bNSR = R*bNS;
bEWR = R*bEW;
TopR = R*Top;
BotR = R*Bot;

% Plot the box rotation and ang. velocity and inertial frame velocity vector
axes(handles.axes1)
plot3(bNSR(1,:),bNSR(2,:),bNSR(3,:),'b','LineWidth',3)
hold on
plot3(bEWR(1,:),bEWR(2,:),bEWR(3,:),'b','LineWidth',3)
plot3(NrR(1,:),NrR(2,:),NrR(3,:),'r')
plot3(ErR(1,:),ErR(2,:),ErR(3,:),'k')
plot3(WrR(1,:),WrR(2,:),WrR(3,:),'c')
plot3(SrR(1,:),SrR(2,:),SrR(3,:),'k')
fill3(TopR(1,:),TopR(2,:),TopR(3,:),'r'); alpha(0.6);
fill3(BotR(1,:),BotR(2,:),BotR(3,:),'g'); alpha(0.6);
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
P = A(1,1); Q = A(1,2); Rw = A(1,3);
M = sqrt(P^2+Q^2+Rw^2); % Calculate magnitude of omb
omb = 2*[P,Q,Rw]'/M; % Store and scale current omega bodyF
omi(1,:) = R*omb; % Rotate omegab to inertiaF store in omegai array
qp1 = quiver3(0,0,0,omi(1,1),omi(1,2),omi(1,3),'ro');
qp2 = quiver3(0,0,0,Vi(1,1),Vi(1,2),Vi(1,3),'k');
hold off

minX = min(A(:,10))*3.28;
minY = min(A(:,11))*3.28;
minZ = min(A(:,12))*3.28;
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
alpha(0.7);
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

% UIWAIT makes QuadAnim wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = QuadAnim_OutputFcn(hObject, eventdata, handles)
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

function out = circle2(centre, rad, varargin)

	opt.n = 50;
    
    [opt,arglist] = tb_optparse(opt, varargin);

    % compute points on circumference
	th = [0:opt.n-1]'/ opt.n*2*pi;
    x = rad*cos(th) + centre(1);
    y = rad*sin(th) + centre(2);

    % add extra row if z-coordinate is specified, but circle is always in xy plane
    if length(centre) > 2
        z = ones(size(x))*centre(3);
        p = [x y z]';
    else
        p = [x y]';
    end

    if nargout > 0
        % return now
        out = p;
        return;
    else
        % else plot the circle
        p = [p p(:,1)]; % make it close
        if numrows(p) > 2
            plot3(p(1,:), p(2,:), p(3,:), arglist{:});
        else
            plot(p(1,:), p(2,:), arglist{:});
        end
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
if strcmp(mode,'Start')
    set(hObject,'String','Stop')
    guidata(hObject,handles)
    A = evalin('base', 'A');
    tout = evalin('base', 'tout');
    
    % Size of steps to take for plotting animation (1 plots 
    % every frame, 2 about every other, etc.)
    frameSkipVal = str2double(get(handles.frameSkips,'String'))+1; 

    r = .5; d = 1.25; h = .25; %inches: rotor dia., quad motor distance from 
    % cm, and rotor height above arms (entirely cosmetic)
    a = 1; b = 1; c = 0.2;

    % Construct rotor representations
    N = [d  0 h].';% m1 rotor center
    E = [0 -d h].';% m4 rotor center
    W = [0  d h].';% m2 rotor center
    S = [-d 0 h].';% m3 rotor center
    Nr = circle2(N, r, 'n', 20); Nr = [Nr Nr(:,1)]; % Rotor blade circles
    Er = circle2(E, r, 'n', 20); Er = [Er Er(:,1)];
    Wr = circle2(W, r, 'n', 20); Wr = [Wr Wr(:,1)];
    Sr = circle2(S, r, 'n', 20); Sr = [Sr Sr(:,1)];

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

    phi = A(1,4);
    the = A(1,5);
    psi = A(1,6);

    Rib = [cos(psi)*cos(the) cos(psi)*sin(the)*sin(phi)-sin(psi)*cos(phi) cos(psi)*sin(the)*cos(phi)+sin(psi)*sin(phi);
           sin(psi)*cos(the) sin(psi)*sin(the)*sin(phi)+cos(psi)*cos(phi) sin(psi)*sin(the)*cos(phi)-cos(psi)*sin(phi);
           -sin(the)         cos(the)*sin(phi)                            cos(the)*cos(phi)];
    R = Rib;

    % Bring in and rotate body frame velocity vector
    U = A(1,7);
    V = A(1,8);
    W = A(1,9);
    Vi = zeros(length(A),3);
    Mv= sqrt(U^2+V^2+W^2); 
    Vb = 2*[U, V, W]'/Mv; % Scale velocity
    Vi(1,:) = R*Vb; % Rotate velocity vector to inertial frame for plotting

    phi_A = A(:,4);
    the_A = A(:,5);
    psi_A = A(:,6);

    % Next we run through the points in the vector A as an
    % animation until we get a command to stop
    %handles.j = 
    minX = min(A(:,10))*3.28;
    minY = min(A(:,11))*3.28;
    minZ = min(A(:,12))*3.28;
    maxX = max(A(:,10))*3.28;
    maxY = max(A(:,11))*3.28;
    maxZ = max(A(:,12))*3.28;
    colors = jet(length(A(:,10)));
    j = 1; % Start from the first frame
    
    while ( strcmp(get(hObject,'String'),'Stop'))
        %cla
        guidata(hObject,handles); % Update handles data
        phi   = phi_A(j);
        the = the_A(j);
        psi   = psi_A(j);
        U = A(j,7);
        V = A(j,8);
        W = A(j,9);
        Mv= sqrt(U^2+V^2+W^2);

        % ROTATION MATRIX BELOW --- ZYX ROTATION
        Rib = [cos(psi)*cos(the) cos(psi)*sin(the)*sin(phi)-sin(psi)*cos(phi) cos(psi)*sin(the)*cos(phi)+sin(psi)*sin(phi);
           sin(psi)*cos(the) sin(psi)*sin(the)*sin(phi)+cos(psi)*cos(phi) sin(psi)*sin(the)*cos(phi)-cos(psi)*sin(phi);
           -sin(the)         cos(the)*sin(phi)                            cos(the)*cos(phi)];
        R = Rib; % we want to go from inertia frame to body frame position

        Vb = 5*[U, V, W].';%/Mv;
        Vi(j,:) = R*Vb;

        NrR = R*Nr;
        ErR = R*Er;
        WrR = R*Wr;
        SrR = R*Sr;
        bNSR = R*bNS;
        bEWR = R*bEW;
        TopR = R*Top;
        BotR = R*Bot;

        % Plot the quad rotation and ang. velocity and inertial frame velocity vector
        axes(handles.axes1)
        plot3(bNSR(1,:),bNSR(2,:),bNSR(3,:),'b','LineWidth',3)
        hold on
        plot3(bEWR(1,:),bEWR(2,:),bEWR(3,:),'b','LineWidth',3)
        plot3(NrR(1,:),NrR(2,:),NrR(3,:),'r')
        plot3(ErR(1,:),ErR(2,:),ErR(3,:),'k')
        plot3(WrR(1,:),WrR(2,:),WrR(3,:),'c')
        plot3(SrR(1,:),SrR(2,:),SrR(3,:),'k')
        fill3(TopR(1,:),TopR(2,:),TopR(3,:),'r'); alpha(0.6);
        fill3(BotR(1,:),BotR(2,:),BotR(3,:),'g'); alpha(0.6);
        xlabel('X')
        ylabel('Y')
        zlabel('Z')
        xlim([-3 3])
        ylim([-3 3])
        zlim([-3 3])
        handles.AZval = get(handles.AZslider,'Value')*360;
        handles.ELval = get(handles.ELslider,'Value')*90;
        view(handles.axes1,handles.AZval,handles.ELval)
        P = A(j,1); Q = A(j,2); Rw = A(j,3);
        M = sqrt(P^2+Q^2+Rw^2);
        omb = 7*[P,Q,Rw].';%/M; % Scaling of angular velocity vector
        omi(j,:) = R*omb;
        qp1 = quiver3(0,0,0,omi(j,1),omi(j,2),omi(j,3),'r');
        qp2 = quiver3(0,0,0,Vi(j,1),Vi(j,2),Vi(j,3),'k');
        axis square
        grid on
        hold off
        drawnow
        
        % Plot the three dimensional trajectory of the box
        X = A(1:j,10)*3.28; Y = A(1:j,11)*3.28; Z = A(1:j,12)*3.28;
        axes(handles.axes2)
        scatter3(X,Y,Z,36,colors(1:j,:));
        hold on
        fill3([minX-1 maxX+1 maxX+1 minX-1],...
               [minY-1 minY-1 maxY+1 maxY+1],...
               [0 0 0 0],'g'); % make a plane to represent the ground (Z = 0)
        alpha(0.7); % Makes the ground "see-through"
        xlabel('X (ft)')
        ylabel('Y (ft)')
        zlabel('Z (ft)')
        xlim([minX-1 maxX+1])
        ylim([minY-1 maxY+1])
        zlim([-0.1 maxZ+1]) % Keep ground within view
        % These calls are necessarry to avoid stutter in the frames if adjusting slider while animation is running
        handles.AZval = get(handles.AZslider,'Value')*360; 
        handles.ELval = get(handles.ELslider,'Value')*90;
        view(handles.axes2,handles.AZval,handles.ELval) % Set the current view
        axis square
        grid on
        drawnow
        hold off
        guidata(hObject,handles); 
        if (j == size(A,1)) % If we've run out of data
            return % ...stop plotting
        else if (j+frameSkipVal<size(A,1)) % If the next index won't exceed total frames...
        j = j+frameSkipVal; % increase the index by frame skip value
        else
            j = size(A,1); % 
            end
        end
        set(handles.simTime,'String',num2str(tout(j)));
            
    end
    else if strcmp(mode,'Stop')
        mode = 'Stop';
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
set(handles.AZslider,'Value',35/360);
view(handles.axes1,35,25);
view(handles.axes2,35,25);
drawnow
guidata(hObject,handles);
