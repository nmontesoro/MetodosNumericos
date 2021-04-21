% Solución
% (a)
%   z =
%      12.0000
%       7.0000
%      -2.0000
%
% (b)
%   x =
%       3.0000
%       1.0000
%       2.0000

format compact

A = [ 3, -1,  2;
      1,  2,  3;
      2, -2, -1];

b = [12;
     11;
      2];

[L, U] = lu(A);

% (a) Calcule z como solución de L*z = b
z = L \ b

% (b) Calcule x como solución de U*x = z
x = U \ z

format