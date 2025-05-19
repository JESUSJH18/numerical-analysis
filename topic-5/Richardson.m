function [Derivada, iter, incre] = Richardson(f, x0, h, tol, maxiter)
% EXTRAPOLACIÓN DE RICHARDSON para derivadas usando diferencias centrales
% Entrada:
%   f: función a derivar
%   x0: punto de evaluación
%   h: paso inicial
%   tol: tolerancia
%   maxiter: máximo de iteraciones
% Salida:
%   Derivada: mejor aproximación
%   iter: número de iteraciones realizadas
%   incre: último incremento

    % Inicialización de parámetros
    incre = tol + 1;
    iter = 1;
    R = zeros(maxiter, maxiter); % Tabla de Richardson
    
    % Primera aproximación con diferencia central
    R(1,1) = (f(x0 + h) - f(x0 - h)) / (2*h);
    
    % Bucle principal de extrapolación
    while incre > tol && iter < maxiter
        iter = iter + 1;
        h = h/2; % Refinamos el paso
        
        % Nueva aproximación base con h reducido
        R(iter,1) = (f(x0 + h) - f(x0 - h)) / (2*h);
        
        % Extrapolaciones recursivas
        for j = 2:iter
            factor = 4^(j-1);
            R(iter,j) = (factor * R(iter,j-1) - R(iter-1,j-1)) / (factor - 1);
        end
        
        % Cálculo del incremento
        incre = abs(R(iter,iter) - R(iter,iter-1));
    end
    
    % Resultado final
    Derivada = R(iter,iter);
    
    % Mensaje de advertencia si no converge
    if incre > tol
        warning('No se alcanzó la tolerancia en %d iteraciones', maxiter);
    end
end