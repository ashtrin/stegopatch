function varargout = encoded(varargin)
% ENCODED MATLAB code for encoded.fig
%      ENCODED, by itself, creates a new ENCODED or raises the existing
%      singleton*.
%
%      H = ENCODED returns the handle to a new ENCODED or the handle to
%      the existing singleton*.
%
%      ENCODED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENCODED.M with the given input arguments.
%
%      ENCODED('Property','Value',...) creates a new ENCODED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before encoded_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to encoded_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help encoded

% Last Modified by GUIDE v2.5 22-Feb-2017 12:42:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @encoded_OpeningFcn, ...
                   'gui_OutputFcn',  @encoded_OutputFcn, ...
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


% --- Executes just before encoded is made visible.
function encoded_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to encoded (see VARARGIN)

% Choose default command line output for encoded
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes encoded wait for user response (see UIRESUME)
% uiwait(handles.figure1);
 stego_image = evalin('base','work_bench');
 axes(handles.axes1);
 imshow(stego_image);

% --- Outputs from this function are returned to the command line.
function varargout = encoded_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close('encoded');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choose
close('encoded');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
get_message
close('encoded');
