function [result] = custom_factorial(x)
%custom_factorial Solución al ejercicio 10.e de la guía 1.
% Programar (usando bucles for) una función que devuelva el factorial de un
% número entero mayor o igual a cero.

if x < 0
    error('El valor es menor a 0.');
end

result = 1;
for val = x:-1:1
    result = result * val;
end

end

