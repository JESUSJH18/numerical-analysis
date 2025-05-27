function wi = resolvcuadratura(a,b,n)
% RESOLVCUADRATURA Calcula los pesos de una cuadratura de grado n
%   a, b: límites de integración
%   n: grado de exactitud
%   wi: vector de pesos de la cuadratura

    xj = linspace(a, b, n+1);
    A = zeros(n+1, n+1); % A(i,j) = x_j^(i-1)
    b_vec = zeros(n+1, 1); % b(i) = ∫ x^(i-1) dx

    for k = 0:n
        for j = 0:n
            A(k+1, j+1) = xj(j+1)^k;
        end
        % Integral exacta de x^k en [a, b]
        b_vec(k+1) = (b^(k+1) - a^(k+1)) / (k+1);
    end

    % Resolver sistema A * w = b
    wi = A \ b_vec;

   
end

