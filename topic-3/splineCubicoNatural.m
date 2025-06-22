function [ai, bi, ci, di, p] = splineCubicoNatural(xi, fi)
% SPLINECUBICONATURAL Calcula el spline cúbico natural



if length(xi) ~= length(fi)
    error('Los vectores xi y fi deben tener la misma longitud');
end
if length(xi) < 3
    error('Se necesitan al menos 3 puntos para un spline cúbico');
end

n = length(xi) - 1;  % Número de intervalos
ai = fi(:);          % Coeficientes a (valores de la función)
hi = diff(xi);       % Diferencias entre nodos

% 2. Sistema tridiagonal para c_i
A = zeros(n+1);      % Matriz del sistema
b = zeros(n+1, 1);   % Vector independiente

% Condiciones naturales (S''=0 en extremos)
A(1,1) = 1;
A(end,end) = 1;

% Ecuaciones internas
for i = 2:n
    A(i,i-1:i+1) = [hi(i-1), 2*(hi(i-1)+hi(i)), hi(i)];
    b(i) = 3*((ai(i+1)-ai(i))/hi(i) - (ai(i)-ai(i-1))/hi(i-1));
end


ci = A\b;

bi = zeros(n, 1);
di = zeros(n, 1);
for i = 1:n
    bi(i) = (ai(i+1)-ai(i))/hi(i) - hi(i)/3*(2*ci(i)+ci(i+1));
    di(i) = (ci(i+1)-ci(i))/(3*hi(i));
end

ci = ci(1:n);

syms x;
p = sym(0);
fprintf('\nSpline Cúbico Natural:\n');

for i = 1:n
    % Polinomio por tramos
    S = ai(i) + bi(i)*(x-xi(i)) + ci(i)*(x-xi(i))^2 + di(i)*(x-xi(i))^3;
    p = piecewise((x>=xi(i)) & (x<=xi(i+1)), S, p);
    
    % Mostrar con formato claro
    fprintf('Tramo %d [%.4f, %.4f]:\n', i, xi(i), xi(i+1));
    fprintf('S(x) = %.4f', ai(i));
    if bi(i) ~= 0
        fprintf(' %+.4f(x%+.4f)', bi(i), -xi(i));
    end
    if ci(i) ~= 0
        fprintf(' %+.4f(x%+.4f)²', ci(i), -xi(i));
    end
    if di(i) ~= 0
        fprintf(' %+.4f(x%+.4f)³', di(i), -xi(i));
    end
    fprintf('\n\n');
end
end