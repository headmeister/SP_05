function varargout = skript(varargin)
% SKRIPT MATLAB code for skript.fig
%      SKRIPT, by itself, creates a new SKRIPT or raises the existing
%      singleton*.
%
%      H = SKRIPT returns the handle to a new SKRIPT or the handle to
%      the existing singleton*.
%
%      SKRIPT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SKRIPT.M with the given input arguments.
%
%      SKRIPT('Property','Value',...) creates a new SKRIPT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before skript_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to skript_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help skript

% Last Modified by GUIDE v2.5 12-Apr-2019 21:53:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @skript_OpeningFcn, ...
    'gui_OutputFcn',  @skript_OutputFcn, ...
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


% --- Executes just before skript is made visible.
function skript_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to skript (see VARARGIN)

% Choose default command line output for skript
handles.output = hObject;
handles.data=struct('Data',[],'Modulovany',[],'Demodulovany',[]);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes skript wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = skript_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function pocet_Callback(hObject, eventdata, handles)
% hObject    handle to pocet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pocet as text
%        str2double(get(hObject,'String')) returns contents of pocet as a double


% --- Executes during object creation, after setting all properties.
function pocet_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pocet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in bity.
function bity_Callback(hObject, eventdata, handles)
% hObject    handle to bity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns bity contents as cell array
%        contents{get(hObject,'Value')} returns selected item from bity


% --- Executes during object creation, after setting all properties.
function bity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in generuj.
function generuj_Callback(hObject, eventdata, handles)
% hObject    handle to generuj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(isempty(str2num(handles.pocet.String))||isempty(str2num(handles.sum.String)))
warndlg('Vstup musí být èíslo.')
else
    
    handles.data.Data=generuj(str2num(handles.pocet.String),handles.bity.Value+3);%generovani novych dat
    handles.data.Modulovany=qammod(handles.data.Data,2^(handles.bity.Value+3));%qam modulace
    axes(handles.modulovany);
    plot(handles.data.Modulovany,'b*');
    title('Modulovana data');
    handles.data.Zasumeny=zasum(handles.data.Modulovany,abs(str2num(handles.sum.String)));%zasumeni dat
    axes(handles.axes2);
    plot(handles.data.Zasumeny,'b*');
    title('Zasumena modulovana data');
    handles.data.Demodulovany=uint16(qamdemod(handles.data.Zasumeny,2^(handles.bity.Value+3)));%qam demodulace
    handles.chyba.String=['Chyba je ',num2str(chyba(handles.data.Demodulovany,handles.data.Data,handles.bity.Value+3)),' bitu.'];%vypocet chyby
end
function sum_Callback(hObject, eventdata, handles)
% hObject    handle to sum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sum as text
%        str2double(get(hObject,'String')) returns contents of sum as a double


% --- Executes during object creation, after setting all properties.
function sum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over generuj.
function generuj_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to generuj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
