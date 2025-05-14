function [Coef, CT, Tpol] = serieChebyT(f, N, a, b)
% [Coef, CT, Tpol] = serieChebyT(f, N, a, b)
% Devuelve los coeficientes a_k (Coef), la serie truncada CT(x),
% y los polinomios de Chebyshev transformados T̃_k(x) en [a,b]

    syms x
    % Cambio de variable de [a,b] a [-1,1]
    xt = (b - a)/2 * x + (a + b)/2;
    ft = subs(f, x, xt);

    Coef = sym(zeros(N+1, 1)); % Coeficientes a_k
    Tpol = sym(zeros(N+1, 1)); % Polinomios transformados T̃_k(x)
    CT = 0;                    % Inicializar la serie

    for k = 0:N
        Tk = chebyshevT(k, x);                         % T_k(x) en [-1,1]
        integrando = ft * Tk / sqrt(1 - x^2);
        ak = (2/pi) * int(integrando, x, -1, 1);        % Coeficiente a_k

        if k == 0
            ak = ak / 2;  % Ajustar a_0
        end

        Coef(k+1) = vpa(simplify(ak), 6);               % Redondear
        CT = CT + ak * Tk;                              % Sumar a la serie

        % Polinomio transformado T̃_k(x) en el intervalo original [a,b]
        Tpol(k+1) = expand(subs(Tk, x, (2*x - b - a)/(b - a)));
    end

    % Expandir la serie truncada final en [a,b]
    CT = expand(subs(CT, x, (2*x - b - a)/(b - a)));
end
