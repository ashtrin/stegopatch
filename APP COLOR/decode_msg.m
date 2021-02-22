function varargout = decode_msg(varargin)
% DECODE_MSG MATLAB code for decode_msg.fig
%      DECODE_MSG, by itself, creates a new DECODE_MSG or raises the existing
%      singleton*.
%
%      H = DECODE_MSG returns the handle to a new DECODE_MSG or the handle to
%      the existing singleton*.
%
%      DECODE_MSG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DECODE_MSG.M with the given input arguments.
%
%      DECODE_MSG('Property','Value',...) creates a new DECODE_MSG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before decode_msg_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to decode_msg_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help decode_msg

% Last Modified by GUIDE v2.5 24-Feb-2017 13:54:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @decode_msg_OpeningFcn, ...
                   'gui_OutputFcn',  @decode_msg_OutputFcn, ...
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


% --- Executes just before decode_msg is made visible.
function decode_msg_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to decode_msg (see VARARGIN)

% Choose default command line output for decode_msg
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes decode_msg wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.edit3,'String',' ');
set(handles.text2,'String',' ');
set(handles.text3,'String',' ');

[im, map, alpha] = imread('lock1.png');
axes(handles.axes1);
f = imshow(im);
set(f, 'AlphaData', alpha);
set(handles.axes3,'visible','off');




% --- Outputs from this function are returned to the command line.
function varargout = decode_msg_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile({'*.bmp'},'Select Image to Hide Message.');
  img = imread( strcat(PathName,FileName) );
  assignin('base','stego',img);
  %set(handles.org,'String','Original Image');
 axes(handles.axes1);
 imshow(img);
 set(handles.text2,'String','STEGO IMAGE');
 
 set(handles.text3,'String','Please load the key');  
[im, map, alpha] = imread('key.png');
axes(handles.axes3);
q = imshow(im);
set(q, 'AlphaData', alpha);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile({'*.mat'},'Select key');
  key = load(strcat(PathName,FileName) );
  assignin('base','key',key.index_table);
set(handles.text3,'String','');  

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%stego_image = work_bench;
%figure;imshow(stego_image);
stego_image = evalin('base','stego');
key = evalin('base', 'key');

pos = 1; % Creating a base patch
flag = 0;
for i = 1:34:1327 
     if((key{1,pos}==-1)&&(flag==0))
        base_patch(1:34,1:34,1)=stego_image(1:34,i:i+33,1);
        base_patch(1:34,1:34,2)=stego_image(1:34,i:i+33,2);
        base_patch(1:34,1:34,3)=stego_image(1:34,i:i+33,3);
        flag=flag+1;
     end
     pos=pos+1;
end

for i = 1:1500 %creating base_patch collection
    patch_coll_base(i).p = base_patch;
end

posi = 1;
for i = 1:34:1327    %Extracting patches
    posj = 1;
    for j = 1:34:1327
     if(key{posi,posj}~=-1)
      patch_coll_base(key{posi,posj}).p(:,:,1)=stego_image(i:i+33,j:j+33,1);
      patch_coll_base(key{posi,posj}).p(:,:,2)=stego_image(i:i+33,j:j+33,2);  
      patch_coll_base(key{posi,posj}).p(:,:,3)=stego_image(i:i+33,j:j+33,3);
     end
      posj=posj+1;
    end
    posi=posi+1;
end




for i = 1:1500 %Decimal Value from RGB
     r(i).p=bitxor(patch_coll_base(i).p(2,2,1),base_patch(2,2,1));
     g(i).p=bitxor(patch_coll_base(i).p(2,2,2),base_patch(2,2,2));
     b(i).p=bitxor(patch_coll_base(i).p(2,2,3),base_patch(2,2,3));
end

for i = 1:1500 %Dec to bin of RGB
    r_bin(i).p=dec2bin(r(i).p,4);
    g_bin(i).p=dec2bin(g(i).p,2);
    b_bin(i).p=dec2bin(b(i).p,1);
end

for i = 1:1500 %Combining bin of RGB
    letter_bin(i).p=strcat(b_bin(i).p,g_bin(i).p,r_bin(i).p);
end

for i = 1:1500 %Converting bin to ascii dec
    letter_dec(i).p=bin2dec(letter_bin(i).p);
end

for i = 1:1500 %Converting dec to char
    secret_msg(i)=char(letter_dec(i).p);
end

set(handles.edit3,'String',secret_msg);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close('decode_msg');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choose
close('decode_msg');
