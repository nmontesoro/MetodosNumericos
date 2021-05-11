function PlotSpline(points, pols, plot_markers, varargin)
%PlotSpline - Grafica un spline en la figura actual
%
% Syntax: PlotSpline(points, pols, varargin)
%
% Input:
%   points: puntos utilizados. Formato: [x1, y1; x2, y2; ...; xn, yn]
%   pols: vector de polinomios conseguidos mediante CalcPolinomiosSpline
%   plot_markers: opcional. Indica si graficar los puntos (default: true)
%   varargin: parámetros que se le pasan a fplot

    n = size(points, 1);

    if ~exist('plot_markers', 'var')
        plot_markers = true;
    end

    for i = 1:n - 1
        fplot(pols(i), [points(i, 1), points(i + 1, 1)], varargin{:})
    end

    if plot_markers
        scatter(points(:, 1), points(:, 2), 'filled')
    end
end