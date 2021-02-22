function varargout = front(varargin)
%FRONT MATLAB code file for front.fig
%      FRONT, by itself, creates a new FRONT or raises the existing
%      singleton*.
%
%      H = FRONT returns the handle to a new FRONT or the handle to
%      the existing singleton*.
%
%      FRONT('Property','Value',...) creates a new FRONT using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to front_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      FRONT('CALLBACK') and FRONT('CALLBACK',hObject,...) call the
%      local function named CALLBACK in FRONT.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help front

% Last Modified by GUIDE v2.5 15-Feb-2017 11:56:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @front_OpeningFcn, ...
                   'gui_OutputFcn',  @front_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before front is made visible.
function front_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for front
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes front wait for user response (see UIRESUME)
% uiwait(handles.figure1);
[im, map, alpha] = imread('lock_r.png');
f = imshow(im);
set(f, 'AlphaData', alpha);
axes(handles.axes1);

axis off
axis image

%[im, map, alpha] = imread('lockkk.png','Back','none');
%f = imshow(im);
%set(im, 'AlphaData', alpha);
% --- Outputs from this function are returned to the command line.
function varargout = front_OutputFcn(hObject, eventdata, handles)
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
choose
close('front');
