function c = CalcMatrizCJacobi(A, b)
%CalcMatrizCJacobi - Calcula la matriz c para el método Jacobi
%
% Syntax: c = CalcMatrizCJacobi(A, b)
%
% Input:
%   A: matriz de coeficientes del sistema de ecuaciones
%   b: matriz columna de términos independientes del sistema
%
% Output:
%   c: matriz c para el método Jacobi

    c = inv(diag(diag(A)))*b;
    
end