function [Integral, iter, incre] = SimpsonIterativo(f, a, b, n, tol, maxiter)
    if mod(n,2) ~= 0
        n = n + 1;
        warning('n debe ser par. Usando n = %d', n);
    end
    
    incre = tol + 1;
    iter = 1;
    I = zeros(1, maxiter);
    I(1) = Simpson(f, a, b, n);  % <- Error original: n se duplicaba antes de la primera iteración
    
    while incre > tol && iter < maxiter
        n = 2*n;  % Ahora se duplica después de la primera evaluación
        iter = iter + 1;
        I(iter) = Simpson(f, a, b, n);
        incre = abs(I(iter) - I(iter-1));
    end
    
    if incre > tol
        warning('No se alcanzó la tolerancia en %d iteraciones', maxiter);
        Integral = I(iter);
    else
        Integral = I(iter);
    end
end