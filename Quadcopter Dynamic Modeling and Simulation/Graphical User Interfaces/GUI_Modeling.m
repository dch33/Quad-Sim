function varargout = GUI_Modeling(varargin)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %{
 This GUI provides a helpful tool for modeling the quadcopter and storing
 the important parameters within a saved MATLAB structure.

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

% GUI_Modeling MATLAB code for GUI_Modeling.fig
%      GUI_Modeling, by itself, creates a new GUI_Modeling or raises the existing
%      singleton*.
%
%      H = GUI_Modeling returns the handle to a new GUI_Modeling or the handle to
%      the existing singleton*.
%
%      GUI_Modeling('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_Modeling.M with the given input arguments.
%
%      GUI_Modeling('Property','Value',...) creates a new GUI_Modeling or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Modeling_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Modeling_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Modeling

% Last Modified by GUIDE v2.5 05-Jun-2014 12:16:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Modeling_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Modeling_OutputFcn, ...
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes just before GUI_Modeling is made visible.
function GUI_Modeling_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Modeling (see VARARGIN)

imshow('Motors_Graphic.jpg'); % Displays default graphic before user selects one 

set(handles.motor_m_unit, 'String', 'g');
set(handles.ESC_m_unit, 'String', 'g');
set(handles.HUB_m_unit, 'String', 'g');
set(handles.Arms_m_unit, 'String', 'g');

set(handles.motor_dm_unit, 'String', 'cm');
set(handles.motor_h_unit, 'String', 'cm');
set(handles.motor_r_unit, 'String', 'cm');
set(handles.ESC_a_unit, 'String', 'cm');
set(handles.ESC_b_unit, 'String', 'cm');
set(handles.ESC_ds_unit, 'String', 'cm');
set(handles.HUB_r_unit, 'String', 'cm');
set(handles.HUB_H_unit, 'String', 'cm');
set(handles.Arms_r_unit, 'String', 'cm');
set(handles.Arms_L_unit, 'String', 'cm');
set(handles.Arms_da_unit, 'String', 'cm');

movegui('center') % Moves the current GUI to the center of screen

% Choose default command line output for GUI_Modeling
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_Modeling wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = GUI_Modeling_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function massTotal_edit_Callback(hObject, eventdata, handles)
% hObject    handle to massTotal_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of massTotal_edit as text
%        str2double(get(hObject,'String')) returns contents of massTotal_edit as a double


% --- Executes during object creation, after setting all properties.
function massTotal_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to massTotal_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function ct_edit_Callback(hObject, eventdata, handles)
% hObject    handle to ct_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ct_edit as text
%        str2double(get(hObject,'String')) returns contents of ct_edit as a double


% --- Executes during object creation, after setting all properties.
function ct_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ct_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cq_edit_Callback(hObject, eventdata, handles)
% hObject    handle to cq_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cq_edit as text
%        str2double(get(hObject,'String')) returns contents of cq_edit as a double


% --- Executes during object creation, after setting all properties.
function cq_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cq_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function motor_m_edit_Callback(hObject, eventdata, handles)
% hObject    handle to motor_m_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of motor_m_edit as text
%        str2double(get(hObject,'String')) returns contents of motor_m_edit as a double


% --- Executes during object creation, after setting all properties.
function motor_m_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to motor_m_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function motor_dm_edit_Callback(hObject, eventdata, handles)
% hObject    handle to motor_dm_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of motor_dm_edit as text
%        str2double(get(hObject,'String')) returns contents of motor_dm_edit as a double


% --- Executes during object creation, after setting all properties.
function motor_dm_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to motor_dm_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function motor_h_edit_Callback(hObject, eventdata, handles)
% hObject    handle to motor_h_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of motor_h_edit as text
%        str2double(get(hObject,'String')) returns contents of motor_h_edit as a double


% --- Executes during object creation, after setting all properties.
function motor_h_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to motor_h_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function motor_r_edit_Callback(hObject, eventdata, handles)
% hObject    handle to motor_r_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of motor_r_edit as text
%        str2double(get(hObject,'String')) returns contents of motor_r_edit as a double


% --- Executes during object creation, after setting all properties.
function motor_r_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to motor_r_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ESC_m_edit_Callback(hObject, eventdata, handles)
% hObject    handle to ESC_m_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ESC_m_edit as text
%        str2double(get(hObject,'String')) returns contents of ESC_m_edit as a double


% --- Executes during object creation, after setting all properties.
function ESC_m_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ESC_m_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function ESC_a_edit_Callback(hObject, eventdata, handles)
% hObject    handle to ESC_a_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ESC_a_edit as text
%        str2double(get(hObject,'String')) returns contents of ESC_a_edit as a double


% --- Executes during object creation, after setting all properties.
function ESC_a_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ESC_a_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ESC_b_edit_Callback(hObject, eventdata, handles)
% hObject    handle to ESC_b_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ESC_b_edit as text
%        str2double(get(hObject,'String')) returns contents of ESC_b_edit as a double


% --- Executes during object creation, after setting all properties.
function ESC_b_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ESC_b_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ESC_ds_edit_Callback(hObject, eventdata, handles)
% hObject    handle to ESC_ds_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ESC_ds_edit as text
%        str2double(get(hObject,'String')) returns contents of ESC_ds_edit as a double


% --- Executes during object creation, after setting all properties.
function ESC_ds_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ESC_ds_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function arms_m_edit_Callback(hObject, eventdata, handles)
% hObject    handle to arms_m_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of arms_m_edit as text
%        str2double(get(hObject,'String')) returns contents of arms_m_edit as a double


% --- Executes during object creation, after setting all properties.
function arms_m_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to arms_m_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function arms_r_edit_Callback(hObject, eventdata, handles)
% hObject    handle to arms_r_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of arms_r_edit as text
%        str2double(get(hObject,'String')) returns contents of arms_r_edit as a double


% --- Executes during object creation, after setting all properties.
function arms_r_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to arms_r_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function arms_L_edit_Callback(hObject, eventdata, handles)
% hObject    handle to arms_L_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of arms_L_edit as text
%        str2double(get(hObject,'String')) returns contents of arms_L_edit as a double


% --- Executes during object creation, after setting all properties.
function arms_L_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to arms_L_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HUB_m_edit_Callback(hObject, eventdata, handles)
% hObject    handle to HUB_m_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HUB_m_edit as text
%        str2double(get(hObject,'String')) returns contents of HUB_m_edit as a double


% --- Executes during object creation, after setting all properties.
function HUB_m_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HUB_m_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HUB_r_edit_Callback(hObject, eventdata, handles)
% hObject    handle to HUB_r_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HUB_r_edit as text
%        str2double(get(hObject,'String')) returns contents of HUB_r_edit as a double


% --- Executes during object creation, after setting all properties.
function HUB_r_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HUB_r_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HUB_H_edit_Callback(hObject, eventdata, handles)
% hObject    handle to HUB_H_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HUB_H_edit as text
%        str2double(get(hObject,'String')) returns contents of HUB_H_edit as a double


% --- Executes during object creation, after setting all properties.
function HUB_H_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HUB_H_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- SELECTING WHICH PICTURE IS DISPLAYED IN MIDDLE OF SCREEN
% --- Executes when selected object is changed in pic_display_panel.
function pic_display_panel_SelectionChangeFcn(hObject, eventdata, handles)
%   hObject    handle to the selected object in pic_display_panel 
%   eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
%   handles    structure with handles and user data (see GUIDATA)

switch get(eventdata.NewValue,'Tag') % Get Tag of selected object
    case 'motors_button'
        % Code for when motors_button is selected.
        imshow('Motors_Graphic.jpg');
        
    case 'ESC_button'
        % Code for when ESC_button is selected.
        imshow('ESC_Graphic.jpg');
        
    case 'HUB_button'
        % Code for when HUB_button is selected.
        imshow('HUB_Graphic.jpg');
        
    case 'arms_button'
        % Code for when arms_button is selected.
        imshow('ARMS_Graphic.jpg');
end

function jx_Callback(hObject, eventdata, handles)
% hObject    handle to jx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jx as text
%        str2double(get(hObject,'String')) returns contents of jx as a double


% --- Executes during object creation, after setting all properties.
function jx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jy_Callback(hObject, eventdata, handles)
% hObject    handle to jy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jy as text
%        str2double(get(hObject,'String')) returns contents of jy as a double


% --- Executes during object creation, after setting all properties.
function jy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jz_Callback(hObject, eventdata, handles)
% hObject    handle to jz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jz as text
%        str2double(get(hObject,'String')) returns contents of jz as a double


% --- Executes during object creation, after setting all properties.
function jz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in save_plus.
function save_plus_Callback(hObject, eventdata, handles)
% hObject    handle to save_plus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get the handles of variables desired
% Converts the string representations of the variables into numeric values

massUnits = get(handles.motor_m_unit, 'String');
if massUnits == 'g',
    % Everything is in g/cm
    % Calculate and convert everything here to go from g/cm --> kg/m
    
    motor_m_g = str2num(get(handles.motor_m_edit, 'String'));
    motor_dm_cm = str2num(get(handles.motor_dm_edit, 'String'));
    motor_h_cm = str2num(get(handles.motor_h_edit, 'String'));
    motor_r_cm = str2num(get(handles.motor_r_edit, 'String'));
    ESC_m_g = str2num(get(handles.ESC_m_edit, 'String'));
    ESC_a_cm = str2num(get(handles.ESC_a_edit, 'String'));
    ESC_b_cm = str2num(get(handles.ESC_b_edit, 'String'));
    ESC_ds_cm = str2num(get(handles.ESC_ds_edit, 'String'));
    HUB_m_g = str2num(get(handles.HUB_m_edit, 'String'));
    HUB_r_cm = str2num(get(handles.HUB_r_edit, 'String'));
    HUB_H_cm = str2num(get(handles.HUB_H_edit, 'String'));
    arms_m_g = str2num(get(handles.arms_m_edit, 'String'));
    arms_r_cm = str2num(get(handles.arms_r_edit, 'String'));
    arms_L_cm = str2num(get(handles.arms_L_edit, 'String'));
    arms_da_cm = str2num(get(handles.arms_da_edit, 'String'));
    
    motor_m = motor_m_g/1000;
    motor_dm = motor_dm_cm/100;
    motor_h = motor_h_cm/100;
    motor_r = motor_r_cm/100;
    ESC_m = ESC_m_g/1000;
    ESC_a = ESC_a_cm/100;
    ESC_b = ESC_b_cm/100;
    ESC_ds = ESC_ds_cm/100;
    HUB_m = HUB_m_g/1000;
    HUB_r = HUB_r_cm/100;
    HUB_H = HUB_H_cm/100;
    arms_m = arms_m_g/1000;
    arms_r = arms_r_cm/100;
    arms_L = arms_L_cm/100;
    arms_da = arms_da_cm/100;

    d = motor_dm; % The d variable is same distance as motor_dm
    
else 
    
    % Everything is in oz/in
    % Calculate and convert everything here to go from oz/in --> kg/m

    motor_m_oz = str2num(get(handles.motor_m_edit, 'String'));
    motor_dm_in = str2num(get(handles.motor_dm_edit, 'String'));
    motor_h_in = str2num(get(handles.motor_h_edit, 'String'));
    motor_r_in = str2num(get(handles.motor_r_edit, 'String'));
    ESC_m_oz = str2num(get(handles.ESC_m_edit, 'String'));
    ESC_a_in = str2num(get(handles.ESC_a_edit, 'String'));
    ESC_b_in = str2num(get(handles.ESC_b_edit, 'String'));
    ESC_ds_in = str2num(get(handles.ESC_ds_edit, 'String'));
    HUB_m_oz = str2num(get(handles.HUB_m_edit, 'String'));
    HUB_r_in = str2num(get(handles.HUB_r_edit, 'String'));
    HUB_H_in = str2num(get(handles.HUB_H_edit, 'String'));
    arms_m_oz = str2num(get(handles.arms_m_edit, 'String'));
    arms_r_in = str2num(get(handles.arms_r_edit, 'String'));
    arms_L_in = str2num(get(handles.arms_L_edit, 'String'));
    arms_da_in = str2num(get(handles.arms_da_edit, 'String'));
    
    motor_m = motor_m_oz/35.274;
    motor_dm = motor_dm_in/39.3701;
    motor_h = motor_h_in/39.3701;
    motor_r = motor_r_in/39.3701;
    ESC_m = ESC_m_oz/35.274;
    ESC_a = ESC_a_in/39.3701;
    ESC_b = ESC_b_in/39.3701;
    ESC_ds = ESC_ds_in/39.3701;
    HUB_m = HUB_m_oz/35.274;
    HUB_r = HUB_r_in/39.3701;
    HUB_H = HUB_H_in/39.3701;
    arms_m = arms_m_oz/35.274;
    arms_r = arms_r_in/39.3701;
    arms_L = arms_L_in/39.3701;
    arms_da = arms_da_in/39.3701;
    
    d = motor_dm; % The d variable is same distance as motor_dm
end

g = 9.81; % m/s^2

mass = str2num(get(handles.massTotal_edit, 'String')); % Already converted to kg

T = str2num(get(handles.tConstant, 'String')); % Seconds
minThr = str2num(get(handles.minThr, 'String')); % Just an integer
cr = str2num(get(handles.cr_edit, 'String'));
b = str2num(get(handles.b_edit, 'String'));

ct = str2num(get(handles.ct_edit, 'String'));
cq = str2num(get(handles.cq_edit, 'String'));

Jx = str2num(get(handles.jx, 'String'));
Jy = str2num(get(handles.jy, 'String'));
Jz = str2num(get(handles.jz, 'String'));
Jb = [Jx 0 0; 0 Jy 0; 0 0 Jz];
Jbinv = [1/Jx 0 0; 0 1/Jy 0; 0 0 1/Jz];
% dctcq matrix for "Plus" Configuration
dctcq = [0 d*ct 0 -d*ct; -d*ct 0 d*ct 0; -cq cq -cq cq];
plusConfig = 1;

% Jm (Motor Rotation Inertia for Rotating Component only)
% Mass of rotating component is 52.7% of the total mass of the motor + prop
mRC = (motor_m)*(0.527);
Jm = ((mRC)*(motor_r)^2)/2; % Jm = mr^2/2

% Saves all the variables from above into a structure called "quadModel"
quadModel = struct('g',(g),'d',(d),'mass',(mass),'ct',(ct),'cq',(cq),...
    'Jx',(Jx),'Jy',(Jy),'Jz',(Jz),'Jm',(Jm),'Jb',(Jb),'Jbinv',(Jbinv),'dctcq',(dctcq),...
    'motor_m',(motor_m),'motor_dm',(motor_dm),'motor_h',(motor_h),'motor_r',(motor_r),...
    'ESC_m',(ESC_m),'ESC_a',(ESC_a),'ESC_b',(ESC_b),'ESC_ds',(ESC_ds),...
    'HUB_m',(HUB_m),'HUB_r',(HUB_r),'HUB_H',(HUB_H),...
    'arms_m',(arms_m),'arms_r',(arms_r),'arms_L',(arms_L), 'arms_da',(arms_da),'T',(T),'minThr',(minThr),...
    'cr',(cr),'b',(b), 'plusConfig',(plusConfig));


% Assigns the structure to the active workspace
% assignin('WS','name',V) assigns the variable 'name' in the workspace WS the value V.
% assignin('base','quadModel',quadModel);

% Saves the structure "quadModel" into the working directory
uisave('quadModel','quadModel_+');

guidata(hObject, handles);


% --- Executes on button press in save_X.
function save_X_Callback(hObject, eventdata, handles)
% hObject    handle to save_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get the handles of variables desired
% Converts the string representations of the variables into numeric values

massUnits = get(handles.motor_m_unit, 'String');
if massUnits == 'g',
    % Everything is in g/cm
    % Calculate and convert everything here to go from g/cm --> kg/m
    
    motor_m_g = str2num(get(handles.motor_m_edit, 'String'));
    motor_dm_cm = str2num(get(handles.motor_dm_edit, 'String'));
    motor_h_cm = str2num(get(handles.motor_h_edit, 'String'));
    motor_r_cm = str2num(get(handles.motor_r_edit, 'String'));
    ESC_m_g = str2num(get(handles.ESC_m_edit, 'String'));
    ESC_a_cm = str2num(get(handles.ESC_a_edit, 'String'));
    ESC_b_cm = str2num(get(handles.ESC_b_edit, 'String'));
    ESC_ds_cm = str2num(get(handles.ESC_ds_edit, 'String'));
    HUB_m_g = str2num(get(handles.HUB_m_edit, 'String'));
    HUB_r_cm = str2num(get(handles.HUB_r_edit, 'String'));
    HUB_H_cm = str2num(get(handles.HUB_H_edit, 'String'));
    arms_m_g = str2num(get(handles.arms_m_edit, 'String'));
    arms_r_cm = str2num(get(handles.arms_r_edit, 'String'));
    arms_L_cm = str2num(get(handles.arms_L_edit, 'String'));
    arms_da_cm = str2num(get(handles.arms_da_edit, 'String'));
    
    motor_m = motor_m_g/1000;
    motor_dm = motor_dm_cm/100;
    motor_h = motor_h_cm/100;
    motor_r = motor_r_cm/100;
    ESC_m = ESC_m_g/1000;
    ESC_a = ESC_a_cm/100;
    ESC_b = ESC_b_cm/100;
    ESC_ds = ESC_ds_cm/100;
    HUB_m = HUB_m_g/1000;
    HUB_r = HUB_r_cm/100;
    HUB_H = HUB_H_cm/100;
    arms_m = arms_m_g/1000;
    arms_r = arms_r_cm/100;
    arms_L = arms_L_cm/100;
    arms_da = arms_da_cm/100;

    d = motor_dm; % The d variable is same distance as motor_dm
    
else 
    
    % Everything is in oz/in
    % Calculate and convert everything here to go from oz/in --> kg/m

    motor_m_oz = str2num(get(handles.motor_m_edit, 'String'));
    motor_dm_in = str2num(get(handles.motor_dm_edit, 'String'));
    motor_h_in = str2num(get(handles.motor_h_edit, 'String'));
    motor_r_in = str2num(get(handles.motor_r_edit, 'String'));
    ESC_m_oz = str2num(get(handles.ESC_m_edit, 'String'));
    ESC_a_in = str2num(get(handles.ESC_a_edit, 'String'));
    ESC_b_in = str2num(get(handles.ESC_b_edit, 'String'));
    ESC_ds_in = str2num(get(handles.ESC_ds_edit, 'String'));
    HUB_m_oz = str2num(get(handles.HUB_m_edit, 'String'));
    HUB_r_in = str2num(get(handles.HUB_r_edit, 'String'));
    HUB_H_in = str2num(get(handles.HUB_H_edit, 'String'));
    arms_m_oz = str2num(get(handles.arms_m_edit, 'String'));
    arms_r_in = str2num(get(handles.arms_r_edit, 'String'));
    arms_L_in = str2num(get(handles.arms_L_edit, 'String'));
    arms_da_in = str2num(get(handles.arms_da_edit, 'String'));
    
    motor_m = motor_m_oz/35.274;
    motor_dm = motor_dm_in/39.3701;
    motor_h = motor_h_in/39.3701;
    motor_r = motor_r_in/39.3701;
    ESC_m = ESC_m_oz/35.274;
    ESC_a = ESC_a_in/39.3701;
    ESC_b = ESC_b_in/39.3701;
    ESC_ds = ESC_ds_in/39.3701;
    HUB_m = HUB_m_oz/35.274;
    HUB_r = HUB_r_in/39.3701;
    HUB_H = HUB_H_in/39.3701;
    arms_m = arms_m_oz/35.274;
    arms_r = arms_r_in/39.3701;
    arms_L = arms_L_in/39.3701;
    arms_da = arms_da_in/39.3701;
    
    d = motor_dm; % The d variable is same distance as motor_dm
end

g = 9.81; % m/s^2

mass = str2num(get(handles.massTotal_edit, 'String')); % Already converted to kg

T = str2num(get(handles.tConstant, 'String')); % Seconds
minThr = str2num(get(handles.minThr, 'String')); % Just an integer
cr = str2num(get(handles.cr_edit, 'String'));
b = str2num(get(handles.b_edit, 'String'));

ct = str2num(get(handles.ct_edit, 'String'));
cq = str2num(get(handles.cq_edit, 'String'));

Jx = str2num(get(handles.jx, 'String'));
Jy = str2num(get(handles.jy, 'String'));
Jz = str2num(get(handles.jz, 'String'));
Jb = [Jx 0 0; 0 Jy 0; 0 0 Jz];
Jbinv = [1/Jx 0 0; 0 1/Jy 0; 0 0 1/Jz];
% dctcq matrix for "X" Configuration
d45 = d*(sqrt(2)/2);
dctcq = [-d45*ct d45*ct d45*ct -d45*ct; -d45*ct -d45*ct d45*ct d45*ct; -cq cq -cq cq];
plusConfig = 0;

% Jm (Motor Rotation Inertia for Rotating Component only)
% Mass of rotating component is 52.7% of the total mass of the motor + prop
mRC = (motor_m)*(0.527);
Jm = ((mRC)*(motor_r)^2)/2; % Jm = mr^2/2

% Saves all the variables from above into a structure called "quadModel"
quadModel = struct('g',(g),'d',(d),'mass',(mass),'ct',(ct),'cq',(cq),...
    'Jx',(Jx),'Jy',(Jy),'Jz',(Jz),'Jm',(Jm),'Jb',(Jb),'Jbinv',(Jbinv),'dctcq',(dctcq),...
    'motor_m',(motor_m),'motor_dm',(motor_dm),'motor_h',(motor_h),'motor_r',(motor_r),...
    'ESC_m',(ESC_m),'ESC_a',(ESC_a),'ESC_b',(ESC_b),'ESC_ds',(ESC_ds),...
    'HUB_m',(HUB_m),'HUB_r',(HUB_r),'HUB_H',(HUB_H),...
    'arms_m',(arms_m),'arms_r',(arms_r),'arms_L',(arms_L),'arms_da',(arms_da),'T',(T),'minThr',(minThr),...
    'cr',(cr),'b',(b),'plusConfig',(plusConfig));

% Saves the structure "quadModel" into the working directory
uisave('quadModel','quadModel_X');

guidata(hObject, handles);

% --- Executes on button press in clear_button.
function clear_button_Callback(hObject, eventdata, handles)
% hObject    handle to clear_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Clear all the text boxes
set(handles.jx,'String','');
set(handles.jy,'String','');
set(handles.jz,'String','');
set(handles.massTotal_edit,'String','');
set(handles.ct_edit,'String','');
set(handles.cq_edit,'String','');

set(handles.motor_m_edit,'String','');
set(handles.motor_dm_edit,'String','');
set(handles.motor_h_edit,'String','');
set(handles.motor_r_edit,'String','');

set(handles.ESC_m_edit,'String','');
set(handles.ESC_a_edit,'String','');
set(handles.ESC_b_edit,'String','');
set(handles.ESC_ds_edit,'String','');

set(handles.HUB_m_edit,'String','');
set(handles.HUB_r_edit,'String','');
set(handles.HUB_H_edit,'String','');

set(handles.arms_m_edit,'String','');
set(handles.arms_r_edit,'String','');
set(handles.arms_L_edit,'String','');
set(handles.arms_da_edit,'String','');

set(handles.tConstant,'String','');
set(handles.minThr,'String','');
set(handles.cr_edit,'String','');
set(handles.b_edit,'String','');


% --- Executes on button press in calulateButton.
function calulateButton_Callback(hObject, eventdata, handles)
% hObject    handle to calulateButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

massUnits = get(handles.motor_m_unit, 'String');

if massUnits == 'g',
    
    % Everything is in g/cm
    % Calculate and convert everything here to go from g/cm --> kg/m
    
    % Inertia Calculations for the motor's
    mm_g = str2num(get(handles.motor_m_edit,'String'));
    dm_cm = str2num(get(handles.motor_dm_edit,'String'));
    hm_cm = str2num(get(handles.motor_h_edit,'String'));
    rm_cm = str2num(get(handles.motor_r_edit,'String')); 
    
    mm = mm_g/1000; % Converts g to kg
    dm = dm_cm/100; % Converts cm to m
    hm = hm_cm/100; % Converts cm to m
    rm = rm_cm/100; % Converts cm to m
    
    % Jx1, Jy1, Jz1 --- Inertia's about each axis for motor's only
    Jx1 = (mm) * ((rm)^2) + (4/3)*(mm) * ((hm)^2) + 2*(mm)*((dm)^2);
    Jy1 = (mm) * ((rm)^2) + (4/3)*(mm) * ((hm)^2) + 2*(mm)*((dm)^2);
    Jz1 = 2*(mm)*((rm)^2) + (4)*(mm)*((dm)^2);
    
    % Inertia Calculations for the ESC's
    ms_g = str2num(get(handles.ESC_m_edit,'String'));
    as_cm = str2num(get(handles.ESC_a_edit,'String')); 
    bs_cm = str2num(get(handles.ESC_b_edit,'String')); 
    ds_cm = str2num(get(handles.ESC_ds_edit,'String')); 
    
    ms = ms_g/1000; % Converts g to kg
    as = as_cm/100; % Converts cm to m
    bs = bs_cm/100; % Converts cm to m
    ds = ds_cm/100; % Converts cm to m
  
    % Jx2, Jy2, Jz2 --- Inertia's about each axis for ESC's only
    Jx2 = ((ms*(as^2))/6) + ((ms*(bs^2))/6) + (2*(ms)*(ds^2));
    Jy2 = ((ms*(as^2))/6) + ((ms*(bs^2))/6) + (2*(ms)*(ds^2));
    Jz2 = ((ms*(as^2 + bs^2))/3) + 4*(ms)*(ds^2);

    % Inertia Calculations for the Central "HUB"
    mh_g = str2num(get(handles.HUB_m_edit,'String')); 
    rh_cm = str2num(get(handles.HUB_r_edit,'String')); 
    Hh_cm = str2num(get(handles.HUB_H_edit,'String')); 

    mh = mh_g/1000; % Converts g to kg
    rh = rh_cm/100; % Converts cm to m
    Hh = Hh_cm/100; % Converts cm to m
    
    % Jx3, Jy3, Jz3 --- Inertia's about each axis for Central HUB only
    Jx3 = (1/4)*((mh))*((rh)^2) + (1/12)*((mh))*((Hh)^2);
    Jy3 = (1/4)*((mh))*((rh)^2) + (1/12)*((mh))*((Hh)^2);
    Jz3 = (1/2)*((mh))*((rh)^2);
    
    % Inertia Calculations for the Arms
    ma_g = str2num(get(handles.arms_m_edit,'String'));
    ra_cm = str2num(get(handles.arms_r_edit,'String'));
    La_cm = str2num(get(handles.arms_L_edit,'String'));
    da_cm = str2num(get(handles.arms_da_edit,'String'));
    
    ma = ma_g/1000; % Converts g to kg
    ra = ra_cm/100; % Converts cm to m
    La = La_cm/100; % Converts cm to m
    da = da_cm/100; % Converts cm to m

    % Jx4, Jy4, Jz4 --- Inertia's about each axis for Arms only
    Jx4 = ((3/2)*(ma)*(ra^2)) + ((2/3)*(ma)*(La^2)) + (2)*(ma)*(da^2);
    Jy4 = ((3/2)*(ma)*(ra^2)) + ((2/3)*(ma)*(La^2)) + (2)*(ma)*(da^2);
    Jz4 = ((ma)*((ra)^2)) + (4/3)*((ma) * ((La)^2)) + (4)*(ma)*(da^2);

    % Add together Jx(1,2,3,4), Jy(1,2,3,4) and Jz(1,2,3,4)
    % Gives the M.O.I. for the entire vehicle
    totalX = Jx1 + Jx2 + Jx3 + Jx4;
    totalY = Jy1 + Jy2 + Jy3 + Jy4;
    totalZ = Jz1 + Jz2 + Jz3 + Jz4;

    % Converts total Jx, Jy, Jz values to strings
    a = num2str(totalX);
    b = num2str(totalY);
    c = num2str(totalZ);
    
    % Sets the GUI display handles to the inertia values
    set(handles.jx,'String',a);
    set(handles.jy,'String',b);
    set(handles.jz,'String',c);

    % Automatically calculating the total mass of the quadcopter
    massTotal = 4*mm + 4*ms + mh + 4*ma;
    set(handles.massTotal_edit,'String',massTotal);

else 
    
    % Everything is in oz/in
    % Calculate and convert everything here to go from oz/in --> kg/m
    
    % Inertia Calculations for the motor's
    mm_oz = str2num(get(handles.motor_m_edit,'String'));
    dm_in = str2num(get(handles.motor_dm_edit,'String'));
    hm_in = str2num(get(handles.motor_h_edit,'String'));
    rm_in = str2num(get(handles.motor_r_edit,'String')); 
    
    mm = mm_oz/35.274; % Converts oz to kg
    dm = dm_in/39.3701; % Converts in to m
    hm = hm_in/39.3701; % Converts in to m
    rm = rm_in/39.3701; % Converts in to m
    
    % Jx1, Jy1, Jz1 --- Inertia's about each axis for motor's only
    Jx1 = (mm) * ((rm)^2) + (4/3)*(mm) * ((hm)^2) + 2*(mm)*((dm)^2);
    Jy1 = (mm) * ((rm)^2) + (4/3)*(mm) * ((hm)^2) + 2*(mm)*((dm)^2);
    Jz1 = 2*(mm)*((rm)^2) + (4)*(mm)*((dm)^2);
    
    % Inertia Calculations for the ESC's
    ms_oz = str2num(get(handles.ESC_m_edit,'String'));
    as_in = str2num(get(handles.ESC_a_edit,'String')); 
    bs_in = str2num(get(handles.ESC_b_edit,'String')); 
    ds_in = str2num(get(handles.ESC_ds_edit,'String')); 
    
    ms = ms_oz/35.274; % Converts oz to kg
    as = as_in/39.3701; % Converts in to m
    bs = bs_in/39.3701; % Converts in to m
    ds = ds_in/39.3701; % Converts in to m
  
    % Jx2, Jy2, Jz2 --- Inertia's about each axis for ESC's only
    Jx2 = ((ms*(as^2))/6) + ((ms*(bs^2))/6) + (2*(ms)*(ds^2));
    Jy2 = ((ms*(as^2))/6) + ((ms*(bs^2))/6) + (2*(ms)*(ds^2));
    Jz2 = ((ms*(as^2 + bs^2))/3) + 4*(ms)*(ds^2);

    % Inertia Calculations for the Central "HUB"
    mh_oz = str2num(get(handles.HUB_m_edit,'String')); 
    rh_in = str2num(get(handles.HUB_r_edit,'String')); 
    Hh_in = str2num(get(handles.HUB_H_edit,'String')); 

    mh = mh_oz/35.274; % Converts oz to kg
    rh = rh_in/39.3701; % Converts in to m
    Hh = Hh_in/39.3701; % Converts in to m
    
    % Jx3, Jy3, Jz3 --- Inertia's about each axis for Central HUB only
    Jx3 = (1/4)*((mh))*((rh)^2) + (1/12)*((mh))*((Hh)^2);
    Jy3 = (1/4)*((mh))*((rh)^2) + (1/12)*((mh))*((Hh)^2);
    Jz3 = (1/2)*((mh))*((rh)^2);
    
    % Inertia Calculations for the Arms
    ma_oz = str2num(get(handles.arms_m_edit,'String'));
    ra_in = str2num(get(handles.arms_r_edit,'String'));
    La_in = str2num(get(handles.arms_L_edit,'String'));
    da_in = str2num(get(handles.arms_da_edit,'String'));
    
    ma = ma_oz/35.274; % Converts oz to kg
    ra = ra_in/39.3701; % Converts in to m
    La = La_in/39.3701; % Converts in to m
    da = da_in/39.3701; % Converts in to m

    % Jx4, Jy4, Jz4 --- Inertia's about each axis for Arms only
    Jx4 = ((3/2)*(ma)*(ra^2)) + ((2/3)*(ma)*(La^2)) + (2)*(ma)*(da^2);
    Jy4 = ((3/2)*(ma)*(ra^2)) + ((2/3)*(ma)*(La^2)) + (2)*(ma)*(da^2);
    Jz4 = ((ma)*((ra)^2)) + (4/3)*((ma) * ((La)^2)) + (4)*(ma)*(da^2);

    % Add together Jx(1,2,3,4), Jy(1,2,3,4) and Jz(1,2,3,4)
    % Gives the M.O.I. for the entire vehicle
    totalX = Jx1 + Jx2 + Jx3 + Jx4;
    totalY = Jy1 + Jy2 + Jy3 + Jy4;
    totalZ = Jz1 + Jz2 + Jz3 + Jz4;

    % Converts total Jx, Jy, Jz values to strings
    a = num2str(totalX);
    b = num2str(totalY);
    c = num2str(totalZ);
    
    % Sets the GUI display handles to the inertia values
    set(handles.jx,'String',a);
    set(handles.jy,'String',b);
    set(handles.jz,'String',c);

    % Automatically calculating the total mass of the quadcopter
    massTotal = 4*mm + 4*ms + mh + 4*ma;
    set(handles.massTotal_edit,'String',massTotal);
    
end
 
guidata(hObject, handles);


function edit39_Callback(hObject, eventdata, handles)
% hObject    handle to massTotal_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of massTotal_edit as text
%        str2double(get(hObject,'String')) returns contents of massTotal_edit as a double


% --- Executes during object creation, after setting all properties.
function edit39_CreateFcn(hObject, eventdata, handles)
% hObject    handle to massTotal_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit40_Callback(hObject, eventdata, handles)
% hObject    handle to cq_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cq_edit as text
%        str2double(get(hObject,'String')) returns contents of cq_edit as a double


% --- Executes during object creation, after setting all properties.
function edit40_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cq_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in loadButton.
function loadButton_Callback(hObject, eventdata, handles)
% hObject    handle to loadButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% This Load button is used when the user wishes to change only a few
% values of an existing structure (that is already saved). Instead of
% re-typing all the quad parameters back into the GUI again only to change
% 1 or 2 values, they can load the values back in quickly and make the necessary
% changes, and re-save as required.

uiload; % Brings up standard load window, a structure is then selected

if exist('quadModel')
set(handles.si_button, 'Value', 1)
set(handles.eng_button, 'Value', 0)

set(handles.motor_m_edit,'String',quadModel.motor_m*1000);
set(handles.motor_dm_edit,'String',quadModel.motor_dm*100);
set(handles.motor_h_edit,'String',quadModel.motor_h*100);
set(handles.motor_r_edit,'String',quadModel.motor_r*100);
 
set(handles.ESC_m_edit,'String',quadModel.ESC_m*1000);
set(handles.ESC_a_edit,'String',quadModel.ESC_a*100);
set(handles.ESC_b_edit,'String',quadModel.ESC_b*100);
set(handles.ESC_ds_edit,'String',quadModel.ESC_ds*100);
 
set(handles.HUB_m_edit,'String',quadModel.HUB_m*1000);
set(handles.HUB_r_edit,'String',quadModel.HUB_r*100);
set(handles.HUB_H_edit,'String',quadModel.HUB_H*100);
 
set(handles.arms_m_edit,'String',quadModel.arms_m*1000);
set(handles.arms_r_edit,'String',quadModel.arms_r*100);
set(handles.arms_L_edit,'String',quadModel.arms_L*100);
set(handles.arms_da_edit,'String',quadModel.arms_da*100);
 
set(handles.ct_edit,'String',quadModel.ct);
set(handles.cq_edit,'String',quadModel.cq);

set(handles.tConstant,'String',quadModel.T);
set(handles.minThr,'String',quadModel.minThr);
set(handles.cr_edit,'String',quadModel.cr);
set(handles.b_edit,'String',quadModel.b);

set(handles.motor_m_unit, 'String', 'g');
set(handles.ESC_m_unit, 'String', 'g');
set(handles.HUB_m_unit, 'String', 'g');
set(handles.Arms_m_unit, 'String', 'g');

set(handles.motor_dm_unit, 'String', 'cm');
set(handles.motor_h_unit, 'String', 'cm');
set(handles.motor_r_unit, 'String', 'cm');
set(handles.ESC_a_unit, 'String', 'cm');
set(handles.ESC_b_unit, 'String', 'cm');
set(handles.ESC_ds_unit, 'String', 'cm');
set(handles.HUB_r_unit, 'String', 'cm');
set(handles.HUB_H_unit, 'String', 'cm');
set(handles.Arms_r_unit, 'String', 'cm');
set(handles.Arms_L_unit, 'String', 'cm');
set(handles.Arms_da_unit, 'String', 'cm');

else
end

function tConstant_Callback(hObject, eventdata, handles)
% hObject    handle to tConstant (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tConstant as text
%        str2double(get(hObject,'String')) returns contents of tConstant as a double


% --- Executes during object creation, after setting all properties.
function tConstant_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tConstant (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in unitPanel.
function unitPanel_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in unitPanel 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

switch get(eventdata.NewValue, 'Tag')
    
    case 'si_button' % SI units is selected
        
        choice1 = questdlg('Changing unit systems erases all cells. Continue?','WARNING','Yes','No','No');
        
        switch choice1
            
            case 'Yes'
        
                set(handles.motor_m_unit, 'String', 'g');
                set(handles.ESC_m_unit, 'String', 'g');
                set(handles.HUB_m_unit, 'String', 'g');
                set(handles.Arms_m_unit, 'String', 'g');
                set(handles.motor_dm_unit, 'String', 'cm');
                set(handles.motor_h_unit, 'String', 'cm');
                set(handles.motor_r_unit, 'String', 'cm');
                set(handles.ESC_a_unit, 'String', 'cm');
                set(handles.ESC_b_unit, 'String', 'cm');
                set(handles.ESC_ds_unit, 'String', 'cm');
                set(handles.HUB_r_unit, 'String', 'cm');
                set(handles.HUB_H_unit, 'String', 'cm');
                set(handles.Arms_r_unit, 'String', 'cm');
                set(handles.Arms_L_unit, 'String', 'cm');
                set(handles.Arms_da_unit, 'String', 'cm');

                % Also clear all the text boxes
                set(handles.jx,'String','');
                set(handles.jy,'String','');
                set(handles.jz,'String','');
                set(handles.massTotal_edit,'String','');
                set(handles.ct_edit,'String','');
                set(handles.cq_edit,'String','');

                set(handles.motor_m_edit,'String','');
                set(handles.motor_dm_edit,'String','');
                set(handles.motor_h_edit,'String','');
                set(handles.motor_r_edit,'String','');

                set(handles.ESC_m_edit,'String','');
                set(handles.ESC_a_edit,'String','');
                set(handles.ESC_b_edit,'String','');
                set(handles.ESC_ds_edit,'String','');

                set(handles.HUB_m_edit,'String','');
                set(handles.HUB_r_edit,'String','');
                set(handles.HUB_H_edit,'String','');

                set(handles.arms_m_edit,'String','');
                set(handles.arms_r_edit,'String','');
                set(handles.arms_L_edit,'String','');
                set(handles.arms_da_edit,'String','');

                set(handles.tConstant,'String','');
                set(handles.minThr,'String','');
                set(handles.cr_edit,'String','');
                set(handles.b_edit,'String','');
        
        
            case 'No'
        
                set(handles.eng_button, 'Value', 1)
                set(handles.si_button, 'Value', 0)
                
                set(handles.motor_m_unit, 'String', 'oz');
                set(handles.ESC_m_unit, 'String', 'oz');
                set(handles.HUB_m_unit, 'String', 'oz');
                set(handles.Arms_m_unit, 'String', 'oz');
                set(handles.motor_dm_unit, 'String', 'in');
                set(handles.motor_h_unit, 'String', 'in');
                set(handles.motor_r_unit, 'String', 'in');
                set(handles.ESC_a_unit, 'String', 'in');
                set(handles.ESC_b_unit, 'String', 'in');
                set(handles.ESC_ds_unit, 'String', 'in');
                set(handles.HUB_r_unit, 'String', 'in');
                set(handles.HUB_H_unit, 'String', 'in');
                set(handles.Arms_r_unit, 'String', 'in');
                set(handles.Arms_L_unit, 'String', 'in');
                set(handles.Arms_da_unit, 'String', 'in');
                
        end
        
    case 'eng_button' % English units is selected
        
        choice2 = questdlg('Changing unit systems erases all cells. Continue?','WARNING','Yes','No','No');
        
        switch choice2
        
            case 'Yes'
                set(handles.motor_m_unit, 'String', 'oz');
                set(handles.ESC_m_unit, 'String', 'oz');
                set(handles.HUB_m_unit, 'String', 'oz');
                set(handles.Arms_m_unit, 'String', 'oz');
                set(handles.motor_dm_unit, 'String', 'in');
                set(handles.motor_h_unit, 'String', 'in');
                set(handles.motor_r_unit, 'String', 'in');
                set(handles.ESC_a_unit, 'String', 'in');
                set(handles.ESC_b_unit, 'String', 'in');
                set(handles.ESC_ds_unit, 'String', 'in');
                set(handles.HUB_r_unit, 'String', 'in');
                set(handles.HUB_H_unit, 'String', 'in');
                set(handles.Arms_r_unit, 'String', 'in');
                set(handles.Arms_L_unit, 'String', 'in');
                set(handles.Arms_da_unit, 'String', 'in');


                % Also clear all the text boxes
                set(handles.jx,'String','');
                set(handles.jy,'String','');
                set(handles.jz,'String','');
                set(handles.massTotal_edit,'String','');
                set(handles.ct_edit,'String','');
                set(handles.cq_edit,'String','');

                set(handles.motor_m_edit,'String','');
                set(handles.motor_dm_edit,'String','');
                set(handles.motor_h_edit,'String','');
                set(handles.motor_r_edit,'String','');

                set(handles.ESC_m_edit,'String','');
                set(handles.ESC_a_edit,'String','');
                set(handles.ESC_b_edit,'String','');
                set(handles.ESC_ds_edit,'String','');

                set(handles.HUB_m_edit,'String','');
                set(handles.HUB_r_edit,'String','');
                set(handles.HUB_H_edit,'String','');

                set(handles.arms_m_edit,'String','');
                set(handles.arms_r_edit,'String','');
                set(handles.arms_L_edit,'String','');
                set(handles.arms_da_edit,'String','');

                set(handles.tConstant,'String','');
                set(handles.minThr,'String','');
                set(handles.cr_edit,'String','');
                set(handles.b_edit,'String','');
        
            case 'No'
                
                set(handles.si_button, 'Value', 1)
                set(handles.eng_button, 'Value', 0)
                
                set(handles.motor_m_unit, 'String', 'g');
                set(handles.ESC_m_unit, 'String', 'g');
                set(handles.HUB_m_unit, 'String', 'g');
                set(handles.Arms_m_unit, 'String', 'g');
                set(handles.motor_dm_unit, 'String', 'cm');
                set(handles.motor_h_unit, 'String', 'cm');
                set(handles.motor_r_unit, 'String', 'cm');
                set(handles.ESC_a_unit, 'String', 'cm');
                set(handles.ESC_b_unit, 'String', 'cm');
                set(handles.ESC_ds_unit, 'String', 'cm');
                set(handles.HUB_r_unit, 'String', 'cm');
                set(handles.HUB_H_unit, 'String', 'cm');
                set(handles.Arms_r_unit, 'String', 'cm');
                set(handles.Arms_L_unit, 'String', 'cm');
                set(handles.Arms_da_unit, 'String', 'cm');
        end
       
end


function minThr_Callback(hObject, eventdata, handles)
% hObject    handle to minThr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of minThr as text
%        str2double(get(hObject,'String')) returns contents of minThr as a double


% --- Executes during object creation, after setting all properties.
function minThr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to minThr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cr_edit_Callback(hObject, eventdata, handles)
% hObject    handle to cr_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cr_edit as text
%        str2double(get(hObject,'String')) returns contents of cr_edit as a double


% --- Executes during object creation, after setting all properties.
function cr_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cr_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b_edit_Callback(hObject, eventdata, handles)
% hObject    handle to b_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b_edit as text
%        str2double(get(hObject,'String')) returns contents of b_edit as a double


% --- Executes during object creation, after setting all properties.
function b_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function arms_da_edit_Callback(hObject, eventdata, handles)
% hObject    handle to arms_da_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of arms_da_edit as text
%        str2double(get(hObject,'String')) returns contents of arms_da_edit as a double


% --- Executes during object creation, after setting all properties.
function arms_da_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to arms_da_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
