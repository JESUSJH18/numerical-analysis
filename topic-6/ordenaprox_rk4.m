function [orden, E] = ordenaprox_rk4(f, a, b, y0, N, m)
% [orden, E] = ordenaprox_rk4_nosol(f, a, b, y0, N, m)
% Aproxima el orden de convergencia del método RK4 usando solución de referencia de alta precisión
%
% Inputs:
%   f: función handle del sistema dy/dt = f(t,y)
%   a, b: intervalo de tiempo [a,b]
%   y0: condición inicial
%   N: número inicial de subintervalos
%   m: número de refinamientos (se duplica N en cada iteración)
%
% Outputs:
%   orden: vector con los órdenes de convergencia estimados en cada refinamiento
%   E: matriz de errores (m x length(y0))

E = zeros(m, length(y0)); % Inicializar matriz de errores
h_vals = zeros(m, 1);     % Almacenar valores de h

% 1. Calcular solución de referencia con RK4 y paso muy pequeño (N_ref >> N)
N_ref = N * 2^(m+3); % Paso mucho más fino que el último refinamiento
[t_ref, y_ref] = Runge_Kutta_sis(f, a, b, y0, N_ref);

for k = 1:m
    % Calcular solución con RK4
    [t_rk4, y_rk4] = Runge_Kutta_sis(f, a, b, y0, N);
    
    % Interpolar la solución de referencia en los puntos de RK4
    y_ref_interp = interp1(t_ref, y_ref, t_rk4);
    
    % Calcular error máximo (en norma infinito)
    E(k,:) = max(abs(y_rk4 - y_ref_interp));
    
    % Guardar el valor de h actual
    h_vals(k) = (b-a)/N;
    
    % Duplicar el número de nodos para la siguiente iteración
    N = 2*N;
end

% Calcular el orden de convergencia
orden = log2(E(1:end-1,:)./E(2:end,:));

% Graficar la convergencia
figure;
loglog(h_vals, E, 'o-', 'LineWidth', 1.5);
xlabel('Paso h');
ylabel('Error máximo');
title('Convergencia del método RK4 (Referencia numérica)');
grid on;

% Añadir leyenda dinámica
leg = cell(1, size(y0,2));
for i = 1:size(y0,2)
    leg{i} = sprintf('Componente %d', i);
end
legend(leg);

% Añadir rectas teóricas de orden 4 para comparación
hold on;
for i = 1:size(E,2)
    loglog(h_vals, E(1,i)*(h_vals/h_vals(1)).^4, '--', 'Color', [0.5 0.5 0.5]);
end
hold off;
end