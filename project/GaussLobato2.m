function [x, w, P] = GaussLobato2(n)
    N = n - 1;
    N1 = N + 1;

    % nodos de Chebyshev-Gauss-Lobatto al principio
    x = cos(pi*(0:N)/N)';

    % Matriz de Legendre Vandermonde 
    P = zeros(N1, N1);

    xold = 2;

    % iteracion de Newton
    while max(abs(x - xold)) > eps
        xold = x;
        P(:, 1) = 1; %l0
        P(:, 2) = x;%l1

        for k = 2:N
            P(:, k+1) = ((2*k - 1)*x.*P(:, k) - (k - 1)*P(:, k-1)) / k; % l2,... formula de polLegendre para k-1, en vez de k, k-1 (bucle empieza en k=2) 
        end

        % actualizar x utilizando las raices de P'_N
        x = xold - (x.*P(:, N1) - P(:, N)) ./ (N1 * P(:, N1));
    end

    % formula pesos
    w = 2 ./ (N * N1 * P(:, N1).^2);

    % nodos y pesos para q esten en ascendente
    x = flipud(x);
    w = flipud(w);
end
