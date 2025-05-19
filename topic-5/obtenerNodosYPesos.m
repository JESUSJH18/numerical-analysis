function [t, w] = obtenerNodosYPesos(n)


    if n < 1
        error('n debe ser mayor o igual a 1.');
    end

    
    beta = 0.5 ./ sqrt(1 - (2*(1:n-1)).^(-2));

    
    T = diag(beta, 1) + diag(beta, -1);
    [V, D] = eig(T);

    
    t = diag(D);
    
    
    [t, idx] = sort(t);
    
    
    w = 2 * (V(1, idx)).^2;

end
