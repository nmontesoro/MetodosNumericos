A = [  5,  1, -1;
      -1,  3,  0;
       1,  1,  6];

b = [ -7;
       1;
      11];

A = [2,-1,1; 3,3,5; 1,1,3];
b = [-1; 4; 0];

% (a) Calcule la matriz B tal que una solución de X = B*X + c es también
%   solución de A*X = b (despejar x_i de las diagonales)

B = [    0, -1/5,  1/5;
       1/3,    0,    0;
      -1/6, -1/6,    0]; % Calculada a mano

% (b) La matriz B y el vector c pueden obtenerse mediante ... . Calcule 
%   B y c usando estas ecuaciones y compare con el valor de B calculado en
%   el item anterior.
D = diag(diag(A));
L = tril(A, -1);
U = triu(A, 1);

B = -inv(D)*(L + U);
c = inv(D)*b; % Ambas respuestas son iguales a las calculadas a mano.

% (c) Calcule la norma de B
norm_B = norm(B, inf); % 2/5

% (d) Calcule el radio espectral de B
r_espectral = max(abs(eig(B))); 

% (e) Encuentre una solución x_s usando x = A\b
X_s = A\b;

% (f) Aplique manualmente el método de Jacobi hasta 8 iteraciones.
%   (h) Para cada iteración, calcule la norma del error y del residuo.
X = [0; 0; 0];
disp('Jacobi');
for i = 1:16
    X = B*X + c;
    norm_err = norm(X - X_s, inf);
    norm_res = norm(A*X - b);
    fprintf('%2d) x1 = % 5.4f, x2 = % 5.4f, x3 = % 5.4f, n_err = % 5.4f, n_res = % 5.4f\n', ...
            i, X(1), X(2), X(3), norm_err, norm_res);
end

% (g) Aplique manualmente el método de Gauss-Seidel hasta 8 iteraciones.
%   (h) Para cada iteración, calcule la norma del error y del residuo.
X = [0; 0; 0];
disp('Gauss-Seidel');
B = -inv(tril(A))*triu(A, 1);
c = inv(tril(A))*b;
for i = 1:13
    X = B*X + c;
    norm_err = norm(X - X_s, inf);
    norm_res = norm(A*X - b);
    fprintf('%2d) x1 = % 5.4f, x2 = % 5.4f, x3 = % 5.4f, n_err = % 5.4f, n_res = % 5.4f\n', ...
            i, X(1), X(2), X(3), norm_err, norm_res);
end
