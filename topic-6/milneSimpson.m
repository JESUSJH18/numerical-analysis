function [x, y] = milneSimpson(f, a, b, y0, N)
% pr 16
    % Parámetros
    h = (b - a) / N;
    x = a:h:b;
    y = zeros(N+1, length(y0));
    y(1,:) = y0;
    
    % Inicialización con RK4 para los primeros 4 puntos
    for k = 1:min(3, N)
        k1 = f(x(k), y(k,:)')';
        k2 = f(x(k) + h/2, y(k,:) + (h/2)*k1')';
        k3 = f(x(k) + h/2, y(k,:) + (h/2)*k2')';
        k4 = f(x(k) + h, y(k,:) + h*k3')';
        y(k+1,:) = y(k,:) + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
    end
    
    % Almacenar derivadas
    f_vals = zeros(N+1, length(y0));
    for k = 1:4
        f_vals(k,:) = f(x(k), y(k,:)')';
    end
    
    % Milne-Simpson desde k=4 hasta N
    for k = 4:N
        % Predicción (Milne)
        yp = y(k-3,:) + (4*h/3) * (2*f_vals(k,:) - f_vals(k-1,:) + 2*f_vals(k-2,:));
        fp = f(x(k+1), yp')';
        
        % Corrección (Simpson)
        y(k+1,:) = y(k-1,:) + (h/3) * (fp + 4*f_vals(k,:) + f_vals(k-1,:));
        f_vals(k+1,:) = f(x(k+1), y(k+1,:)')';
    end
end

% Función para el PVI del Problema 14


% Ejecución principal (en un script o en la terminal)
% a = 0; b = 0.5; 
% y0 = [-1, -3, -12];  % [y(0), y'(0), y''(0)]
% N = 40;
% [x, y_sol] = milneSimpson(@pr14, a, b, y0, N);

% Últimos 10 valores de y (solución principal)
% last_10_y = y_sol(end-9:end, 1);
% disp('Últimos 10 valores de y:');
% disp(last_10_y);

% Gráfica
% plot(x, y_sol(:,1));
% xlabel('x');
% ylabel('y(x)');
% title('Solución del PVI con Milne-Simpson (Problema 14)');
% grid on;