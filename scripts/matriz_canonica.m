function[w]=matriz_canonica(N,i)
% la idea de esta funcion es obtener una matriz de medicion de forma canonica
% con la idea de levantar un mapa de fotocorriente de manera directa.
    w = zeros(N*N,1);
    w(i)=1;
    w = reshape(w,N,N);