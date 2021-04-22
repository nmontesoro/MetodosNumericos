function err = CalcCotaErrorRelativo(A, dA, b, db)
%CalcCotaErrorRelativo - Calcula la cota de error relativo en un sistema
%   AX = b
%
% Syntax: err = CalcCotaErrorRelativo(A, dA, b)
%
% Input:
%   A: matriz original
%  dA: matriz perturbada
%   b: términos independientes
%  db: perturbación en términos independientes
% Output:
%   err: Cota de error relativo

    if det(A) == 0
        error('La matriz A es singular')
    end

    % Uso la norma inf porque es la que usa la cátedra y podría ser útil
    % para debuggear.
    norm_dA = norm(dA, inf);
    norm_iA = norm(inv(A), inf);

    if norm_dA >= 1/norm_iA
        error('No se puede evaluar la posible variación')
    end

    cond_A = cond(A, inf);
    norm_A = norm(A, inf);
    norm_db = norm(db, inf);
    norm_b = norm(b, inf);

    err = cond_A / (1 - cond_A * norm_dA / norm_A) * (norm_db / norm_b + ...
          norm_dA / norm_A);
end