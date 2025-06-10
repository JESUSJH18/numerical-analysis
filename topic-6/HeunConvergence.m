function convergence_order = HeunConvergence(f, a, b, y0, n_values)
    % f: Función de la EDO (string o function handle)
    % a, b: Intervalo [a, b]
    % y0: Condición inicial
    % n_values: Vector con valores de n (ej. [20,40,80,160,320])
    
    % 1. Calcular solución de referencia con n grande
    n_ref = 10000;
    [~, y_ref] = Heun_sistemas(f, a, b, y0, n_ref);
    ref_value = y_ref(end);
    
    % 2. Inicializar arrays para resultados
    num_n = length(n_values);
    solutions = zeros(1, num_n);
    errors = zeros(1, num_n);
    h_values = zeros(1, num_n);
    
    % 3. Calcular soluciones para cada n
    for i = 1:num_n
        n = n_values(i);
        [~, y] = Heun_sistemas(f, a, b, y0, n);
        solutions(i) = y(end);
        h_values(i) = (b - a)/n;
        errors(i) = abs(solutions(i) - ref_value);
    end
    
    % 4. Calcular ratios y órdenes
    ratios = [NaN, errors(1:end-1) ./ errors(2:end)];
    orders = [NaN, log2(ratios(2:end))];
    
    % 5.tabla mejorable
    fprintf('n\t\t h\t\t\t Aproximación\t Error\t\t Ratio\t\t Orden\n');
    fprintf('---------------------------------------------------------------------\n');
    for i = 1:num_n
        fprintf('%d\t\t %.6f\t %.6f\t %.4e', n_values(i), h_values(i), solutions(i), errors(i));
        if i > 1
            fprintf('\t %.4f\t %.4f', ratios(i), orders(i));
        else
            fprintf('\t\t --\t\t --');
        end
        fprintf('\n');
    end
   
    convergence_order = orders;
end