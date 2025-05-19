function [Integral, iter, incre] = SimpsonIterativo(f, a, b, n, tol, maxiter)
% SIMPSON ITERATIVO - Aproxima la integral con refinamiento adaptativo
% Entrada:
%   f: función a integrar
%   a, b: límites de integración
%   n: número inicial de subintervalos (debe ser par)
%   tol: tolerancia para la convergencia
%   maxiter: máximo número de iteraciones
% Salida:
%   Integral: valor aproximado de la integral
%   iter: iteraciones realizadas
%   incre: último incremento

    % Asegurar que n es par
    if mod(n,2) ~= 0
        n = n + 1;
        warning('n debe ser par. Usando n = %d', n);
    end
    
    incre = tol + 1;
    iter = 1;
    I = zeros(1, maxiter);
    I(1) = Simpson(f, a, b, n);
    
    while incre > tol && iter < maxiter
        n = 2*n; % Duplicamos subintervalos (siempre par)
        iter = iter + 1;
        I(iter) = Simpson(f, a, b, n);
        incre = abs(I(iter) - I(iter-1));
    end
    
    if incre > tol
        warning('No se alcanzó la tolerancia en %d iteraciones', maxiter);
        Integral = I(end);
    else
        Integral = I(end);
    end
end