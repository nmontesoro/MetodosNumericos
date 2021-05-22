function [Y, X] = EDORungeKutta(orden, f, intervalo, h, cond_inic, varargin)
%EDORungeKutta - Calcula la solución de una Ecuación Diferencial Ordinaria
%   mediante alguno de los métodos de Runge-Kutta.
%
% Syntax: [Y, X] = EDORungeKutta(orden, f, intervalo, h, cond_inic, ...)
%
% Input:
%   orden: orden del método (2, 3, 4 o 5)
%   f: función de la EDO (dy/dx = f(x, y))
%   intervalo: vector [a, b] (a < x < b)
%   h: paso
%   cond_inic: y(a)
%   parámetros posibles:
%       a2: valor que caracteriza al método de orden 2. Según Chapra,
%           capítulo 25:
%               Si a2 = 0.5 --> Heun (por defecto)
%                         1 --> Punto medio
%                       2/3 --> Ralston
%       feldberg: boolean indicando si utilizar el método de Feldberg
%           cuando el orden es 5. (default: true. false --> Butcher)
%
% Output:
%   Y: vector de las aproximaciones encontradas de la solución
%   X: vector de los valores utilizados de x
    
    validOrden = @(o) floor(o) == o && (o >= 2 && o <= 5);
    validF = @(f) isa(f, 'function_handle');
    validIntervalo = @(intervalo) (all(size(intervalo) == [2, 1]) || ...
        all(size(intervalo) == [1, 2])) && intervalo(1) < intervalo(2);
    validH = @(h) h > 0;
    validA2 = @(a2) ~isnan(a2);
    validFeldberg = @(f) isa(f, 'logical');
    
    parser = inputParser();
    addRequired(parser, 'orden', validOrden);
    addRequired(parser, 'f', validF);
    addRequired(parser, 'intervalo', validIntervalo);
    addRequired(parser, 'h', validH);
    addRequired(parser, 'cond_inic');
    addParameter(parser, 'a2', 0.5, validA2);
    addParameter(parser, 'feldberg', true, validFeldberg)
    parse(parser, orden, f, intervalo, h, cond_inic, varargin{:});

    a2 = parser.Results.a2;
    a = parser.Results.intervalo(1);
    b = parser.Results.intervalo(2);
    feldberg = parser.Results.feldberg;
    
    m = floor((b - a) / h) + 1;
    Y = zeros(m, 1);
    Y(1) = cond_inic;
    X = (a + h .* [0:m-1]).';

    switch orden
    case 2
        [Y, X] = rk2(a2, f, m, X, Y, h);
    case 3
        [Y, X] = rk3(f, m, X, Y, h);
    case 4
        [Y, X] = rk4(f, m, X, Y, h);
    case 5
        [Y, X] = rk5(f, m, X, Y, h, feldberg);
    end
    
    function [Y, X] = rk2(a2, f, m, X, Y, h)
        % Según Chapra, 25.3.1.
        a1 = 1 - a2;
        p1 = 1 / (2*a2);
        q11 = p1;
        
        for i = 1:m - 1
            k1 = f(X(i), Y(i));
            k2 = f(X(i) + p1 * h, Y(i) + q11 * k1 * h);
            Y(i + 1) = Y(i) + (a1 * k1 + a2 * k2) * h;
        end
    end

    function [Y, X] = rk3(f, m, X, Y, h)
        % TODO: implementar versiones menos comunes, como en rk2 
        %   (ver Chapra)
        % Método común según Chapra, 25.3.2.
        for i = 1:m - 1
            k1 = f(X(i), Y(i));
            k2 = f(X(i) + 0.5 * h, Y(i) + 0.5 * k1 * h);
            k3 = f(X(i) + h, Y(i) - k1 * h + 2 * k2 * h);
            Y(i + 1) = Y(i) + 1/6 * (k1 + 4 * k2 + k3) * h;
        end
    end

    function [Y, X] = rk4(f, m, X, Y, h)
        % TODO: implementar versiones menos comunes, como en rk2 
        %   (ver Chapra)
        % Método clásico de cuarto orden, según se describe en 
        %   Chapra, 25.3.3.
        for i = 1:m - 1
            k1 = f(X(i), Y(i));
            k2 = f(X(i) + 0.5 * h, Y(i) + 0.5 * k1 * h);
            k3 = f(X(i) + 0.5 * h, Y(i) + 0.5 * k2 * h);
            k4 = f(X(i) + h, Y(i) + k3 * h);
            Y(i + 1) = Y(i) + 1/6 * (k1 + 2 * k2 + 2 * k3 + k4) * h;
        end
    end

    function [Y, X] = rk5(f, m, X, Y, h, feldberg)
        if feldberg
            for i = 1:m - 1
                k1 = h * f(X(i), Y(i));
                k2 = h * f(X(i) + 0.25 * h, Y(i) + 0.25 * k1);
                k3 = h * f(X(i) + 3/8 * h, Y(i) + 3/32 * k1 + 9/32 * k2);
                k4 = h * f(X(i) + 12/13 * h, Y(i) + 1932/2197 * k1 ...
                   - 7200/2197 * k2 + 7296/2197 * k3);
                k5 = h * f(X(i) + h, Y(i) + 439/216 * k1 - 8 * k2 ...
                   + 3680/513 * k3 - 845/4104 * k4);
                % No se usa para el cálculo de y. Podría ser útil a 
                % futuro, y por eso lo dejo.
                % k6 = h * f(X(i) + 0.5 * h, Y(i) - 8/27 * k1 + 2 * k2 ...
                %    - 3544/2565 * k3 + 1859/4104 * k4 - 11/40 * k5);
                Y(i + 1) = Y(i) + 25/216 * k1 + 1408/2565 * k3 ...
                         + 2197/4104 * k4 - 1/5 * k5;
            end
        else
            % Método de quinto orden de Butcher, según se describe en 
            %   Chapra, 25.3.4.
            for i = 1:m - 1
                k1 = f(X(i), Y(i));
                k2 = f(X(i) + 0.25 * h, Y(i) + 0.25 * k1 * h);
                k3 = f(X(i) + 0.25 * h, Y(i) +  0.125 * k1 * h + 0.125 * k2 * h);
                k4 = f(X(i) + 0.5 * h, Y(i) - 0.5 * k2 * h + k3 * h);
                k5 = f(X(i) + 0.75 * h, Y(i) + 0.1875 * k1 * h + 0.5625 * k4 * h);
                k6 = f(X(i) + h, Y(i) - 3/7 * k1 * h + 2/7 * k2 * h ...
                + 12/7 * k3 * h - 12/7 * k4 * h + 8/7 * k5 * h);
                Y(i + 1) = Y(i) + 1/90 * (7 * k1 + 32 * k3 + 12 * k4 + 32 * k5 ...
                        + 7 * k6) * h;
            end
        end
    end
end