function dy=pvi1(t,y)
% pvi1: Ecuacion diferencial de primer orden
%utilizado complementariamete asi: 
% [t,y] = Euler('pvi1', 0, 3, 1, 8)
% plot(t,y)

dy= (1-2*t)*y;
end