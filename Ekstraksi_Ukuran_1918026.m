function varargout = Ekstraksi_Ukuran_1918026(varargin)
% EKSTRAKSI_UKURAN_1918026 MATLAB code for Ekstraksi_Ukuran_1918026.fig
%      EKSTRAKSI_UKURAN_1918026, by itself, creates a new EKSTRAKSI_UKURAN_1918026 or raises the existing
%      singleton*.
%
%      H = EKSTRAKSI_UKURAN_1918026 returns the handle to a new EKSTRAKSI_UKURAN_1918026 or the handle to
%      the existing singleton*.
%
%      EKSTRAKSI_UKURAN_1918026('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EKSTRAKSI_UKURAN_1918026.M with the given input arguments.
%
%      EKSTRAKSI_UKURAN_1918026('Property','Value',...) creates a new EKSTRAKSI_UKURAN_1918026 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Ekstraksi_Ukuran_1918026_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Ekstraksi_Ukuran_1918026_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Ekstraksi_Ukuran_1918026

% Last Modified by GUIDE v2.5 25-May-2022 22:33:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Ekstraksi_Ukuran_1918026_OpeningFcn, ...
                   'gui_OutputFcn',  @Ekstraksi_Ukuran_1918026_OutputFcn, ...
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


% --- Executes just before Ekstraksi_Ukuran_1918026 is made visible.
function Ekstraksi_Ukuran_1918026_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Ekstraksi_Ukuran_1918026 (see VARARGIN)

% Choose default command line output for Ekstraksi_Ukuran_1918026
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Ekstraksi_Ukuran_1918026 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Ekstraksi_Ukuran_1918026_OutputFcn(hObject, eventdata, handles) 
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
[nama_file, nama_path] = uigetfile({'*.jpg;*.bmp;*.tif'}, 'membuka gambar'); %memilih gambar
if ~isequal(nama_file,0)
    % membaca file citra
    Img = im2double(imread(fullfile(nama_path, nama_file)));
    % menampilkan citra pada axes 1
    axes(handles.axes1)
    imshow(Img)
    % menyimpan variabel Img pada lokasi handles
    handles.Img = Img;
    guidata(hObject, handles)
else
    % jika tidak ada file yang dipilih maka akan kembali
    return
end



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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% memanggil variabel Img yang ada di lokasi handles
Img = handles.Img;
% konversi citra RGB menjadi grayscale
b = rgb2gray(Img);
% konversi citra grayscale menjadi biner
level = graythresh(b);
c = imbinarize(b,level);
area = bwarea(c);
perim = bwperim(c);
perimeter = sum (sqrt(sum(area,2)));
set(handles.edit1,'string',area);
set(handles.edit2,'string',bwarea(perim));