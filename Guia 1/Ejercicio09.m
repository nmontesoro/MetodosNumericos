function [mg] = mg(x,y)
%mg Devuelve la media geométrica de dos valores x e y.

mg = sqrt(x*y);
end

function [geo_mean] = mgv(V)
%mgv Devuelve la media geométrica de un vector.

geo_mean = sqrt(prod(V));
end

