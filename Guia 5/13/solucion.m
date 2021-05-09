points = [ 0, 17;
           4, 20;
           9, 16;
          12, 11;
          23,  7;
          30,  3;
          33,  0;
          48,  0;
%          51,  7;
%          54, 14;
          57, 21;
          62, 25;
          67, 22];

% (a) A partir de los datos presentes en el mismo, obtenga los 
%   polinomios de spline cúbicos necesarios para aproximar dicho perfil.

pols = CalcPolinomiosSpline(points);

% (b) Grafique el resultado obtenido y analice si se observan 
%   diferencias con la curva original.
n = size(points, 1);

figure;
hold on;
scatter(points(:, 1), points(:, 2));

for i = 1:n - 1
    fplot(pols(i), [points(i, 1), points(i + 1, 1)]);
end

xlim([points(1, 1), points(n, 1)]);
xticks(points(:, 1));
grid on;

% Sí, se observan diferencias. Algunas de ellas son:
%   - Entre x = 0 y x = 9, y entre x = 57 y x = 67, el perfil no parece
%       una semicircunferencia.
%   - Las caídas entre x = 9 y x = 12, y entre x = 23 y x = 33, están 
%       más suavizadas.
%   - La caída entre x = 12 y x = 23 es más abrupta.
%   - El perfil toma valores negativos entre x = 33 y x = 48.

% (c) ¿Se modifica el perfil si se agregan a los datos los puntos 
%   [51, 7] y [54, 14]? Justifique.

% Basta con eliminar el '%' de las líneas 9 y 10 y ejecutar el código.
% El perfil no se modifica, salvo entre los puntos x = 48 y x = 57, 
%   donde se parece más a la recta original.
