function [orden, E] = ordenaprox_sol_pr13(f, a, b, y0, N, m)
    E = zeros(m, length(y0)); % Matriz para errores de x, y, z
    for k = 1:m
        [t, y] = EulerSistemas(f, a, b, y0, N);
        
        % Soluciones exactas corregidas:
        x_exact = cos(t) + sin(t) - exp(t) + 1;
        y_exact = -sin(t) + cos(t) - exp(t);  
        z_exact = cos(t) - sin(t);
        solex = [x_exact', y_exact', z_exact']; 
        
        E(k, :) = max(abs(y - solex)); % Error máximo por variable
        N = 2 * N; % Duplicar nodos
    end
    orden = log2(E(1:end-1, :) ./ E(2:end, :)); % Orden por variable
end
