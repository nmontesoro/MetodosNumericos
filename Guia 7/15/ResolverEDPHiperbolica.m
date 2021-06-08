function [X, Y, V] = ResolverEDPHiperbolica(c, h, f0, g, cond_cont, intervalo_1, ...
                                            intervalo_2)

    % Calculo los valores iniciales
    X = [intervalo_1(1):h(1):intervalo_1(2)].';
    Y = [intervalo_2(1):h(2):intervalo_2(2)].';

    % Reservo memoria para el resultado
    m = size(Y, 1);
    n = size(X, 1);
    V = zeros(m, n);
 
    % Asigno los valores iniciales
    V(1, :) = f0(X).';
 
    % Asigno las condiciones de contorno
    V(:, 1) = cond_cont(1);
    V(:, n) = cond_cont(2);

    % Calculo los valores intermedios
    r = c ^ 2 * h(2) ^ 2 / h(1) ^ 2;

    % Valores de la primera fila
    for j = 2:n - 1
        V(2, j) = r / 2 * (V(1, j + 1) + V(1, j - 1)) + (1 - r) * V(1, j) + h(1) * g(X(j));
    end

    % El resto
    for i = 3:m
        for j = 2:n - 1
            V(i, j) = r * (V(i - 1, j + 1) + V(i - 1, j - 1)) + 2 * (1 - r) * V(i - 1, j) - V(i - 2, j);
        end
    end
end