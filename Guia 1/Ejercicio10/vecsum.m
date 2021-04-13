function [v] = vecsum(a, b)
%vecsum Solución a ejercicio 10.a de la guía 1.
% Programar (usando bucles for) una función que retorna un vector v con la
% suma, elemento a elemento, de dos vectores a y b de la misma longitud.
% Detectar si los vectores no tienen la misma longitud y dar un error en
% caso contrario. (Usar la función length para determinar la longitud de
% los vectores).

length_a = length(a);
v = [];

if length_a ~= length(b)
    error('Los vectores no tienen la misma longitud.');
end

for index = 1:length_a
    v = [v (a(index) + b(index))];
end

end