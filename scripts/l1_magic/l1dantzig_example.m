% l1dantzig_example.m
%
% Test out l1dantzig code (l1 minimization with bounded residual correlation).
%
% Written by: Justin Romberg, Caltech
% Email: jrom@acm.caltech.edu
% Created: October 2005
%

% put optimization code in path if not already there
path(path, './Optimization');

% signal length. Representa la dimension del mapa de corriente.
N = 512;

% number of spikes to put down
T = 20;

% number of observations to make
K = 120;

% random +/- 1 signal
x = zeros(N,1); %Vector columna que representa el mapa de corriente.
q = randperm(N);%Hace una permutacion aleatoria.
x(q(1:T)) = sign(randn(T,1));   %le aplica la funcion "sigmoid", 
                                %llevando los valores a valer entre -1 y 1

% measurement matrix = random projection
disp('Creating measurment matrix...');
A = randn(K,N); % Matriz de K filas y N columnas. 
                % K<N, donde K representa el numero de 
                % mediciones que se van a realizar y donde N es la
                % dimension N en los que se representa el mapa de
                % corriente.

A = orth(A')';  %devuelve una base ortonormal de esa matriz
disp('Done.');

% noisy observations
sigma = 0.005;
e = sigma*randn(K,1);
y = A*x + e;

% initial guess = min energy
x0 = A'*y;

% Dantzig selection
epsilon = 3e-3;
tic
xp = l1dantzig_pd(x0, A, [], y, epsilon, 5e-2);
toc


% large scale
% Afun = @(z) A*z;
% Atfun = @(z) A'*z;
% tic
% xp = l1dantzig_pd(x0, Afun, Atfun, y, epsilon, 5e-2, 50, 1e-8, 500);
% toc




