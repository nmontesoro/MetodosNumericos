function [X] = ResolverEDO(f, intervalo, h, cond_inic, varargin)
%ResolverEDO - Resuelve una ecuación diferencial ordinaria (o un sistema
%   de ecuaciones)
%
% Syntax: [X] = ResolverEDO(input)
%
% Input:
%   metodo: Indica el método a utilizar. Las opciones son euler, eulerm,
%       heun, pm, ralston, rk2, rk3, (rk4), rk5.
%   f: cell array conteniendo las funciones del sistema (debe ser un 
%       array, incluso si se compone de una única función). Ver 
%       documentación adicional.
%   intervalo: vector [a, b] (a < x < b)
%   h: paso
%   cond_inic: vector de condiciones iniciales.
%   parámetros posibles:
%       a2: valor que caracteriza al método de orden 2. Según Chapra,
%           capítulo 25:
%               Si a2 = 0.5 --> Heun (por defecto)
%                         1 --> Punto medio
%                       2/3 --> Ralston
%       feldberg: boolean indicando si utilizar el método de Feldberg
%           con Runge-Kutta de orden 5. (default: true. false: Butcher)
%
% Output:
%   X: matriz de solución. Ver documentación adicional.

    isValidMetodo = @(m) isa(m, 'char');
    isValidIntervalo = @(intervalo) (all(size(intervalo) == [2, 1]) || ...
        all(size(intervalo) == [1, 2])) && intervalo(1) < intervalo(2);
    isValidH = @(h) h > 0;

    parser = inputParser();
    addRequired(parser, 'f');
    addRequired(parser, 'intervalo', isValidIntervalo);
    addRequired(parser, 'h', isValidH);
    addRequired(parser, 'cond_inic');
    addOptional(parser, 'metodo', 'rk4', isValidMetodo);
    parse(parser, f, intervalo, h, cond_inic, varargin{:});

    a = intervalo(1);
    b = intervalo(2);
    m = floor((b - a) / h) + 1;
    metodo = parser.Results.metodo;

    [isValidF, n] = ValidateF(f);

    if ~isValidF
        error('f debe ser un cell array con punteros a funciones.')
    end

    if ~size(cond_inic, 2) == n
        error('No hay suficientes condiciones iniciales.')
    end

    X = zeros(m, n + 1); % Reservo memoria
    X(1, 2:n + 1) = cond_inic; % Seteo las condiciones iniciales
    X(:, 1) = (a + h .* [0:m-1]).'; % Genero los valores de t

    switch metodo
    case 'euler'
        X = euler(X);
    case 'rk4'
        X = rk4(X);
    otherwise
        error('No se reconoce el método, o no ha sido implementado aún.')
    end

    function X = euler(X)
        for i = 1:m - 1
            for j = 1:n
                X(i + 1, 2:n + 1) = X(i, 2:n + 1) + h * f{j}(X(i, :));
            end
        end
    end

    function X = rk4(X)
        % Runge-Kutta de orden 4, basado en diapositivas de cátedra
        K = zeros(5, n);
        coef = [0, 0, 0.5, 0.5, 1];
        for i = 1:m - 1
            % Calculo los valores de K para esta iteración
            for ik = 2:5
                for j = 1:n
                    K(ik, j) = h * f{j}(X(i, :) + coef(ik) * [h, K(ik - 1, :)]);
                end
            end
    
            % Ahora calculo los valores de X de la próxima iteración
            X(i + 1, 2:n + 1) = X(i, 2:n + 1) + 1/6 * (K(2, :) + 2 * K(3, :) ...
                              + 2 * K(4, :) + K(5, :));
        end
    end


    function [isValid, n] = ValidateF(f)
        isValid = false;
        n = 0;

        if isa(f, 'cell')
            s = size(f);
            if s(1, 1) == 1
                n = s(1, 2);
            elseif s(1, 2) == 1
                n = s(1, 1);
            end
            if n >= 1
                isValid = true;
            end
        end
    end
end