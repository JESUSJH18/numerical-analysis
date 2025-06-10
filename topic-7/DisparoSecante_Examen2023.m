function [x, y, t, iter, incre] = DisparoSecante_Examen2023(PVI, a, b, alfa, beta, N, tol, maxiter)
% Método de disparo con secante adaptado al examen 2023-> p1 parte a
% alfa = y(2) + y'(2) = 1/exp(2)
% beta = y(3) + y'(3) = 1/exp(3)

h = (b - a)/N;
x = a:h:b;
incre = tol + 1;
iter = 0;

t0 = 0;
y0 = [t0, alfa - t0];
[x, ysol] = RK4_sis(PVI, a, b, y0, N);
yb0 = ysol(end, 1); dyb0 = ysol(end, 2);

t1 = 1;
y1 = [t1, alfa - t1];
[x, ysol] = RK4_sis(PVI, a, b, y1, N);
yb1 = ysol(end, 1); dyb1 = ysol(end, 2);

while incre > tol && iter < maxiter
    % Método de la secante
    F0 = yb0 + dyb0 - beta;
    F1 = yb1 + dyb1 - beta;
    
    t = t1 - F1*(t1 - t0)/(F1 - F0);
    
    y_init = [t, alfa - t];
    [x, ysol] = RK4_sis(PVI, a, b, y_init, N);
    yb = ysol(end, 1); dyb = ysol(end, 2);
    
    % Actualización
    t0 = t1; t1 = t;
    yb0 = yb1; yb1 = yb;
    dyb0 = dyb1; dyb1 = dyb;
    
    iter = iter + 1;
    incre = abs(yb + dyb - beta);
end

if incre > tol
    disp('No se alcanzó la precisión deseada. Prueba con otros valores de t0 y t1.');
end

y = ysol;
t = t1;
end
