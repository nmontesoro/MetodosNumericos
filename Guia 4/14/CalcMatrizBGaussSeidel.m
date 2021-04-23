function B = CalcMatrizBGaussSeidel(A)
    %CalcMatrizBGaussSeidel - Calcula la matriz de iteración del método
    %   Gauss-Seidel
    %
    % Syntax: B = CalcMatrizBGaussSeidel(A)
    %
    % Input:
    %   A: matriz de coeficientes del sistema de ecuaciones
    %
    % Output:
    %   B: matriz de iteración del método Gauss-Seidel
    
        B = -inv(tril(A))*triu(A, 1);
    
    end