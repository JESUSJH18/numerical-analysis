function [x,y,t,iter,incre]= DisparoSecantep4(PVI,a,b,N, tol,maxiter)
% ejericio 4 de los problemas

h = (b - a)/N;
x = a:h:b;
incre = tol + 1;
iter = 0;

t0 = 0;
y0 = [log(1/3)-1,t0 ];
[x, ysol] = RK4_sis(PVI, a, b, y0, N);
y1a3=ysol(end,1); y2a3 = ysol(end, 2);

t1 = 1;
y1 = [log(1/3)-1,t1];
[x, ysol] = RK4_sis(PVI, a, b, y1, N);
y2b3 = ysol(end, 2);
y1b3=ysol(end,1);
while incre > tol && iter < maxiter

    t = t1 - (y1b3+y2b3-0.5*log(3)-7)*(t1 - t0)/(y1b3+y2b3-y1a3-y2a3);
    y_init = [log(1/3)-1,t ];
    [x, ysol] = RK4_sis(PVI, a, b, y_init, N);
    y1a3=y1b3; y2a3=y2b3;
    y1b3=ysol(end,1); y2b3=ysol(end,2);

    % Actualización
    t0 = t1; t1 = t;


    iter = iter + 1;
    incre = abs(y1b3+y2b3-0.5*log(3)-7);
end

if incre > tol
    disp('No se alcanzó la precisión deseada. Prueba con otros valores de t0 y t1.');
end

y = ysol;
t = t1;
end
