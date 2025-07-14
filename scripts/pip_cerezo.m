function varargout = pip_cerezo(varargin)
% PIP_CEREZO MATLAB code for pip_cerezo.fig
%      PIP_CEREZO, by itself, creates a new PIP_CEREZO or raises the existing
%      singleton*.
%
%      H = PIP_CEREZO returns the handle to a new PIP_CEREZO or the handle to
%      the existing singleton*.
%
%      PIP_CEREZO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PIP_CEREZO.M with the given input arguments.
%
%      PIP_CEREZO('Property','Value',...) creates a new PIP_CEREZO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pip_cerezo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pip_cerezo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pip_cerezo

% Last Modified by GUIDE v2.5 09-Oct-2019 09:26:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pip_cerezo_OpeningFcn, ...
                   'gui_OutputFcn',  @pip_cerezo_OutputFcn, ...
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


% --- Executes just before pip_cerezo is made visible.
function pip_cerezo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pip_cerezo (see VARARGIN)

% Choose default command line output for pip_cerezo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global n_x;
global n_y;
n_x=256;
n_y=256;


Img = zeros(n_y,n_x);    % returns an n-by-n matrix of zeros.

for x=1:n_y
    for y=1:n_x
        if (x == 1) || (x == n_x) || (y == 1) || (y == n_y) 
            Img(x,y) = 10;
        end 
    end
end

imshow(Img,[]);

set(handles.lbl_valor,'BackgroundColor',[0.8 0.8 0.8]);   % rojo-verde-azul
set(handles.cb_opciones,'Value',3);
set(handles.lbl_valor,'String',' --- ');


% UIWAIT makes pip_cerezo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = pip_cerezo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_calibrar.
function btn_calibrar_Callback(hObject, eventdata, handles)
% hObject    handle to btn_calibrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n_x;
global n_y;

Img = zeros(n_y,n_x);    % returns an n-by-n matrix of zeros.

for x=1:n_y
    for y=1:n_x
        if (x == 1) || (x == n_x) || (y == 1) || (y == n_y) 
            Img(x,y) = 10;
        end 
    end
end

imshow(Img,[])

%%%%%%%%%%%%%%%%%%  Evento cuando selecciono un valor del COMBOBOX %%%%%%%
function cb_opciones_Callback(hObject, eventdata, handles)
% hObject    handle to cb_opciones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%opcion_seleccionada = get(handles.cb_opciones,'Value'); %Obtengo el indice de la opcion que está seleccionada (1,2,3,...)
opcion_seleccionada = get(handles.cb_opciones,'Value'); %Obtengo la opcion seleccionada

switch opcion_seleccionada %segun el indice, es lo que voy a hacer
    case 1
%         x = 0:1/1000:7;
%         y = sin(x);
%         handles.g1 = plot(handles.grafico1,x,y);
        puerto_COM = 'COM1';
    case 2
        puerto_COM = 'COM2';
    case 3
        puerto_COM = 'COM3';
    case 4
        puerto_COM = 'COM4';
    case 5
        puerto_COM = 'COM5';
    case 6
        puerto_COM = 'COM6';
    case 7
        puerto_COM = 'COM7';
end
       
        %%%%%%%%%%%%%%%%%%%%%% Rutina para crear imagen ###################
        %x = [1,2,3,4,5,6;2,3,4,5,6,7;3,4,5,6,7,8];
        %set(handles.grafico1,'Color','[0 0 0]');
        %handles.g1 = plot(handles.grafico1,x,'w.');         
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%set(handles.lbl_valor,'String',puerto_COM);





% Hints: contents = cellstr(get(hObject,'String')) returns cb_opciones contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cb_opciones


% --- Executes on button press in btn_blanco.
function btn_blanco_Callback(hObject, eventdata, handles)
% hObject    handle to btn_blanco (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n_x;
global n_y;

Img = zeros(n_y,n_x);    % returns an n-by-n matrix of zeros.

for x=1:n_y
    for y=1:n_x
            Img(x,y) = 255;              
    end
end
imshow(Img,[])
set(handles.lbl_valor,'String','Imagen en Blanco');

% --- Executes on button press in btn_medir.
function btn_medir_Callback(hObject, eventdata, handles)
% hObject    handle to btn_medir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global n_x;
global n_y;
global N;

N = n_x;

set(handles.lbl_valor,'String','Conectando...');
set(handles.lbl_valor,'BackgroundColor',[0 0 1]);   % rojo-verde-azul

%%%%%%%%%%%%%%%%%%%%%%% Obtenemos el COM seleccionado %%%%%%%%%%%%%%%%%%%%%
opcion_seleccionada = get(handles.cb_opciones,'Value'); %Obtengo la opcion seleccionada

switch opcion_seleccionada %segun el indice, es lo que voy a hacer
    case 1
        puerto_COM = 'COM1';
    case 2
        puerto_COM = 'COM2';
    case 3
        puerto_COM = 'COM3';
    case 4
        puerto_COM = 'COM4';
    case 5
        puerto_COM = 'COM5';
    case 6
        puerto_COM = 'COM6';
    case 7
        puerto_COM = 'COM7';
end

%%%%%%%%%%%%%%%%%%%%%% Configuracion de la medicion %%%%%%%%%%%%%%%%%%%%%%%

s1 = serial(puerto_COM,'DataBits',8,'Parity','none','StopBits',1,...
    'BaudRate',57600,'FlowControl','none',...
    'Terminator','CR','Timeout',10);
fopen(s1);
fprintf(s1,'*RST');
fprintf(s1,':SENS:FUNC "CURR"'); %medimos corriente
fprintf(s1,':SENS:CURR:PROT 1.0e-1');%Valor de protección de corriente
fprintf(s1,':SENS:CURR:RANG 1e-2'); %establecemos el rango
fprintf(s1,':SENS:CURR:NPLC 1');  %tiempo de integracion normal
fprintf(s1,':SENS:AVER:COUN 10');    %Hago un promedio de 50 mediciones
fprintf(s1,':SENS:AVER ON');
fprintf(s1,':OUTP ON');


corriente=zeros(1,N*N);  % Armo la matriz para guardar las corrientes de las matrices
clc
tic

for i=1:(N*N)
%for i=1:(10)

    Img = matriz_hadamard(n_x,i);
    imshow(Img,[])
    set(handles.lbl_valor,'String',sprintf(' Midiendo...\nN° %d',i));
    pause(0.01);   %Ponemos una pausa temporal. Puede ser 0.1 (100ms)
     
    fprintf(s1,':READ?');
    dato = fscanf(s1);  %recibo lo que me manda el Keithley
    datos_string = strsplit(dato,',');  %separo las variables que obtuve
    i_obtenida = str2double(datos_string(2));   % Obtengo el valor de corriente en "mA"
%     %%%%%%i_obtenida_string = num2str(i_obtenida);
%     %%%%%%set(handles.lbl_valor,'String',i_obtenida_string);
    corriente(1,i)=i_obtenida;

end
toc

fclose(s1)
delete(s1)
corriente=reshape(corriente,n_x,n_y); %#ok<NASGU>
eval(sprintf('save(''corriente_wh_resolucion_%d.mat'',''corriente'')',N));
%eval(sprintf('save(''corriente_wh_PRUEBITA_%d.mat'',''corriente'')',N));


%load('C:\Users\Cerezo PC\Dropbox\Tesis\scripts MATLAB\corriente_wh_resolucion_64.mat');
%load('C:\Users\Cerezo PC\Dropbox\Tesis\scripts MATLAB\corriente_wh_PRUEBITA_128.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(handles.lbl_valor,'BackgroundColor',[0 1 0]);   % rojo-verde-azul
set(handles.lbl_valor,'String','Medición Finalizada');

% --- Executes on selection change in cb_resoluciones.
function cb_resoluciones_Callback(hObject, eventdata, handles)
% hObject    handle to cb_resoluciones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns cb_resoluciones contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cb_resoluciones
resolucion_seleccionada = get(handles.cb_resoluciones,'Value'); %Obtengo la opcion seleccionada
global n_x;
global n_y;

switch resolucion_seleccionada %segun el indice, es lo que voy a hacer
    case 1
        n_x=64;
        n_y=64;
        posicion_x = 350;
        posicion_y = 274;
    case 2
        n_x=128;
        n_y=128;
        posicion_x = 314;
        posicion_y = 240;
    case 3
        n_x=256;
        n_y=256;
        posicion_x = 244;
        posicion_y = 166;
    case 4
        n_x=512;
        n_y=512;
        posicion_x = 116;
        posicion_y = 38;
end
%%%%%%%%%%%%%%%% Centramos la imagen al cambiar la resolucion %%%%%%%%%%%%

set(handles.grafico1,'Position',[posicion_x,posicion_y,n_x,n_y]);

Img = zeros(n_y,n_x);    % returns an n-by-n matrix of zeros.

for x=1:n_y
    for y=1:n_x
        if (x == 1) || (x == n_x) || (y == 1) || (y == n_y) 
            Img(x,y) = 10;
        end 
    end
end

imshow(Img,[])

% --- Executes during object creation, after setting all properties.
function cb_resoluciones_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cb_resoluciones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
