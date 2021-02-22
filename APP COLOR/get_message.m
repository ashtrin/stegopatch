function varargout = get_message(varargin)
% GET_MESSAGE MATLAB code for get_message.fig
%      GET_MESSAGE, by itself, creates a new GET_MESSAGE or raises the existing
%      singleton*.
%
%      H = GET_MESSAGE returns the handle to a new GET_MESSAGE or the handle to
%      the existing singleton*.
%
%      GET_MESSAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GET_MESSAGE.M with the given input arguments.
%
%      GET_MESSAGE('Property','Value',...) creates a new GET_MESSAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before get_message_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to get_message_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help get_message

% Last Modified by GUIDE v2.5 10-Feb-2017 20:27:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @get_message_OpeningFcn, ...
                   'gui_OutputFcn',  @get_message_OutputFcn, ...
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


% --- Executes just before get_message is made visible.
function get_message_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to get_message (see VARARGIN)

% Choose default command line output for get_message
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes get_message wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.edit1,'String',' ');
input=evalin('base', 'img');
patch_crop=imcrop(input,[1 1 33 33]);%cropping out patch

%figure;imshow(patch_crop);

for i = 1:34 %changing black border
    for j = 1:34
        if(patch_crop(i,j)==1)
            patch_crop(i,j)=180;
        end
    end
end

axes(handles.axes1); 
imshow(patch_crop);


% --- Outputs from this function are returned to the command line.
function varargout = get_message_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in encode.
function encode_Callback(hObject, eventdata, handles)
% hObject    handle to encode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input=evalin('base', 'img');
patch_crop=imcrop(input,[1 1 33 33]);%cropping out patch

%figure;imshow(patch_crop);

for i = 1:34 %changing black border
    for j = 1:34
        if(patch_crop(i,j)==1)
            patch_crop(i,j)=180;
        end
    end
end

axes(handles.axes1); 
imshow(patch_crop);


for i = 1:40 %creating index table
    for j = 1:40
        index_table{i,j}=-1;
    end
end


count=1; %random patch loc.
while(count<=1500)
        posi=randi(40);
        posj=randi(40);
        if((count<=1500)&&(index_table{posi,posj}==-1))
                    index_table{posi,posj}=count;
                    count=count+1;
        end
end

rgb_patch_crop = cat(3, patch_crop, patch_crop, patch_crop);%converting patch to rgb

for i = 1:1500 %creating patch collection
    patch_coll(i).p =rgb_patch_crop;
end

user_input=get(handles.edit1,'String');
disp(user_input)

answer=char(user_input);
input_size=length(answer);

if(input_size < 1500)
    for i = input_size+1:1500
        answer(i)=' ';
    end
end
    
for i = 1:1500 
binary(i).b=dec2bin(answer(i),7);
end

for i= 1:1500
    patch_coll(i).p(:,:,1) = bitxor(rgb_patch_crop(:,:,1),bin2dec(binary(i).b(4:7))); %EMBEDDING
    patch_coll(i).p(:,:,2) = bitxor(rgb_patch_crop(:,:,2),bin2dec(binary(i).b(2:3)));
    patch_coll(i).p(:,:,3) = bitxor(rgb_patch_crop(:,:,3),bin2dec(binary(i).b(1)));
end


%figure;imshow(rgb_patch_crop);

work_bench=zeros(1360,1360,'uint8'); %initialize work bench

%figure;imshow(work_bench);


posj = 1;
for j = 1:34:1327 
    posi = 1;
    for i = 1:34:1327    %Pasting Patches
     if(index_table{posj,posi}==-1)
        work_bench(j:j+33,i:i+33,1)=rgb_patch_crop(1:34,1:34,1);
        work_bench(j:j+33,i:i+33,2)=rgb_patch_crop(1:34,1:34,2);
        work_bench(j:j+33,i:i+33,3)=rgb_patch_crop(1:34,1:34,3);
    else
        work_bench(j:j+33,i:i+33,1)=patch_coll(index_table{posj,posi}).p(1:34,1:34,1);
        work_bench(j:j+33,i:i+33,2)=patch_coll(index_table{posj,posi}).p(1:34,1:34,2);
        work_bench(j:j+33,i:i+33,3)=patch_coll(index_table{posj,posi}).p(1:34,1:34,3);
     end
     posi=posi+1;
    end
    posj=posj+1;
end

assignin('base','work_bench',work_bench);
assignin('base','key',index_table);

imwrite(work_bench,'STEGO.bmp');
save('key.mat','index_table');

encoded
close('get_message');
    


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
select_image
close('get_message');
