function c = CalcMatrizCGaussSeidel(A, b)
    %CalcMatrizCGaussSeidel - Calcula la matriz c para el método 
    %   Gauss-Seidel
    %
    % Syntax: c = CalcMatrizCGaussSeidel(A, b)
    %
    % Input:
    %   A: matriz de coeficientes del sistema de ecuaciones
    %   b: matriz columna de términos independientes del sistema
    %
    % Output:
    %   c: matriz c para el método Jacobi
    
        c = inv(tril(A))*b;
        
    end