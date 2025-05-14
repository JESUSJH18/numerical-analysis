function M = DifDiv(xi, fi)
    if length(xi) ~= length(fi)
        error('Las listas xi y fi deben tener la misma longitud.');
    end

    % Número de nodos
    n = length(xi);

    % Inicializar la matriz M con ceros
    M = zeros(n, n);

    
    M(:, 1) = fi(:); 

    % Rellenar las diferencias divididas
    for j = 2:n
        for i = 1:(n - j + 1)
            M(i, j) = (M(i + 1, j - 1) - M(i, j - 1)) / (xi(i + j - 1) - xi(i));
        end
    end

    % Truncar la matriz para mostrar solo las filas con diferencias significativas
    M = M(1:n, :);
end