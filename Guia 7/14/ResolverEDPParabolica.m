function [T, X, V] = ResolverEDPParabolica(K, h, f0, cond_cont, intervalo_1, ...
                                           intervalo_2, metodo)
%ResolverEDPParabolica - Resuelve una EDP Parabólica de forma dT/dt = K*d2T/dx2
%
% Input:
%   K: constante
%   h: vector de steps [ht, hx]
%   f0: función para generar los valores iniciales
%   cond_cont: vector de condiciones de contorno
%   intervalo_1: intervalo de t
%   intervalo_2: intervalo de x
%   metodo: especifica el método a utilizar ((implicito) o explicito)
%
% Output:
%   T: vector de valores de t
%   X: vector de valores de x
%   V: matriz de valores de T

    % Calculo los valores iniciales
    T = [intervalo_1(1):h(1):intervalo_1(2)].';
    X = [intervalo_2(1):h(2):intervalo_2(2)].';
    
    % Reservo memoria para el resultado
    m = size(T, 1);
    n = size(X, 1);
    V = zeros(m, n);
 
    % Asigno los valores iniciales
    V(1, :) = f0(X).';
 
    % Asigno las condiciones de contorno
    V(:, 1) = cond_cont(1);
    V(:, n) = cond_cont(2);
 
    % Calculo los valores intermedios
    a = K * h(1) / h(2)^2;

    switch metodo
    case 'explicito'
        if a > 0.5
            warning('a > 0.5 - el método podría ser inestable')
        end

        for i = 2:m
            for j = 2:n - 1
                V(i, j) = a * (V(i - 1, j + 1) + V(i - 1, j - 1)) ...
                        + (1 - 2*a) * V(i - 1, j);
            end
        end
    otherwise
        for k = 2:m
            % Reservo memoria para el sistema
            A = zeros(n - 2, n - 2);

            % Construyo la matriz A
            A(1, 1) = 2 * a + 1;
            A(1, 2) = - a;
            for i = 2:n - 3
                A(i, i - 1) = - a;
                A(i, i) = 2 * a + 1;
                A(i, i + 1) = - a;
            end
            A(n - 2, n - 3) = - a;
            A(n - 2, n - 2) = 2 * a + 1;

            % Resuelvo el sistema y vuelco a la matriz de resultados
            V(k, 2:n - 1) = (A \ V(k - 1, 2:n - 1).');
        end
    end

    % Devuelvo traspuesto, para evitar un paso extra al graficar
    V = V.';
end
