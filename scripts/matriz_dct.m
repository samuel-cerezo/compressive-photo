function[Y]=matriz_dct(n,i)

% n es la cantidad de pixeles por lado de la matriz
% i es el orden de la matriz que se busca

X = zeros(n*n,1);
X(i)=1;
X = reshape(X,n,n);
X=X';
Y = idct2(X);
Y = Y + abs(min(min(Y)));
Y = Y/(max(max(Y)));




