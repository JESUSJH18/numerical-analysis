f = @(x) atan(x);    % Función: f(x) = arctan(x)
tol = 1e-5;          % Tolerancia
maxiter = 50;        % Número máximo de iteraciones

% Prueba con diferentes estimaciones iniciales
x_vals = 0.1:0.01:10;  % Probar diferentes valores de x_0

fprintf(' x0     | Converge | Iter |     sol\n');
fprintf('--------|----------|------|------------------\n');

for x0 = x_vals
    x1 = x0 + 1;  % Estimación inicial para el siguiente valor
    [sol, incr, iter, ACOC] = SecanteC(x0, x1, f, tol, maxiter);
    
    if isnan(sol)
        converge = 'NO ';
        sol_str = 'NaN';
    else
        converge = 'SÍ ';
        sol_str = num2str(sol, '%.6f');
    end
    
    fprintf('%6.2f  | %8s |  %2d  | %s\n', x0, converge, iter, sol_str);
end
%bruteforce