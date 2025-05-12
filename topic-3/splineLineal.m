function [S, Si] = splineLineal(xi, fi)
    % [S, Si] = splineLineal(xi, fi) obtiene la función a trozos
    % S(x) y los trozos Si(x) a partir de los datos (xi, fi),
    % xi=[x0 ... xn], fi=[f0 ... fn]

    syms x
    xi = xi(:); 
    fi = fi(:); 
    n = length(xi); % Número de puntos
    Si = sym(zeros(n-1,1));  % Inicializar vector simbólico de trozos
    S = sym(zeros(n-1,1));   % Inicializar la spline completa como una función simbólica

    % Construcción de los segmentos lineales con un bucle for
    for i = 1:n-1
        % Cálculo de la pendiente del segmento
        m = (fi(i+1) - fi(i)) / (xi(i+1) - xi(i));
        
        % Ecuación del tramo lineal Si(x) = fi + m * (x - xi)
        Si(i) = fi(i) + m * (x - xi(i));
        
        % Guardar el tramo en S con su intervalo correspondiente
        S(i) = Si(i);
    end
end
