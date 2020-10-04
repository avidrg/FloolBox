function varargout = FloolBox_v1(varargin)
% ************************************
% *             FLOOLBOX             *
% *   Easy Image Segmentation Tool   *
% *                                  *
% *                     By: BE Tech  *
% *                                  *
% *       Avid ROMAN-GONZALEZ        *
% *    Natalia I. VARGAS-CUENTAS     *
% *   Rut Patricia CONDORI OBREGON   *
% *                                  *
% *  NASA Space Apps Challenge 2020  *
% *                                  *
% *                     October 2020 *
% *                                  *
% ************************************
%
% FLOOLBOX_V1 M-file for FloolBox_v1.fig
%      FLOOLBOX_V1, by itself, creates a new FLOOLBOX_V1 or raises the existing
%      singleton*.
%
%      H = FLOOLBOX_V1 returns the handle to a new FLOOLBOX_V1 or the handle to
%      the existing singleton*.
%
%      FLOOLBOX_V1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FLOOLBOX_V1.M with the given input arguments.
%
%      FLOOLBOX_V1('Property','Value',...) creates a new FLOOLBOX_V1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FloolBox_v1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FloolBox_v1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FloolBox_v1

% Last Modified by GUIDE v2.5 04-Oct-2020 02:43:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FloolBox_v1_OpeningFcn, ...
                   'gui_OutputFcn',  @FloolBox_v1_OutputFcn, ...
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


% --- Executes just before FloolBox_v1 is made visible.
function FloolBox_v1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FloolBox_v1 (see VARARGIN)

% Choose default command line output for FloolBox_v1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FloolBox_v1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Load BE Tech Logo
Logo_BE_Tech = imread('BE_Tech_logo.png');
clear axs_logo_BE_Tech;
axes(handles.axs_logo_BE_Tech);
imshow(Logo_BE_Tech);

% Load NASA Space Apps Challenge Logo
Logo_Challenge = imread('Challenge_Logo.jpg');
clear axs_Imageh;
axes(handles.axs_Image);
imshow(Logo_Challenge);


% --- Outputs from this function are returned to the command line.
function varargout = FloolBox_v1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function txt_Patch_Size_Callback(hObject, eventdata, handles)
% hObject    handle to txt_Patch_Size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_Patch_Size as text
%        str2double(get(hObject,'String')) returns contents of txt_Patch_Size as a double


% --- Executes during object creation, after setting all properties.
function txt_Patch_Size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_Patch_Size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_Classes_Callback(hObject, eventdata, handles)
% hObject    handle to txt_Classes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_Classes as text
%        str2double(get(hObject,'String')) returns contents of txt_Classes as a double


% --- Executes during object creation, after setting all properties.
function txt_Classes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_Classes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_Load_Image.
function btn_Load_Image_Callback(hObject, eventdata, handles)
% hObject    handle to btn_Load_Image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Declaring Global Variables
global I; %Image
global Directory;
global File_Name;

clear axs_Image;
[File_Name, Directory] = uigetfile('*.*');
I = imread([Directory File_Name]);
imshow(I);

% --- Executes on button press in btn_Run.
function btn_Run_Callback(hObject, eventdata, handles)
% hObject    handle to btn_Run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Declaring Global Variables
global I; %Image
global ps; %Patch Size
global Classes; %Number of classes

G = rgb2gray(I);
[m n] = size(G);
ps = str2num(get(handles.txt_Patch_Size, 'string'));
Classes = str2num(get(handles.txt_Classes, 'string'));

% Compression
z=0;
for i=1:fix(m/ps)
    for j=1:fix(n/ps)
        z=z+1;
        patch(1:ps,1:ps)=G((i-1)*ps+1:(i-1)*ps+ps, (j-1)*ps+1:(j-1)*ps+ps);
        imwrite(patch, ['Patch_' num2str(z) '.bmp'], 'bmp');
        imwrite(patch, ['Patch_' num2str(z) '_lossless.jpg'], 'jpg', 'mode', 'lossless');
        imwrite(patch, ['Patch_' num2str(z) '_lossy.jpg'], 'jpg');
        zip(['Patch_' num2str(z) '_zip.zip'], ['Patch_' num2str(z) '.bmp']);
        File_lossless = dir(['Patch_' num2str(z) '_lossless.jpg']);
        File_lossy = dir(['Patch_' num2str(z) '_lossy.jpg']);
        File_zip = dir(['Patch_' num2str(z) '_zip.zip']);
        Compressed(z,1)=File_lossless.bytes;
        Compressed(z,2)=File_lossy.bytes;
        Compressed(z,3)=File_zip.bytes;
        delete(['Patch_' num2str(z) '.bmp']);
        delete(['Patch_' num2str(z) '_lossless.jpg']);
        delete(['Patch_' num2str(z) '_lossy.jpg']);
        delete(['Patch_' num2str(z) '_zip.zip']);
    end
end

% Clustering
Clusters = kmeans(Compressed, Classes);

% Labeling
for k=1:fix(m/ps)
    for q=1:fix(n/ps)
        Labels(ps*(k-1)+1:ps*(k-1)+ps,ps*(q-1)+1:ps*(q-1)+ps,1) = Clusters((k-1)*fix(n/ps)+q);
    end
end

% Mask
Mask = label2rgb(Labels);

% Image Show
clear axs_Image;
imshow(I)
hold on
h_subplot = imshow(Mask);
set(h_subplot, 'alphadata', 0.5);


% --- Executes on button press in btn_Save.
function btn_Save_Callback(hObject, eventdata, handles)
% hObject    handle to btn_Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[File_Name, Directory] = uiputfile({'*.jpg;*.tif;*.png;*.gif;*.bmp','All Image Files';'*.*','All Files' },'Save Image','newresult.bmp');
saveas(gcf, [Directory File_Name '.bmp'], 'bmp');

