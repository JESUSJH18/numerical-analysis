function [x, y, iter, t, F_val] = DisparoSecante_Optimizado(odefun, a, b, N, alfa, beta, cond_b, t0, t1, tol, maxiter)
    % Entradas:
    %   odefun: Función de la EDO (devuelve [y', y''])
    %   a, b: Extremos del intervalo
    %   N: Número de subintervalos
    %   alfa: Valor de condición Dirichlet en x=a
    %   beta: Valor objetivo en x=b
    %   cond_b: Vector [C, D] para condición mixta en b: C*y(b) + D*y'(b) = beta
    %   t0, t1: Valores iniciales del parámetro t = y'(a)
    %   tol: Tolerancia 
    %   maxiter: Iteraciones máximas
    
    
    h = (b - a) / (N + 1);
    x = linspace(a, b, N + 2)';  % Malla equiespaciada
    iter = 0;
    F_val = zeros(1, maxiter + 2);  % Almacenar valores de F
    
    % 2. Función para evaluar F(t) = C*y(b) + D*y'(b) - beta
    F_eval = @(t) evaluar_F(odefun, x, alfa, t, cond_b, beta);
    
    % 3. Primeras evaluaciones (fuera del bucle)
    [F0, ~] = F_eval(t0);
    [F1, y_sol] = F_eval(t1);
    F_val(1:2) = [F0, F1];
    
    % 4. Bucle principal del método de la secante
    while abs(F1) > tol && iter < maxiter
        iter = iter + 1;
        
        % 4.1. Evitar división por cero
        if abs(F1 - F0) < eps
            warning('Diferencia nula en valores de F. Deteniendo iteraciones.');
            break;
        end
        
        % 4.2. Actualizar parámetro con método de la secante
        t_next = t1 - F1 * (t1 - t0) / (F1 - F0);
        
        % 4.3. Evaluar nueva F(t)
        [F_next, y_next] = F_eval(t_next);
        F_val(iter + 2) = F_next;
        
        % 4.4. Actualizar variables para siguiente iteración
        t0 = t1;
        t1 = t_next;
        F0 = F1;
        F1 = F_next;
        y_sol = y_next;  % Guardar última solución
    end
    
    % 5. Preparar salidas
    y = y_sol(:, 1);  % Extraer solución y(x)
    t = t1;
    
    % 6. Verificar convergencia
    if abs(F1) > tol
        warning('El método no convergió con la tolerancia especificada.');
    end
end

% Función auxiliar para evaluar F(t)
function [F_val, Y] = evaluar_F(odefun, x, alfa, t, cond_b, beta)
    % Resolver PVI: y(a)=alfa, y'(a)=t
    [~, Y] = ode45(@(x,y) odefun(x, y), x, [alfa; t]);
    
    % Extraer valores en x=b
    y_b = Y(end, 1);
    yp_b = Y(end, 2);
    
    % Calcular F(t) = C*y(b) + D*y'(b) - beta
    F_val = cond_b(1)*y_b + cond_b(2)*yp_b - beta;
end

