function [v] = vecsum_vectorized(a, b)
%vecsum_vectorized Solución a ejercicio 10.b de la guía 1.
% Repetir el programa anterior (10.a) en forma vectorizada.

length_a = length(a);

if length_a ~= length(b)
    error('Los vectores no tienen la misma longitud.');
end

v = a + b;

end