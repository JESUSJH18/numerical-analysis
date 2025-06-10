function [x,y,t,iter,incre]= DisparoSecante_A1(PVI,a,b, alfa,beta,N, tol,maxiter)
% condiciones dirichlet
  %N es el numero de subintervalos
h=(b-a)/N; 
x=a:h:b; 
incre=tol+1; iter=0;
t0=0; % este t0 se puede cambiar, es un valor cualquiera
[x,y]=ode45(PVI,x,[alfa,t0]); 
yb0=y(end,1);
% ypb1=y(end,2);
t1=1;% este t1 se puede cambiar
[x,y]=ode45(PVI,x,[alfa,t1]);
yb1=y(end,1);
% zpb2=z(end,2);

while incre>tol && iter<maxiter
    t=t1-((yb1-beta)*(t1-t0))/(yb1-yb0);
    [x,y]=ode45(PVI,x,[alfa,t]);
    yb=y(end,1);
    t0=t1; t1=t; % actualizamos los valores de t1 y t2
    yb0=yb1; yb1=yb;
    iter=iter+1;
    incre=abs(yb1-beta);
    
end
if incre>tol
    disp('Cambiar los t iniciales');
else
    
end


end


% Ejemplo:  [x,y,t,iter, incre]= DisparoSecante_A1('E3',1,3, 17,43/3,10,1e-6,20)
% donde el E3 es el ejemplo 2 del tema 7