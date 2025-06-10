function eulererrortol
% Definimos la solución exacta
y_exacta = @(t) t.^2 .* (exp(t) + exp(1));

% Definimos la función f(t, y) de la EDO
f = @(t, y) (2./t + 1) .* y - t.^2 .* exp(1);

% Intervalo y tolerancia
a = 1;
b = 2;
tol_error = 1e-2;

% Inicializamos h grande y lo reducimos hasta cumplir el error
h = 0.1;  % Empezamos con h=0.1
error_max = inf;

while error_max > tol_error
    % Discretización
    t = a:h:b;
    N = length(t) - 1;
    
    % Método de Euler
    y_euler = zeros(1, N+1);
    y_euler(1) = y_exacta(a);  % Condición inicial exacta
    
    for k = 1:N
        y_euler(k+1) = y_euler(k) + h * f(t(k), y_euler(k));
    end
    
    % Error máximo en los nodos
    error_max = max(abs(y_euler - y_exacta(t)));
    
    % Reducimos h si el error es demasiado grande
    if error_max > tol_error
        h = h / 2;
    end
end

fprintf('El h requerido es: %.6f\n', h);
fprintf('Error máximo: %.6f\n', error_max);
fprintf('N: %.6f\n', N)