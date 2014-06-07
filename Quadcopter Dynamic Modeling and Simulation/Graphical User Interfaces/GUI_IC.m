function varargout = GUI_IC(varargin)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %{
This GUI is used to conveniently create sets of initial conditions for the
quadcopter simulation.

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

% GUI_IC MATLAB code for GUI_IC.fig
%      GUI_IC, by itself, creates a new GUI_IC or raises the existing
%      singleton*.
%
%      H = GUI_IC returns the handle to a new GUI_IC or the handle to
%      the existing singleton*.
%
%      GUI_IC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_IC.M with the given input arguments.
%
%      GUI_IC('Property','Value',...) creates a new GUI_IC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_IC_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_IC_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_IC

% Last Modified by GUIDE v2.5 01-May-2014 19:46:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_IC_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_IC_OutputFcn, ...
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


% --- Executes just before GUI_IC is made visible.
function GUI_IC_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_IC (see VARARGIN)

movegui('center')
imshow('IC_GraphicA.jpg')

set(handles.P_IC, 'String', 0);
set(handles.Q_IC, 'String', 0);
set(handles.R_IC, 'String', 0);
set(handles.Phi_IC, 'String', 0);
set(handles.The_IC, 'String', 0);
set(handles.Psi_IC, 'String', 0);
set(handles.U_IC, 'String', 0);
set(handles.V_IC, 'String', 0);
set(handles.W_IC, 'String', 0);
set(handles.X_IC, 'String', 0);
set(handles.Y_IC, 'String', 0);
set(handles.Z_IC, 'String', 0);
set(handles.w1_IC, 'String', 0);
set(handles.w2_IC, 'String', 0);
set(handles.w3_IC, 'String', 0);
set(handles.w4_IC, 'String', 0);

% Choose default command line output for GUI_IC
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_IC wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_IC_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function P_IC_Callback(hObject, eventdata, handles)
% hObject    handle to P_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P_IC as text
%        str2double(get(hObject,'String')) returns contents of P_IC as a double


% --- Executes during object creation, after setting all properties.
function P_IC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Q_IC_Callback(hObject, eventdata, handles)
% hObject    handle to Q_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q_IC as text
%        str2double(get(hObject,'String')) returns contents of Q_IC as a double


% --- Executes during object creation, after setting all properties.
function Q_IC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function R_IC_Callback(hObject, eventdata, handles)
% hObject    handle to R_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R_IC as text
%        str2double(get(hObject,'String')) returns contents of R_IC as a double


% --- Executes during object creation, after setting all properties.
function R_IC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Phi_IC_Callback(hObject, eventdata, handles)
% hObject    handle to Phi_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Phi_IC as text
%        str2double(get(hObject,'String')) returns contents of Phi_IC as a double


% --- Executes during object creation, after setting all properties.
function Phi_IC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Phi_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function The_IC_Callback(hObject, eventdata, handles)
% hObject    handle to The_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of The_IC as text
%        str2double(get(hObject,'String')) returns contents of The_IC as a double


% --- Executes during object creation, after setting all properties.
function The_IC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to The_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Psi_IC_Callback(hObject, eventdata, handles)
% hObject    handle to Psi_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Psi_IC as text
%        str2double(get(hObject,'String')) returns contents of Psi_IC as a double


% --- Executes during object creation, after setting all properties.
function Psi_IC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Psi_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function U_IC_Callback(hObject, eventdata, handles)
% hObject    handle to U_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of U_IC as text
%        str2double(get(hObject,'String')) returns contents of U_IC as a double


% --- Executes during object creation, after setting all properties.
function U_IC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to U_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function V_IC_Callback(hObject, eventdata, handles)
% hObject    handle to V_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of V_IC as text
%        str2double(get(hObject,'String')) returns contents of V_IC as a double


% --- Executes during object creation, after setting all properties.
function V_IC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to V_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function W_IC_Callback(hObject, eventdata, handles)
% hObject    handle to W_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of W_IC as text
%        str2double(get(hObject,'String')) returns contents of W_IC as a double


% --- Executes during object creation, after setting all properties.
function W_IC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to W_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function X_IC_Callback(hObject, eventdata, handles)
% hObject    handle to X_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of X_IC as text
%        str2double(get(hObject,'String')) returns contents of X_IC as a double


% --- Executes during object creation, after setting all properties.
function X_IC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to X_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y_IC_Callback(hObject, eventdata, handles)
% hObject    handle to Y_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Y_IC as text
%        str2double(get(hObject,'String')) returns contents of Y_IC as a double


% --- Executes during object creation, after setting all properties.
function Y_IC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Y_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Z_IC_Callback(hObject, eventdata, handles)
% hObject    handle to Z_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Z_IC as text
%        str2double(get(hObject,'String')) returns contents of Z_IC as a double


% --- Executes during object creation, after setting all properties.
function Z_IC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Z_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function w1_IC_Callback(hObject, eventdata, handles)
% hObject    handle to w1_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w1_IC as text
%        str2double(get(hObject,'String')) returns contents of w1_IC as a double


% --- Executes during object creation, after setting all properties.
function w1_IC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w1_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function w2_IC_Callback(hObject, eventdata, handles)
% hObject    handle to w2_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w2_IC as text
%        str2double(get(hObject,'String')) returns contents of w2_IC as a double


% --- Executes during object creation, after setting all properties.
function w2_IC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w2_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function w3_IC_Callback(hObject, eventdata, handles)
% hObject    handle to w3_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w3_IC as text
%        str2double(get(hObject,'String')) returns contents of w3_IC as a double


% --- Executes during object creation, after setting all properties.
function w3_IC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w3_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function w4_IC_Callback(hObject, eventdata, handles)
% hObject    handle to w4_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w4_IC as text
%        str2double(get(hObject,'String')) returns contents of w4_IC as a double


% --- Executes during object creation, after setting all properties.
function w4_IC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w4_IC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in save_Button.
function save_Button_Callback(hObject, eventdata, handles)
% hObject    handle to save_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting all the strings from each text box input window

P = str2num(get(handles.P_IC, 'String'));
Q = str2num(get(handles.Q_IC, 'String'));
R = str2num(get(handles.R_IC, 'String'));
Phi = str2num(get(handles.Phi_IC, 'String'));
The = str2num(get(handles.The_IC, 'String'));
Psi = str2num(get(handles.Psi_IC, 'String'));
U = str2num(get(handles.U_IC, 'String'));
V = str2num(get(handles.V_IC, 'String'));
W = str2num(get(handles.W_IC, 'String'));
X = str2num(get(handles.X_IC, 'String'));
Y = str2num(get(handles.Y_IC, 'String'));
Z = str2num(get(handles.Z_IC, 'String'));
w1 = str2num(get(handles.w1_IC, 'String'));
w2 = str2num(get(handles.w2_IC, 'String'));
w3 = str2num(get(handles.w3_IC, 'String'));
w4 = str2num(get(handles.w4_IC, 'String'));


% Saves all the variables from above into a structure called "IC"
IC = struct('P',(P),'Q',(Q),'R',(R),'Phi',(Phi),'The',(The),'Psi',(Psi),...
    'U',(U),'V',(V),'W',(W),'X',(X),'Y',(Y),'Z',(Z),'w1',(w1),'w2',(w2),'w3',(w3),'w4',(w4));

% Saves the structure "IC" into the working directory
uisave('IC','IC')

guidata(hObject, handles);


% --- Executes on button press in load_Button.
function load_Button_Callback(hObject, eventdata, handles)
% hObject    handle to load_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% This Load button is used when the user wishes to change only a few
% values of an existing structure (that is already saved). Instead of
% re-typing all the IC's back into the GUI again only to change
% 1 or 2 values, they can load the values back in quickly and make the necessary
% changes, and re-save as required.

uiload; % Brings up standard load window, a structure is then selected
    
if exist('IC')
set(handles.P_IC,'String',IC.P);
set(handles.Q_IC,'String',IC.Q);
set(handles.R_IC,'String',IC.R);
set(handles.Phi_IC,'String',IC.Phi);
set(handles.The_IC,'String',IC.The);
set(handles.Psi_IC,'String',IC.Psi);
set(handles.U_IC,'String',IC.U);
set(handles.V_IC,'String',IC.V);
set(handles.W_IC,'String',IC.W);
set(handles.X_IC,'String',IC.X);
set(handles.Y_IC,'String',IC.Y);
set(handles.Z_IC,'String',IC.Z);
set(handles.w1_IC,'String',IC.w1);
set(handles.w2_IC,'String',IC.w2);
set(handles.w3_IC,'String',IC.w3);
set(handles.w4_IC,'String',IC.w4);

else
end

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1

% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes when selected object is changed in uipanel3.
function uipanel3_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel3 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

switch get(eventdata.NewValue,'Tag') % Get Tag of selected object
    case 'plusButton'
        
        imshow('IC_GraphicA.jpg');
        
    case 'xButton'
        
        imshow('IC_GraphicB.jpg');
        
end


% --- Executes on button press in clearButton.
function clearButton_Callback(hObject, eventdata, handles)
% hObject    handle to clearButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.P_IC,'String',0);
set(handles.Q_IC,'String',0);
set(handles.R_IC,'String',0);
set(handles.Phi_IC,'String',0);
set(handles.The_IC,'String',0);
set(handles.Psi_IC,'String',0);
set(handles.U_IC,'String',0);
set(handles.V_IC,'String',0);
set(handles.W_IC,'String',0);
set(handles.X_IC,'String',0);
set(handles.Y_IC,'String',0);
set(handles.Z_IC,'String',0);
set(handles.w1_IC,'String',0);
set(handles.w2_IC,'String',0);
set(handles.w3_IC,'String',0);
set(handles.w4_IC,'String',0);