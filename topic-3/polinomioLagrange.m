function [p, L] = polinomioLagrange(xi, fi)
    % p = polinomioLagrange(xi, fi)
    % xi = nodos de interpolación
    % fi = valores de la función en los nodos
    % p = polinomio de Lagrange resultante
    % L = polinomios L_i(x) para cada i
    
    xi = xi(:);  % asegurar que xi es un vector columna
    fi = fi(:);  % asegurar que fi es un vector columna
    n = length(xi);  % número de puntos
    syms x  % variable simbólica para la construcción del polinomio
    
    % Inicializar un vector para guardar los polinomios L_i(x)
    L = sym(zeros(n, 1));
    
    % Cálculo de las funciones L_i(x)
    for i = 1:n
        % Inicialización de los términos del numerador y denominador
        Num = (x - xi);  % (x - xi_1), (x - xi_2), ..., (x - xi_n)
        Num(i) = [];  % Eliminar el término (x - xi_i) de la multiplicación
        Num = prod(Num);  % Producto de los términos (x - xi_j) para j != i
        
        Den = xi(i) - xi;  % Diferencia entre xi(i) y todos los xi
        Den(i) = [];  % Eliminar xi(i)
        Den = prod(Den);  % Producto de las diferencias xi(j) - xi(k) para j != k
        
        % Calcular el polinomio L_i(x) y almacenarlo en L
        L(i) = Num / Den;
    end
    
    % Creación del polinomio de Lagrange sumando todos los términos
    p = sum(L .* fi);
    
    % Mostrar los polinomios L_i(x) junto con el polinomio de Lagrange
    disp('Polinomios L_i(x):');
    for i = 1:n
        fprintf('L%d(x) = %s\n', i-1, char(L(i)));
    end
    
    % Mostrar el polinomio de Lagrange
    disp('Polinomio de Lagrange:');
    disp(p);
end
