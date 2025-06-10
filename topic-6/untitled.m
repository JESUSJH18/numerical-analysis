function [orden, E] = ordenaprox_rk4(f, a, b, y0, N, m)
% [orden, E] = ordenaprox_rk4(f, a, b, y0, N, m)
% Aproxima el orden de convergencia del método RK4 comparando con ode45
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

% Primero calculamos la solución "exacta" con ode45 (tolerancias ajustadas)
options = odeset('RelTol', 1e-12, 'AbsTol', 1e-12);
[t_exact, y_exact] = ode45(f, [a b], y0, options);

for k = 1:m
    % Calcular solución con RK4
    [t_rk4, y_rk4] = RK4Sistemas(f, a, b, y0, N);
    
    % Interpolar la solución exacta en los puntos de RK4 para comparar
    y_exact_interp = interp1(t_exact, y_exact, t_rk4);
    
    % Calcular error máximo (en norma infinito)
    E(k,:) = max(abs(y_rk4 - y_exact_interp));
    
    % Guardar el valor de h actual
    h_vals(k) = (b-a)/N;
    
    % Duplicar el número de nodos para la siguiente iteración
    N = 2*N;
end

% Calcular el orden de convergencia
orden = log2(E(1:end-1,:)./E(2:end,:));

% Opcional: Graficar la convergencia
figure;
loglog(h_vals, E, 'o-');
xlabel('Paso h');
ylabel('Error máximo');
title('Convergencia del método RK4');
grid on;
legend('Componente 1', 'Componente 2', ...); % Ajustar según dimensiones de y0
end