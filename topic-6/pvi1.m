function dy=pvi1(t,y)
% pvi1: Ecuacion diferencial de primer orden
%utilizado complementariamete asi: 
% [t,y] = Euler('pvi1', 0, 3, 1, 8)
% plot(t,y)
%ejemplos: dy= (1-2*t)*y;
%u1=y(1); ...
% dy= [y(2);y(3) ;-6*y(1)^4];
dy=[3*y(1)+2*y(2)-(2*t^2+1)*exp(2*t);
4*y(1)+y(2)+(t^2+2*t-4)*exp(2*t)];
% despues de hacer el: >> [t, y] = EulerSistemas('pvi1', 0,1, [1 1], 10)
% puedes hacer: plot(t,y)
end