figure

CalcAndPlot(0.2, 'explicito', 1)
CalcAndPlot(0.2, 'implicito', 2)
CalcAndPlot(0.25, 'explicito', 3) % es inestable porque K*k/h^2 > 0.5
CalcAndPlot(0.25, 'implicito', 4)

function CalcAndPlot(k, metodo, index)
    subplot(2, 2, index)
    [T, X, V] = ResolverEDPParabolica(0.1515, [k, 0.25], @f, [0, 0], ...
                                      [0, 10], [0, 2], metodo);

    [T, X] = meshgrid(T, X);
    surf(T, X, V);
    xlabel('$t$', 'interpreter', 'latex')
    ylabel('$x$', 'interpreter', 'latex')
    zlabel('$T$', 'interpreter', 'latex')
    title(sprintf('Metodo %s ($\\Delta_t = %3.2f$)', metodo, k), ...
          'interpreter', 'latex')
end

function val = f(x)
    n = size(x, 1);
    val = zeros(n, 1);

    for i = 1:n
        if x(i) < 1
            val(i) = 100 * x(i);
        else
            val(i) = 200 - 100 * x(i);
        end
    end
end
