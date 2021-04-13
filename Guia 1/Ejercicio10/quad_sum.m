function [result] = quad_sum(v)
%quad_sum Solución al ejercicio 10.g de la guía 1.
% Programar (usando bucles for) una función para calcular la suma de los
% cuadrados de los elementos de un vector v, tal que:
% $S = \sum_{i=1}^{n} {v_i}^2$

result = 0;
total_items = length(v);

for index = 1:total_items
    result = result + v(index)^2;
end

end

