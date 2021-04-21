% Solución:
% (a)
% x =
%    1.0e+16 *
%    -1.4412
%     2.8823
%    -1.4412
%
% (b)
% R =
%     -4
%     -2
%     -7
%
% (c)
% Ver el warning al ejecutar el código: "Matrix is close to singular or
%   badly scaled".
% Resolviendo manualmente se llega a -1 = 7 --> el sistema no tiene
%   solución. Mi explicación es que la computadora no puede almacenar
%   ciertos valores cuando se hace la operación A \ b, y es por eso que 
%   x no es exactamente [0; 0; 0]. El residuo es muy grande, entonces la
%   "solución" encontrada es muy alejada de la "real".

format compact

A = [1, 2, 3;
     3, 4, 5;
     6, 7, 8];

b = [4; 2; 7];

x = A \ b

R = A * x - b

format