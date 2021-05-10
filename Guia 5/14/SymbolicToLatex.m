function expr = SymbolicToLatex(f, copy_to_clipboard, as_float)
%SymbolicToLatex - Devuelve la función en formato LaTeX
%
% Syntax: expr = SymbolicToLatex(f, copy_to_clipboard, as_float)
%
% Input:
%   f: función simbólica.
%   copy_to_clipboard: bool. Indica si copiar la expresión al 
%       portapapeles (default: false).
%   as_float: bool. Indica si las fracciones deben expresarse como 
%       decimales (default: false).
% Output:
%   expr: string con la expresión para LaTeX

    if ~exist('copy_to_clipboard', 'var')
        copy_to_clipboard = false;
    end

    if ~exist('as_float', 'var')
        as_float = false;
    end

    original_pref = sympref('FloatingPointOutput', as_float);

    expr = latex(f);

    if copy_to_clipboard
        clipboard('copy', expr)
    end

    sympref('FloatingPointOutput', original_pref);
end