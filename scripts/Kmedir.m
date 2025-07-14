%**************************************************************************
% ELECTROMETRO: Medición de corriente Keithley 2400
%**************************************************************************

clear all
close all
clc

s1 = serial('COM3','DataBits',8,'Parity','none','StopBits',1,...
    'BaudRate',57600,'FlowControl','none',...
    'Terminator','CR','Timeout',10);
fopen(s1);

%**************************************************************************
%Rutina de inicialización del Keithley
%**************************************************************************
fprintf(s1,'*RST');

% Configuración de amperímetro
%**************************************************************************
fprintf(s1,':SENS:FUNC "CURR"'); %medimos corriente
fprintf(s1,':SENS:CURR:PROT 1.0e-1');%Valor de protección de corriente
fprintf(s1,':SENS:CURR:RANG 1e-1'); %establecemos el rango
%fprintf(s1,':SENS:AVER OFF');   %no hago promedio
%fprintf(s1,':SYST:AZER OFF');  %Deshabilitamos la funcion AUTO ZERO
%fprintf(s1,':SOUR:DEL .0');  %Deshabilitamos la funcion de DELAY en la medicion
%fprintf(s1,':SENS:CURR:NPLC 0.1');  %Reduzco el tiempo de integracion al minimo
fprintf(s1,':SENS:CURR:NPLC 1');  %tiempo de integracion normal
fprintf(s1,':SENS:AVER:COUN 10');    %Hago un promedio de 50 mediciones
fprintf(s1,':SENS:AVER ON');
fprintf(s1,':OUTP ON');
%**************************************************************************
%                          Medición
%**************************************************************************
%tic

fprintf(s1,':READ?');
dato = fscanf(s1);  %recibo lo que me manda el Keithley
datos_string = strsplit(dato,',');  %separo las variables que obtuve
i_celda = str2double(datos_string(2))*1000   % Obtengo el valor de corriente en "mA"

%toc

%Im_RGB1 = imread('C:\Users\Cerezo PC\Dropbox\Tesis\scripts MATLAB\imagen1.jpg');
%figure(1)
%imshow(Im_RGB1)

fclose(s1)
delete(s1)





