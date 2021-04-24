function c = ConvergeJacobi(B)
%ConvergeJacobi - True o false según converja o no el método Jacobi
%
% Syntax: c = ConvergeJacobi(B)
%
% Input:
%   B: matriz de iteración de Jacobi
%
% Output:
%   c: boolean indicando si converge (true) o no.

    % * Si ||B|| < 1 --> A es EDD --> Converge
    % * Si ||B|| >= 1 no se puede asegurar la convergencia
    %   * Si el radio espectral de B < 1 el método converge

    c = true;

    if norm(B, inf) >= 1
        if RadioEspectral(B) >= 1
            c = false;
        end
    end

end