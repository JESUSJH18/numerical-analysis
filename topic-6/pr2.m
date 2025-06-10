function dy=pr2(t,y)
% pvi1: Ecuacion diferencial de primer orden
%utilizado complementariamete asi: 
% [t,y] = Euler('pvi1', 0, 3, 1, 8)
% plot(t,y)
%ejemplos: dy= (1-2*t)*y;
%u1=y(1); ...
% dy= [y(2);y(3) ;-6*y(1)^4];

dy=[-0.6*pi*(3*10^-3)^2*sqrt(2*9.8)*(sqrt(y)/((20*pi/3)*y^2))];
end