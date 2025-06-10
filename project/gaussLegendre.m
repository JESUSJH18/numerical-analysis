function I = gaussLegendre(f, a, b, n)
    % Integración numérica mediante cuadratura de Gauss-Legendre
    % Input:
    %   f: función a integrar (handle)
    %   a, b: límites de integración
    %   n: número de nodos
    % Output:
    %   I: aproximación de la integral
    
    if n < 1
        error('Se requiere al menos 1 nodo.');
    end

    % Obtener nodos y pesos en [-1, 1]
    [t, w] = obtenerNodosYPesos(n);

    % Cambio de variable para [a, b]
    x = ((b - a)/2) * t + (a + b)/2; % Transformación lineal
    fx = f(x); % Evaluar la función en los nodos
    
    
    % Asegurar que w.*fx sea producto elemento a elemento correcto:
    if ~isequal(size(w), size(fx))
        fx = fx(:)';  % Fuerza compatibilidad de dimensiones
    end

    % Calcular la integral
    I = ((b - a)/2) * sum(w .* fx);
end

function [t, w] = obtenerNodosYPesos(n)
    % Obtiene los nodos y pesos para cuadratura Gauss-Legendre
    % en el intervalo [-1, 1]
    
    if n == 1
        t = 0;
        w = 2;
        return;
    end
    
    % Coeficientes beta para la matriz tridiagonal
    beta = 0.5 ./ sqrt(1 - (2*(1:n-1)).^(-2)); 
    
    % Construir matriz tridiagonal simétrica
    T = diag(beta, 1) + diag(beta, -1); 
    
    % Calcular autovalores (nodos) y autovectores
    [V, D] = eig(T);
    t = diag(D); % Nodos
    
    % Ordenar nodos y obtener pesos
    [t, idx] = sort(t); % Ordenar nodos
    w = 2 * (V(1, idx).^2); % Pesos
    
    % Asegurar que los pesos suman 2 (para intervalo [-1,1])
    w = w(:)'; % Convertir a vector fila para consistencia
end