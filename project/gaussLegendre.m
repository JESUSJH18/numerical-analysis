function I = gaussLegendre(f, a, b, n)
    
   
    if n < 1
        error('Se requiere al menos 1 nodo.');
    end

    % Obtener nodos y pesos en [-1, 1]
    [t, w] = obtenerNodosYPesos(n);

    % Cambio de variable para [a, b]
    x = ((b - a)/2) * t + (a + b)/2; % Transformación lineal
    fx = f(x); % Evaluar la función en los nodos

    % Calcular la integral
    I = ((b - a)/2) * sum(w .* fx);
end

function [t, w] = obtenerNodosYPesos(n)
    

   
    beta = 0.5 ./ sqrt(1 - (2*(1:n-1)).^(-2)); 
    T = diag(beta, 1) + diag(beta, -1); % Matriz tridiagonal

    
    [V, D] = eig(T);
    t = diag(D); % Nodos
    [t, idx] = sort(t); % Ordenar nodos
    w = 2 * V(1, idx).^2; 
end
