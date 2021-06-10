function p = PlotSpline(points, pols, plot_markers, plot_ends, varargin)
%PlotSpline - Grafica un spline en la figura actual
%
% Syntax: PlotSpline(points, pols, varargin)
%
% Input:
%   points: puntos utilizados. Formato: [x1, y1; x2, y2; ...; xn, yn]
%   pols: vector de polinomios conseguidos mediante CalcPolinomiosSpline
%   plot_markers: opcional. Indica si graficar los puntos (default: true)
%   plot_ends: opcional. Indica si extender el gráfico más allá de los 
%       puntos originales (default: false)
%   varargin: parámetros que se le pasan a fplot
% Output:
%   p: último tramo del gráfico generado

    n = size(points, 1);

    if ~exist('plot_markers', 'var')
        plot_markers = true;
    end

    if ~exist('plot_ends', 'var')
        plot_ends = false;
    end

    if plot_ends
        fplot(pols(1), [-1000, points(1, 1)], varargin{:});
        p = fplot(pols(n - 1), [points(n, 1), 1000], varargin{:});
    end

    for i = 1:n - 1
        p = fplot(pols(i), [points(i, 1), points(i + 1, 1)], varargin{:});
    end

    if plot_markers
        scatter(points(:, 1), points(:, 2), 'filled', 'DisplayName', 'Datos')
    end
end