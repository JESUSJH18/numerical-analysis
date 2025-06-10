function [x,y,t,iter,incre]= DisparoSecante_A1_p2(PVI,a,b, alfa,beta,N, tol,maxiter)
% problema 1 del examen 2022-> RK4_sis
% [x,y,t,iter,incre]= DisparoSecante_A1_p2('p2examen',1,2, 0.909297,1.583624,10, 1e-6,20)
  %N es el numero de subintervalos
h=(b-a)/N; 
x=a:h:b; 
incre=tol+1; iter=0;
t0=0; % este t0 se puede cambiar, es un valor cualquiera
[x,y]=RK4_sis(PVI,a,b,[t0,alfa],N); 
yb0=y(end,1); dyb0=y(end,2);
% ypb1=y(end,2);
t1=1;% este t1 se puede cambiar
[x,y]=RK4_sis(PVI,a,b,[t1,alfa],N);
yb1=y(end,1); dyb1=y(end,2);
% zpb2=z(end,2);

while incre>tol && iter<maxiter
    t=t1-((yb1-dyb1-beta)*(t1-t0))/(yb1-dyb1-yb0+dyb0);
    [x,y]=RK4_sis(PVI,a,b,[t,alfa],N);
    yb=y(end,1); dyb=y(end,2);
    t0=t1; t1=t; % actualizamos los valores de t1 y t2
    yb0=yb1; yb1=yb;
    dyb0=dyb1; dyb1=dyb;
    iter=iter+1;
    incre=abs(yb1-dyb1-beta);
    
end
if incre>tol
    disp('Cambiar los t iniciales');
else
    
end


end


% Ejemplo:  [x,y,t,iter, incre]= DisparoSecante_A1('E3',1,3, 17,43/3,10,1e-6,20)
% donde el E3 es el ejemplo 2 del tema 7