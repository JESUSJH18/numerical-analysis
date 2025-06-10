function [x,y,t,iter,incre]= DisparoSecantep3_2024(PVI,a,b,N, tol,maxiter)

%  2024-> problema 3 
% alfa = y(2) + y'(2) = 1/exp(2)
% beta = y(3) + y'(3) = 1/exp(3)

h = (b - a)/N;
x = a:h:b;
incre = tol + 1;
iter = 0;

t0 = 1/2;
y0 = [0,t0,1 ];
[x, ysol] = RK4_sis(PVI, a, b, y0, N);
 dyba2 = ysol(end, 2); 
 dyba1=ysol(1,2);

t1 = 6;
y1 = [0,t1,1];
[x, ysol] = RK4_sis(PVI, a, b, y1, N);
 t1dyb2 = ysol(end, 2); 
 t1dyb1=ysol(1,2);
while incre > tol && iter < maxiter
       
    t = t1 - (t1dyb1+t1dyb2- 2.69315)*(t1 - t0)/(t1dyb1+t1dyb2-dyba1-dyba2);
    
    y_init = [0,t,1 ];
    [x, ysol] = RK4_sis(PVI, a, b, y_init, N);
    dyba1=t1dyb1; dyba2=t1dyb2;
    t1dyb1=ysol(1,2); t1dyb2=ysol(end,2);
    
    % Actualización
    t0 = t1; t1 = t;
    
    
    iter = iter + 1;
    incre = abs(t1dyb1+t1dyb2-2.69315);
end

if incre > tol
    disp('No se alcanzó la precisión deseada. Prueba con otros valores de t0 y t1.');
end

y = ysol;
t = t1;
end
