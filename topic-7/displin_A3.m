function [x,y]= displin_A3(pvi11,pvi22,a,b,alfa,beta,N)
h=(b-a)/(N+1);
%N es el numero de incógnitas
x=a:h:b;
[x,y1]=ode45(pvi11,x,[alfa 0]);
[x,y2]=ode45(pvi22,x,[0 1]);
coef=(beta-y1(end,1))/(y2(end,1));
y=y1+coef*y2;
end

