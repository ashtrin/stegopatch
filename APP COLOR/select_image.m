function varargout = select_image(varargin)
% SELECT_IMAGE MATLAB code for select_image.fig
%      SELECT_IMAGE, by itself, creates a new SELECT_IMAGE or raises the existing
%      singleton*.
%
%      H = SELECT_IMAGE returns the handle to a new SELECT_IMAGE or the handle to
%      the existing singleton*.
%
%      SELECT_IMAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECT_IMAGE.M with the given input arguments.
%
%      SELECT_IMAGE('Property','Value',...) creates a new SELECT_IMAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before select_image_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to select_image_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help select_image

% Last Modified by GUIDE v2.5 24-Feb-2017 14:02:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @select_image_OpeningFcn, ...
                   'gui_OutputFcn',  @select_image_OutputFcn, ...
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


% --- Executes just before select_image is made visible.
function select_image_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to select_image (see VARARGIN)

  text1=imread('text1.jpg');
   text2=imread('text2.jpg');
    text3=imread('text3.jpg');
     text4=imread('text4.jpg');
     text5=imread('text5.jpg');
    
set(handles.pushbutton1, 'CData',text1);
set(handles.pushbutton12, 'CData',text2);
set(handles.pushbutton13, 'CData',text3);
set(handles.pushbutton14, 'CData',text4);
set(handles.pushbutton15, 'CData',text5);
[im, map, alpha] = imread('q1.png');
f = imshow(im);
set(f, 'AlphaData', alpha);
%axes(handles.qmark);
axis off
axis image



% Choose default command line output for select_image
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes select_image wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = select_image_OutputFcn(hObject, eventdata, handles) 
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

input = imread('text1.jpg'); %converted into grey color
assignin('base','img',input);
get_message
close('select_image');

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = imread('text2.jpg'); %converted into grey color
assignin('base','img',input);
get_message
close('select_image');

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input =imread('text3.jpg'); %converted into grey color
assignin('base','img',input);
get_message
close('select_image');

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = imread('text4.jpg'); %converted into grey color
assignin('base','img',input);
get_message
close('select_image');

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = imread('text5.jpg'); %converted into grey color
assignin('base','img',input);
get_message
close('select_image');


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choose
close('select_image');
