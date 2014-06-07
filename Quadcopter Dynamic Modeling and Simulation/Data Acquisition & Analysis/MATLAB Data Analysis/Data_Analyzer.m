function varargout = Data_Analyzer(varargin)
% DATA_ANALYZER MATLAB code for Data_Analyzer.fig
%      DATA_ANALYZER, by itself, creates a new DATA_ANALYZER or raises the existing
%      singleton*.
%
%      H = DATA_ANALYZER returns the handle to a new DATA_ANALYZER or the handle to
%      the existing singleton*.
%
%      DATA_ANALYZER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATA_ANALYZER.M with the given input arguments.
%
%      DATA_ANALYZER('Property','Value',...) creates a new DATA_ANALYZER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Data_Analyzer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Data_Analyzer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Data_Analyzer

% Last Modified by GUIDE v2.5 25-Apr-2014 11:25:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Data_Analyzer_OpeningFcn, ...
                   'gui_OutputFcn',  @Data_Analyzer_OutputFcn, ...
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


% --- Executes just before Data_Analyzer is made visible.
function Data_Analyzer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Data_Analyzer (see VARARGIN)

handles.fSelect = 1;
movegui('center'); % Moves GUI to center of screen

% Choose default command line output for Data_Analyzer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Data_Analyzer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Data_Analyzer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in loadButton.
function loadButton_Callback(hObject, eventdata, handles)
% hObject    handle to loadButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

evalin('base','clear all'); 
uiopen('load');

if exist('Seconds')
assignin('base', 'Seconds', Seconds);
assignin('base', 'Throttle', Throttle);
assignin('base', 'RPM', RPM);

if exist('gramsMeas')
assignin('base', 'gramsMeas', gramsMeas);
end

end

% --- Executes on selection change in analysisType.
function analysisType_Callback(hObject, eventdata, handles)
% hObject    handle to analysisType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns analysisType contents as cell array
%        contents{get(hObject,'Value')} returns selected item from analysisType

handles.fSelect = get(hObject,'Value');

guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function analysisType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to analysisType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function bedit_Callback(hObject, eventdata, handles)
% hObject    handle to bedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bedit as text
%        str2double(get(hObject,'String')) returns contents of bedit as a double


% --- Executes during object creation, after setting all properties.
function bedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hedit_Callback(hObject, eventdata, handles)
% hObject    handle to hedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hedit as text
%        str2double(get(hObject,'String')) returns contents of hedit as a double


% --- Executes during object creation, after setting all properties.
function hedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lowCutoff_Callback(hObject, eventdata, handles)
% hObject    handle to lowCutoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lowCutoff as text
%        str2double(get(hObject,'String')) returns contents of lowCutoff as a double


% --- Executes during object creation, after setting all properties.
function lowCutoff_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lowCutoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function highCutoff_Callback(hObject, eventdata, handles)
% hObject    handle to highCutoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of highCutoff as text
%        str2double(get(hObject,'String')) returns contents of highCutoff as a double


% --- Executes during object creation, after setting all properties.
function highCutoff_CreateFcn(hObject, eventdata, handles)
% hObject    handle to highCutoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputValues_Callback(hObject, eventdata, handles)
% hObject    handle to inputValues (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputValues as text
%        str2double(get(hObject,'String')) returns contents of inputValues as a double


% --- Executes during object creation, after setting all properties.
function inputValues_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputValues (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in runButton.
function runButton_Callback(hObject, eventdata, handles)
% hObject    handle to runButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Seconds = evalin('base', 'Seconds');
Throttle = evalin('base', 'Throttle');
RPM = evalin('base', 'RPM');
existCheck = 'exist(''gramsMeas'',''var'')'; % String to evaluate from context of base workspace
if evalin('base',existCheck)
gramsMeas = evalin('base', 'gramsMeas');
end

% Check to see if the user inputs low/high cutoffs:
inputCheck = get(handles.lowCutoff, 'String');

% If the user doesn't input anything:
if isempty(inputCheck)
    
    LowCutoff = min(Throttle);
    HighCutoff = max(Throttle);
    
% Or, if they manually input the low/high cutoffs:    
else
    LowCutoff = str2num(get(handles.lowCutoff, 'String'));
    HighCutoff = str2num(get(handles.highCutoff, 'String'));
end 

b = str2num(get(handles.bedit, 'String')); % assumed inches
h = str2num(get(handles.hedit, 'String')); % assumed inches
L = str2num(get(handles.Ledit, 'String')); % assumed inches, converted within function
switch handles.fSelect % Get Tag of selected object
    case 1
        
        calculate_CR_B(Seconds, Throttle, RPM, LowCutoff, HighCutoff);
        
    case 2
        
        calculate_CR_B(Seconds, Throttle, RPM, LowCutoff, HighCutoff);
        calculate_CT(Seconds, Throttle, RPM, b, h, gramsMeas, LowCutoff, HighCutoff);

        
    case 3
        
        calculate_CR_B(Seconds, Throttle, RPM, LowCutoff, HighCutoff);
        calculate_CQ(Seconds, Throttle, RPM, L, gramsMeas, LowCutoff, HighCutoff);
        
        
    case 4
        
        calculate_TC(Seconds, Throttle, RPM);
end


% --- Executes during object creation, after setting all properties.
function Ledit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ledit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ledit_Callback(hObject, eventdata, handles)
% hObject    handle to Ledit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ledit as text
%        str2double(get(hObject,'String')) returns contents of Ledit as a double
