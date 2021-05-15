% a) Encontrar la cantidad de intervalos n para que el cálculo de la 
%   integral tenga error menor a 10^-2 para Simpson 1/3.
% Encontré n = 8.

% b) Calcular la integral usando el método de Simpson 1/3 y el valor de 
%   n = 10.
f = @(x) exp(-x) .* sin(x);
in10 = IntegracionSimpson(f, 'a', 0, 'b', 2*pi, 'n', 10); % 0.497189787541321

% c) Comparar el resultado con el valor correcto de la integral
exacto = 0.5 * (1 - exp(-2*pi));
err_abs10 = abs(exacto - in10); % 0.001876491092825

% d) Explique qué es lo que se observa comparando el valor de n obtenido
%   en el inciso (a) y el error obtenido usando el valor n = 10. 
%   Explique cuál es la razón de esta aparente contradicción.
in8 = IntegracionSimpson(f, 'a', 0, 'b', 2*pi, 'n', 8); % 0.494315575434631
err_abs8 = abs(exacto - in8); % 0.004750703199515

% Ambos errores son menores a 10^-2. El error que se comete con n = 10
%   es ligeramente menor, lo cual es lógico. ¿Cuál es la contradicción?
