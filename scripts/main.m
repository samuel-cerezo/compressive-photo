function varargout = pip_cerezo_CS_GUI_v2(varargin)
% PIP_CEREZO_CS_GUI_V2 MATLAB code for pip_cerezo_CS_GUI_v2.fig
%      PIP_CEREZO_CS_GUI_V2, by itself, creates a new PIP_CEREZO_CS_GUI_V2 or raises the existing
%      singleton*.
%
%      H = PIP_CEREZO_CS_GUI_V2 returns the handle to a new PIP_CEREZO_CS_GUI_V2 or the handle to
%      the existing singleton*.
%
%      PIP_CEREZO_CS_GUI_V2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PIP_CEREZO_CS_GUI_V2.M with the given input arguments.
%
%      PIP_CEREZO_CS_GUI_V2('Property','Value',...) creates a new PIP_CEREZO_CS_GUI_V2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pip_cerezo_CS_GUI_v2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pip_cerezo_CS_GUI_v2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pip_cerezo_CS_GUI_v2

% Last Modified by GUIDE v2.5 23-Nov-2019 21:27:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pip_cerezo_CS_GUI_v2_OpeningFcn, ...
                   'gui_OutputFcn',  @pip_cerezo_CS_GUI_v2_OutputFcn, ...
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


% --- Executes just before pip_cerezo_CS_GUI_v2 is made visible.
function pip_cerezo_CS_GUI_v2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pip_cerezo_CS_GUI_v2 (see VARARGIN)

% Choose default command line output for pip_cerezo_CS_GUI_v2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes pip_cerezo_CS_GUI_v2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

set(handles.ventana1, 'Visible', 'On');
set(handles.ventana2, 'Visible', 'Off');
set(handles.cbo_puertos,'Value',3);

% --- Outputs from this function are returned to the command line.
function varargout = pip_cerezo_CS_GUI_v2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function menu_config_Callback(hObject, eventdata, handles)
% hObject    handle to menu_config (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.figure1,'Color',[0.94 0.94 0.94]);
set(handles.ventana1, 'Visible', 'On');
set(handles.ventana2, 'Visible', 'Off');
set(handles.btn_medir, 'Visible', 'Off');

% --------------------------------------------------------------------
function menu_medir_Callback(hObject, eventdata, handles)
% hObject    handle to menu_medir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.ventana1, 'Visible', 'Off');
set(handles.ventana2, 'Visible', 'On');
set(handles.figure1,'Color',[0.94 0.94 0.94]);
set(handles.ventana2,'BackgroundColor',[0.94 0.94 0.94]);

tamanio = get(handles.cbo_dimensiones,'Value'); %Obtengo la opcion seleccionada

switch tamanio %segun el indice, es lo que voy a hacer
    case 1
        n=64;
        posicion_x = 630;
        posicion_y = 290;
    case 2
        n=128;
        posicion_x = 600;
        posicion_y = 240;
    case 3
        n=256;
        posicion_x = 530;
        posicion_y = 166;
    case 4
        n=512;
        posicion_x = 420;
        posicion_y = 38;
end
%%%%%%%%%%%%%%%% Centramos la imagen al cambiar la resolucion %%%%%%%%%%%%

%set(handles.figure1,'Position',[posicion_x,posicion_y,n,n]);

imagen = ones(n,n);    % returns an n-by-n matrix of zeros.
imagesc(imagen), axis off, colormap(gray(2));

% --- Executes on selection change in cbo_dimensiones.
function cbo_dimensiones_Callback(hObject, eventdata, handles)
% hObject    handle to cbo_dimensiones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns cbo_dimensiones contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cbo_dimensiones


% --- Executes during object creation, after setting all properties.
function cbo_dimensiones_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cbo_dimensiones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in cbo_puertos.
function cbo_puertos_Callback(hObject, eventdata, handles)
% hObject    handle to cbo_puertos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns cbo_puertos contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cbo_puertos


% --- Executes during object creation, after setting all properties.
function cbo_puertos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cbo_puertos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_medir.
function btn_medir_Callback(hObject, eventdata, handles)
% hObject    handle to btn_medir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.btn_medir, 'Visible', 'Off');
set(handles.txt_estado,'String',' ');
set(handles.figure1,'Color',[0.0 0.0 0.0]);
set(handles.ventana2,'BackgroundColor',[0.0 0.0 0.0]);
pause(1);   %Ponemos una pausa temporal. Puede ser 0.1 (100ms)

tamanio = get(handles.cbo_dimensiones,'Value'); %Obtengo la opcion seleccionada

switch tamanio %segun el indice, es lo que voy a hacer
    case 1
        n=64;
    case 2
        n=128;
    case 3
        n=256;
    case 4
        n=512;
end

N=n*n;
M = 20;
    
load phi_64_Rademacher;

%----------------- Configuración de la comunicacion serial ----------------
puerto = get(handles.cbo_puertos,'Value'); 
switch puerto %Obtengo el puerto COM seleccionado
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

% s1 = serial(puerto_COM,'DataBits',8,'Parity','none','StopBits',1,...
%     'BaudRate',57600,'FlowControl','none',...
%     'Terminator','CR','Timeout',10);
% fopen(s1);
% fprintf(s1,'*RST');
% fprintf(s1,':SENS:FUNC "CURR"'); %medimos corriente
% fprintf(s1,':SENS:CURR:PROT 1.0e-1');%Valor de protección de corriente
% fprintf(s1,':SENS:CURR:RANG 1e-2'); %establecemos el rango
% fprintf(s1,':SENS:CURR:NPLC 1');  %tiempo de integracion normal
% fprintf(s1,':SENS:AVER:COUN 10');    %Hago un promedio de 50 mediciones
% fprintf(s1,':SENS:AVER ON');
% fprintf(s1,':OUTP ON');
%--------------------------------------------------------------------------
%---------------------- Creamos las matrices necesarias -------------------
Y_gris = zeros(M,1);    % vector columna que contiene ls mediciones
                        % de corriente
Y_rojo = zeros(M,1);    % vector columna que contiene ls mediciones
                        % de corriente
Y_verde = zeros(M,1);   % vector columna que contiene ls mediciones
                        % de corriente
Y_azul = zeros(M,1);    % vector columna que contiene ls mediciones
                        % de corriente
%--------------------------------------------------------------------------

% ----- Construimos los mapas con los que realizamos las mediciones -------
mapa_gris = colormap(gray);
mapa_rojo = zeros(2,3);
mapa_rojo(:,1)=mapa_gris(:,1);
mapa_verde = zeros(2,3);
mapa_verde(:,2)=mapa_gris(:,1);
mapa_azul = zeros(2,3);
mapa_azul(:,3)=mapa_gris(:,1);

patron = reshape(phi_R(1,:),n,n);
imshow(patron),colormap(mapa_gris), axis off;                             
% fprintf(s1,':READ?');             %pedimos la medicion al keithley
% dato = fscanf(s1);                %recibo lo que me manda el Keithley
pause(1);   %Ponemos una pausa temporal. Puede ser 0.1 (100ms)

% ------------------------- medicion en rojo -----------------------------
tic
for fila=1:M
    porcentaje = round(100*fila/M);
    set(handles.txt_estado,'String',sprintf('Progreso: %d%c',porcentaje,'%'));
    patron = reshape(phi_R(fila,:),n,n);
    imagesc(patron),colormap(mapa_gris),axis off;                             
    pause(0.5);   %Ponemos una pausa temporal. Puede ser 0.1 (100ms)
    %  -------------------------- Keithley  -------------------------------
%     fprintf(s1,':READ?');             %pedimos la medicion al keithley
%     dato = fscanf(s1);                %recibo lo que me manda el Keithley
%     datos_string = strsplit(dato,',');%separo las variables que obtuve
%     i_actual = str2double(datos_string(2));%Obtengo el valor de corriente
    %  --------------------------------------------------------------------
    %Y_gris(fila)= i_actual;      %guardamos la corriente en el vector Y
    Y_gris(fila)= fila;      %guardamos la corriente en el vector Y
    pause(0.1);   %Ponemos una pausa temporal. Puede ser 0.1 (100ms)
end
toc
save('vector_Y_gris.mat','Y_gris','-v7.3'); %guardamos los valores
% 
% patron = reshape(phi(98,:),n,n);
% imshow(patron),colormap(mapa_verde), axis off;                             
% fprintf(s1,':READ?');             %pedimos la medicion al keithley
% dato = fscanf(s1);                %recibo lo que me manda el Keithley
% pause(1);   %Ponemos una pausa temporal. Puede ser 0.1 (100ms)
% 
% % ------------------------- medicion en verde -----------------------------
% tic
% for fila=1:M
%     porcentaje = round(100*fila/M);
%     set(handles.txt_estado,'String',sprintf('Progreso: %d%c',porcentaje,'%'));
%     patron = reshape(phi(fila,:),n,n);
%     imshow(patron),colormap(mapa_verde),caxis([c_min,c_max]);                            
%     pause(1);   %Ponemos una pausa temporal. Puede ser 0.1 (100ms)
%     %  -------------------------- Keithley  -------------------------------
%     fprintf(s1,':READ?');             %pedimos la medicion al keithley
%     dato = fscanf(s1);                %recibo lo que me manda el Keithley
%     datos_string = strsplit(dato,',');%separo las variables que obtuve
%     i_actual = str2double(datos_string(2));%Obtengo el valor de corriente
%     clear datos_string;
%     %  --------------------------------------------------------------------
%     Y_verde(fila)= i_actual;      %guardamos la corriente en el vector Y
%     pause(0.1);   %Ponemos una pausa temporal. Puede ser 0.1 (100ms)
% 
% end
% toc
% save('vector_Y_64x64_verde.mat','Y_verde','-v7.3'); %guardamos los valores
% % ------------------------------------------------------------------------
% patron = reshape(phi(98,:),n,n);
% imshow(patron),colormap(mapa_azul), axis off;                             
% fprintf(s1,':READ?');             %pedimos la medicion al keithley
% dato = fscanf(s1);                %recibo lo que me manda el Keithley
% pause(1);   %Ponemos una pausa temporal. Puede ser 0.1 (100ms
% 
% % ------------------------- medicion en azul -----------------------------
% tic
% for fila=1:M
%     porcentaje = round(100*fila/M);
%     set(handles.txt_estado,'String',sprintf('Progreso: %d%c',porcentaje,'%'));
%     patron = reshape(phi(fila,:),n,n);
%     imshow(patron),colormap(mapa_azul),caxis([c_min,c_max]);                            
%     pause(1);   %Ponemos una pausa temporal. Puede ser 0.1 (100ms)
%     %  -------------------------- Keithley  -------------------------------
%     fprintf(s1,':READ?');             %pedimos la medicion al keithley
%     dato = fscanf(s1);                %recibo lo que me manda el Keithley
%     datos_string = strsplit(dato,',');%separo las variables que obtuve
%     i_actual = str2double(datos_string(2));%Obtengo el valor de corriente
%     clear datos_string;
%     %  --------------------------------------------------------------------
%     Y_azul(fila)= i_actual;      %guardamos la corriente en el vector Y
%     pause(0.1);   %Ponemos una pausa temporal. Puede ser 0.1 (100ms)
% 
% end
% toc
% save('vector_Y_64x64_azul.mat','Y_azul','-v7.3'); %guardamos los valores
% 
% patron = reshape(phi(98,:),n,n);
% imshow(patron),colormap(mapa_gris), axis off;                             
% fprintf(s1,':READ?');             %pedimos la medicion al keithley
% dato = fscanf(s1);                %recibo lo que me manda el Keithley
% pause(1);   %Ponemos una pausa temporal. Puede ser 0.1 (100ms)
% 
% % ---------------- Comenzamos la medicion en gris -------------------------
% tic
% for fila=1:M
%     porcentaje = round(100*fila/M);
%     set(handles.txt_estado,'String',sprintf('Progreso: %d%c',porcentaje,'%'));
%     patron = reshape(phi(fila,:),n,n);
%     imshow(patron),colormap(mapa_gris),caxis([c_min,c_max]);                            
%     pause(1);   %Ponemos una pausa temporal. Puede ser 0.1 (100ms)
%     %  -------------------------- Keithley  -------------------------------
%     fprintf(s1,':READ?');             %pedimos la medicion al keithley
%     dato = fscanf(s1);                %recibo lo que me manda el Keithley
%     datos_string = strsplit(dato,',');%separo las variables que obtuve
%     i_actual = str2double(datos_string(2));%Obtengo el valor de corriente
%     clear datos_string;
%     %  --------------------------------------------------------------------
%     Y_gris(fila)= i_actual;      %guardamos la corriente en el vector Y
%     pause(0.1);   %Ponemos una pausa temporal. Puede ser 0.1 (100ms)
% 
% end
% toc
% save('vector_Y_64x64_gris.mat','Y_gris','-v7.3'); %guardamos los valores
% % -------------------------------------------------------------------------

% ----------------------------- Fin de Mediciones -------------------------
% fclose(s1);  % cerramos comunicacion 
% delete(s1);  % cerramos comunicacion
% ------------------------------- Guardamos -------------------------------

%save('vector_Y_%d.mat','Y_gris','-v7.3'),n;

%  ------------------------------------------------------------------------

set(handles.txt_estado,'String','Medición Finalizada');
set(handles.btn_medir, 'Visible', 'On');

% set(handles.figure1,'Color',[0.94 0.94 0.94]);
% set(handles.ventana2,'BackgroundColor',[0.94 0.94 0.94]);

% ---------------------------------- Fin ----------------------------------


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
