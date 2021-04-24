function r = RadioEspectral(B)
%RadioEspectral - Calcula el radio espectral de una matriz de iteración
%   de Jacobi o Gauss-Seidel
%
% Syntax: r = RadioEspectral(B)
%
% Input:
%   B: matriz de iteración de Jacobi o Gauss-Seidel
%
% Output:
%   r: radio espectral de la matriz B

    r = max(abs(eig(B)));
    
end