function [result] = custom_factorial_vectorized(x)
%custom_factorial Solución al ejercicio 10.f de la guía 1.
% Repetir el programa anterior en forma vectorizada.

if x < 0
    error('El valor es menor a 0.');
end

result = prod([x:-1:1]);

end

