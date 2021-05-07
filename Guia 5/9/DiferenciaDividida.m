function dif = DiferenciaDividida(points)
%DiferenciaDividida - Calcula la diferencia dividida de los puntos
%
% Syntax: dif = DiferenciaDividida(points)
%
% Input:
%   points: conjunto de puntos. Formato: [x1, y1; x2, y2; ...; xn, yn]
% 
% Output: diferencia dividida de los puntos
    n = size(points, 1);

    if n == 1
        dif = points(1, 2);
    elseif n == 2
        dif = (points(2, 2) - points(1, 2)) / (points(2, 1) - points(1, 1));
    else
        dif = (DiferenciaDividida(points(2:n, :)) - DiferenciaDividida(points(1:n-1, :))) / ...
              (points(n, 1) - points(1, 1));
    end
end