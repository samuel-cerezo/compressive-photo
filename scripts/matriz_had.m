
function[Y]=matriz_had(n,i)

% n es la cantidad de pixeles por lado de la matriz
% i es el orden de la matriz que se busca

X = zeros(1,n*n);
X(i)=1;
Y = ifwht(X);
Y = Y + abs(min(min(Y)));
Y = Y/(max(max(Y)));
Y = reshape(Y,n,n);


% n=128;
% A = zeros(1,n*n);
% A(5)=1;
% B = ifwht(A);
% B = B + abs(min(min(B)));
% B = B/(max(max(B)));
% B = reshape(B,n,n);
