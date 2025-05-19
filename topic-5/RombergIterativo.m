function [Integral, tabla] = RombergIterativo(f, a, b, n, tol, maxiter)
% MÉTODO DE ROMBERG para integración numérica
% Entrada:
%   f: función a integrar
%   a, b: límites de integración
%   n: número inicial de subintervalos
%   tol: tolerancia
%   maxiter: máximo iteraciones
% Salida:
%   Integral: mejor aproximación
%   tabla: matriz completa de Romberg

    % Inicializar tabla
    tabla = zeros(maxiter, maxiter);
    incre = tol + 1;
    iter = 1;
    
    % Primera aproximación con Trapecios
    tabla(1,1) = Trapecios(f, a, b, n);
    
    while incre > tol && iter < maxiter
        iter = iter + 1;
        n = 2*n; % Duplicar subintervalos
        
        % Nueva aproximación base
        tabla(iter,1) = Trapecios(f, a, b, n);
        
        % Extrapolaciones de Richardson
        for j = 2:iter
            factor = 4^(j-1);
            tabla(iter,j) = (factor * tabla(iter,j-1) - tabla(iter-1,j-1)) / (factor - 1);
        end
        
        % Verificar convergencia
        incre = abs(tabla(iter,iter) - tabla(iter,iter-1));
    end
    
    Integral = tabla(iter,iter);
    
    % Recortar tabla a resultados válidos
    tabla = tabla(1:iter, 1:iter);
    
    if incre > tol
        warning('No convergencia en %d iteraciones', maxiter);
    end
end