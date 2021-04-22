% Solución:
%   (a) No se puede estimar (no se cumple la condición) (hecho a mano)
%   (b) Sí se puede estimar (hecho a mano)
%   (c) 1.3810 (con este código)

% (c) Estime la cota de error relativo de la solución obtenida en el
%   ejercicio 4, si los valores de la matriz A varían en un 1%.

A = [  1, -1,  2;
       0,  7,  7;
       0,  0, -1];

b = [ 12;
       7;
      -2];

X = A\b;

dA = A.*0.01;
db = [0;0;0]; % No varía

err = CalcCotaErrorRelativo(A, dA, b, db)

% Verifique el cumplimiento de la cota aplicando variaciones aleatorias
%   (usar M = A + A.*0.01.*rand(3)), resolviendo con Matlab el sistema
%   M*z = b y calculando el error.

for i = 1:10
    M = A + A.*0.01.*rand(3);
    z = M\b;
    err = norm(z - X, inf) / norm(X, inf);
    fprintf('%2d) Error: %4.4f\n', i, err);
end
