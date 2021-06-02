function X = ResolverPVF(intervalo, h, cond_frontera, metodo, varargin)
%ResolverPVF - Resuelve un Problema de Valor Frontera mediante el método
%   solicitado
%
% Syntax: X = ResolverPVF(intervalo, cond_frontera, metodo, varargin)
%
% Input:
%   intervalo: vector [a, b] (a < x < b), siendo x la variable 
%       independiente del sistema.
%   h: paso
%   cond_inic: vector de condiciones iniciales de las variables 
%       dependientes.
%   metodo: Indica el método a utilizar. Las opciones son (disparo) y 
%       dif_finitas.
%   parámetros posibles:
%       d0: vector que indica los valores de d1 y d2 a utilizar en el 
%           método del disparo.
%       metodo_integracion: indica el método de integración a utilizar
%           (euler, heun, rk...). Acepta todos los valores posibles para
%           ResolverEDO.
%       coef: vector de coeficientes de la ecuación diferencial para el método
%           de diferencias finitas (Ay'' + By' + Cy = f(x) => [A, B, C])
%       f: cell array conteniendo las funciones del sistema.
%
% Output:
%   X: matriz de solución.
    isValidIntervalo = @(intervalo) (all(size(intervalo) == [2, 1]) || ...
        all(size(intervalo) == [1, 2])) && intervalo(1) < intervalo(2);
    isValidH = @(h) h > 0;
    isValidCond = @(c) (all(size(c) == [2, 1]) || all(size(c) == [1, 2]));
    

    parser = inputParser();
    addRequired(parser, 'intervalo', isValidIntervalo);
    addRequired(parser, 'h', isValidH);
    addRequired(parser, 'cond_frontera', isValidCond);
    addRequired(parser, 'metodo');
    addParameter(parser, 'd0', NaN, isValidCond);
    addParameter(parser, 'metodo_integracion', 'rk4');
    addParameter(parser, 'f', NaN);
    addParameter(parser, 'coef', NaN);
    parse(parser, intervalo, h, cond_frontera, metodo, varargin{:});

    d0 = parser.Results.d0;
    metodo_integracion = parser.Results.metodo_integracion;
    a = intervalo(1);
    b = intervalo(2);
    n = floor(round((b - a) / h, 2)) + 1;
    f = parser.Results.f;
    coef = parser.Results.coef;
    
    switch metodo
    case 'disparo'
        if ~isa(f, 'cell')
            error('f debe ser cell array para el método del disparo')
        end

        if ~isnan(d0)
            d1 = d0(1);
            d2 = d0(2);
        else
            d1 = randi([1, 1000]);
            d2 = NaN;
        end

        X = disparo();
    case 'dif_finitas'
        if ~isa(coef, 'cell')
            error('Debe especificar coef')
        end

        X = dif();
    otherwise
        error('No se reconoce el método, o no ha sido implementado aún.')
    end

    function X = disparo()
        X = ResolverEDO(f, intervalo, h, [cond_frontera(1), d1], ...
          metodo_integracion);
        yf1 = X(n, 2);
        
        d2 = computeD2(yf1, d2);

        X = ResolverEDO(f, intervalo, h, [cond_frontera(1), d2], ...
          metodo_integracion);

        yf2 = X(n, 2);

        d3 = computeD3(yf1, yf2);

        X = ResolverEDO(f, intervalo, h, [cond_frontera(1), d3], ...
          metodo_integracion);
    end

    function X = dif()
        X = zeros(n, 2);
        X(:, 1) = [a:h:b].';
        orden = size(coef, 2) - 1;

        mat_A = zeros(n, n);
        mat_A(1, 1) = 1;
        mat_A(n, n) = 1;

        switch orden
        case 2
            for i = 2:n - orden + 1
                x = X(i, 1);
                mat_A(i, i - 1) = coef{1}(x) / h ^ 2 - coef{2}(x) / (2 * h);
                mat_A(i, i) = (-2 * coef{1}(x)) / h ^ 2 + coef{3}(x);
                mat_A(i, i + 1) = coef{1}(x) / h ^ 2 + coef{2}(x) / (2 * h);
            end
        otherwise
            error('No se implementó el orden %d aún', orden)
        end

        mat_b = zeros(n, 1);
        mat_b(1) = cond_frontera(1);
        mat_b(n) = cond_frontera(2);

        if isa(f, 'function_handle')
            % La ED no es homogénea
            mat_b(2:n-1) = f(X(2:n-1, 1));
        end

        X(:, 2) = (mat_A \ mat_b);
    end

    function d2 = computeD2(yf, d2)
        if yf < cond_frontera(2)
            % d2 tiene que ser > que d1
            if ~isnan(d2) && d2 < d1
                warning(...
                    'd2 debe ser mayor que d1. Se utilizará un valor aleatorio.')
                d2 = NaN;
            end

            if isnan(d2)
                d2 = randi([d1, 1000 + d1]);
            end
        else
            % d2 tiene que ser < que d1
            if ~isnan(d2) && d2 > d1
                warning(...
                    'd2 debe ser menor que d1. Se utilizará un valor aleatorio.')
                d2 = NaN;
            end

            if isnan(d2)
                d2 = randi([0, d1]);
            end
        end
    end

    function d3 = computeD3(yf1, yf2)
        d3 = (cond_frontera(2) - yf2) / (yf1 - yf2) * d1 ...
           + (cond_frontera(2) - yf1) / (yf2 - yf1) * d2;
    end
end