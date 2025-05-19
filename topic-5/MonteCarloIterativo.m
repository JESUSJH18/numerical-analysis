function [Integral, iter, incre] = MonteCarloIterativo(f, a, b, n, tol, maxiter)
% MÉTODO DE MONTE CARLO ITERATIVO
% Entrada:
%   f: función a integrar
%   a, b: límites de integración
%   n: número inicial de puntos
%   tol: tolerancia para la convergencia
%   maxiter: máximo número de iteraciones
% Salida:
%   Integral: valor aproximado de la integral
%   iter: iteraciones realizadas
%   incre: último incremento absoluto

    % Inicialización
    incre = tol + 1;
    iter = 1;
    I_prev = MonteCarlo(f, a, b, n); % Primera aproximación
    Integral = I_prev;
    
    % Bucle principal
    while incre > tol && iter < maxiter
        iter = iter + 1;
        n = 2 * n; % Duplicamos puntos en cada iteración
        
        % Nueva aproximación
        I_current = MonteCarlo(f, a, b, n);
        
        % Cálculo del incremento
        incre = abs(I_current - Integral);
        
        % Actualización del resultado
        Integral = I_current;
    end
    
    % Mensaje de advertencia si no converge
    if incre > tol
        warning('No se alcanzó la tolerancia en %d iteraciones', maxiter);
    end
end