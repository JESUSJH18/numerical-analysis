function [l3, Li3] = pol(xi, fi)
    % xi: puntos x en los que se conocen los valores
    % fi: valores de f(x) correspondientes
    % Calcula el polinomio de Lagrange de grado n-1 (donde n es el tamaño de xi)
    
    n = length(xi); % Número de puntos
    syms x; % Definir la variable simbólica x
    L = sym(zeros(n,1)); % Inicializamos las funciones de Lagrange
    
    for i = 1:n
        % Función base L_i(x)
        Li = 1;
        for j = 1:n
            if i ~= j
                Li = Li * (x - xi(j)) / (xi(i) - xi(j));
            end
        end
        L(i) = Li; % Guardamos la función base L_i(x)
    end
    
    % El polinomio de Lagrange
    l3 = sum(fi .* L); % Sumar las funciones base multiplicadas por los valores de f(x)
    Li3 = L; % Devuelvo las funciones base L_i(x) para cada i
end
