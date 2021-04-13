function [result] = is_positive(x)
%is_positive Solución al ejercicio 10.c de la guía 1.
% Programar (usando if-else) una función que devuelva 1 si el número
% envíado como parámetro es positivo, -1 si el mismo es negativo, y 0 si el
% parámetro es cero.

if x == 0
    result = 0;
elseif x < 0
    result = -1;
else
    result = 1;

end

