function [X] = ResolverEDO(f, intervalo, h, cond_inic, varargin)
%ResolverEDO - Resuelve una ecuación diferencial ordinaria (o un sistema
%   de ecuaciones)
%
% Syntax: [X] = ResolverEDO(input)
%
% Input:
%   f: cell array conteniendo las funciones del sistema (debe ser un 
%       array, incluso si se compone de una única función). Ver 
%       documentación adicional.
%   intervalo: vector [a, b] (a < x < b), siendo x la variable 
%       independiente del sistema.
%   h: paso
%   cond_inic: vector de condiciones iniciales de las variables 
%       dependientes.
%   metodo: Indica el método a utilizar. Las opciones son euler, eulerm,
%       heun, pm, ralston, rk2, rk3, (rk4), rk5.
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
    isValidA2 = @(a2) ~isnan(a2);

    parser = inputParser();
    addRequired(parser, 'f');
    addRequired(parser, 'intervalo', isValidIntervalo);
    addRequired(parser, 'h', isValidH);
    addRequired(parser, 'cond_inic');
    addOptional(parser, 'metodo', 'rk4', isValidMetodo);
    addParameter(parser, 'a2', 0.5, isValidA2);
    parse(parser, f, intervalo, h, cond_inic, varargin{:});

    a = intervalo(1);
    b = intervalo(2);
    m = floor(round((b - a) / h, 2)) + 1; % round por error de redondeo!
    metodo = parser.Results.metodo;
    a2 = parser.Results.a2;

    [isValidF, n] = ValidateF(f);

    if ~isValidF
        error('f debe ser un cell array con punteros a funciones.')
    end

    if ~size(cond_inic, 2) == n
        error('No hay suficientes condiciones iniciales.')
    end

    X = zeros(m, n + 1); % Reservo memoria
    X(1, 2:n + 1) = cond_inic; % Seteo las condiciones iniciales
    % Genero los valores de la variable independiente
    X(:, 1) = (a + h .* [0:m-1]).';

    switch metodo
    case 'euler'
        X = euler(X);
    case 'rk2'
        X = rk2(X);
    case 'rk4'
        X = rk4(X);
    case 'eulerm'
        a2 = 0.5;
        X = rk2(X);
    case 'heun'
        a2 = 0.5;
        X = rk2(X);
    case 'pm'
        a2 = 1;
        X = rk2(X);
    case 'ralston'
        a2 = 2/3;
        X = rk2(X);
    otherwise
        error('No se reconoce el método, o no ha sido implementado aún.')
    end

    function X = euler(X)
        for i = 1:m - 1
            for j = 1:n
                X(i + 1, j + 1) = X(i, j + 1) + h * f{j}(X(i, :));
            end
        end
    end

    function X = rk2(X)
        % Runge-Kutta de orden 2, basado en Chapra
        a1 = 1 - a2;
        p1 = 1 / (2*a2);
        K = zeros(3, n);
        coef = [0, 0, p1];

        for i = 1:m - 1
            % Calculo los valores de K para esta iteración
            for ik = 2:3
                for j = 1:n
                    K(ik, j) = f{j}(X(i, :) + coef(ik) * h * [1, K(ik - 1, :)]);
                end
            end

            % Ahora calculo los valores de X de la próxima iteración
            X(i + 1, 2:n + 1) = X(i, 2:n + 1) + h * (a1 * K(2, :) ...
                                + a2 * K(3, :));
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