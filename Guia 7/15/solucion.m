CalcAndPlot(0.05, 1);
CalcAndPlot(0.04, 2);

% No se puede analizar hasta t = 0.5 con k = 0.04. Fuera de eso, no hay
% más diferencias que en la "resolución" del gráfico.

function [X, Y, V] = CalcAndPlot(k, index)
    subplot(1, 2, index)
    [X, Y, V] = ResolverEDPHiperbolica(2, [0.1, k], ...
                                       @(x) sin(pi * x) + sin(2 * pi * x), ...
                                       @(x) 0, [0, 0], [0, 1], [0, 0.5]);
    [X, Y] = meshgrid(X, Y);
    surf(X, Y, V);
    xlabel('$x$', 'interpreter', 'latex')
    ylabel('$t$', 'interpreter', 'latex')
    zlabel('$y$', 'interpreter', 'latex')
    title(sprintf('$\\Delta_t = %3.2f$', k), 'interpreter', 'latex')
end
