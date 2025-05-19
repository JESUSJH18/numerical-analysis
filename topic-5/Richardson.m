function [Derivada, iter, incre] = Richardson(f, x0, h, tol, maxiter)
% EXTRAPOLACIÓN DE RICHARDSON con visualización de tabla
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
    R = zeros(maxiter, maxiter);
    incre = tol + 1;
    iter = 1;
    
    % Primera aproximación
    R(1,1) = (f(x0 + h) - f(x0 - h))/(2*h);
    
    % Mostrar encabezado de tabla
    fprintf('\nTabla de Extrapolación de Richardson\n');
    fprintf('%-10s', 'h'); fprintf('%-12s ', 'F1'); 
    for j = 2:maxiter, fprintf('%-12s ', ['F' num2str(j)]); end
    fprintf('\n'); fprintf(repmat('-',1,12*(maxiter+1)+2)); fprintf('\n');
    
    % Mostrar primera fila
    fprintf('%-10.6f', h); 
    fprintf('%-12.6f ', R(1,1)); 
    fprintf('\n');
    
    % Bucle principal
    while incre > tol && iter < maxiter
        iter = iter + 1;
        h = h/2;
        
        % Nueva fila con h reducido
        R(iter,1) = (f(x0 + h) - f(x0 - h))/(2*h);
        
        % Extrapolaciones
        for j = 2:iter
            factor = 4^(j-1);
            R(iter,j) = (factor*R(iter,j-1) - R(iter-1,j-1))/(factor - 1);
        end
        
        % Mostrar fila completa
        fprintf('%-10.6f', h); 
        for j = 1:iter
            fprintf('%-12.6f ', R(iter,j));
        end
        fprintf('\n');
        
        % Calcular incremento
        if iter > 1
            incre = abs(R(iter,iter) - R(iter,iter-1));
        end
    end
    
    % Resultados finales
    Derivada = R(iter,iter);
    
    % Mensaje de convergencia
    if incre > tol
        warning('No convergencia en %d iteraciones', maxiter);
    else
        fprintf('\nConvergencia alcanzada en %d iteraciones\n', iter);
    end
end