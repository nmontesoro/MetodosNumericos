% Solución:
%   I =
%       0.5267
%       0.5096
%       1.0363
%       0.7074
%       0.3289
%       0.1807

A = [  41.1,     0,   0.2,    20,     0,     0;
          0,  60.5,   0.2,     0,     9,     0;
          0,     0,     0,    20,    -9,   4.5;
          0,     0,    -1,     1,     1,     0;
         -1,    -1,     1,     0,     0,     0;
          0,     1,     0,     0,    -1,    -1];

b = [ 36;
      34;
      12;
       0;
       0;
       0];

I = A \ b