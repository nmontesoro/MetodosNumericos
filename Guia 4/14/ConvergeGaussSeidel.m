function c = ConvergeGaussSeidel(B)
%ConvergeGaussSeidel - True o false según converja o no el método 
%   Gauss-Seidel
%
% Syntax: c = ConvergeGaussSeidel(B)
%
% Input:
%   B: matriz de iteración de Gauss-Seidel
%
% Output:
%   c: boolean indicando si converge (true) o no.
    
    % Los criterios de convergencia son los mismos que para Jacobi
    c = ConvergeJacobi(B); % wrapper
end