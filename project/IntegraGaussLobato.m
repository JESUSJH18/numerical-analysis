function I = IntegraGaussLobato(f, a, b, n)
    
    if n < 2
        error('Se necesitan al menos 2 nodos.');
    end
    
    % Cambio de variable para mapear [a, b] a [-1, 1]
    c1 = (b - a)/2;
    c2 = (a + b)/2;
    
    % Función transformada para integrar en [-1, 1]
    f_transformada = @(t) f(c1 * t + c2);
    
    % Obtener nodos y pesos de Gauss-Lobatto
    [x, w, ~] = GaussLobato2(n);
    
    % Evaluar la función en los nodos transformados
    fx = f_transformada(x);
    
    % Calcular la integral (factor de escala c1)
    I = c1 * sum(w .* fx);
end