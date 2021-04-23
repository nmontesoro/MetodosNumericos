function B = CalcMatrizBJacobi(A)
%CalcMatrizBJacobi - Calcula la matriz de iteración del método Jacobi
%
% Syntax: B = CalcMatrizBJacobi(A)
%
% Input:
%   A: matriz de coeficientes del sistema de ecuaciones
%
% Output:
%   B: matriz de iteración del método Jacobi

    B = -inv(diag(diag(A)))*(tril(A,-1)+triu(A,1));

end