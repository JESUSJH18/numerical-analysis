function [x,solve,iter,t,incre]= DisparoSecante_A1(PVI,a,b,N, alfa,beta, tol,maxiter)
    
h=(b-a)/(N+1); %N+2 puntos, N+1 numero de subintervalos
x=a:h:b; 
x=x(:);
incre=tol+1; iter=1;
t1=0; % este t1 se puede cambiar, es un valor cualquiera
[x,y]=ode45(PVI,x,[alfa,t1]); 
yb1=y(end,1);
ypb1=y(end,2);
t2=1;% este t2 se puede cambiar
[x,z]=ode45(PVI,x,[alfa,t2]);
zb2=z(end,1);
zpb2=z(end,2);

while incre>tol && iter<maxiter
    t=t2-(zb2-zpb2-beta)*(t2-t1)/(zb2-zpb2-yb1+ypb1);
    [x,y]=ode45(PVI,x,[alfa,t]);
    ybt=y(end,1);
    ypbt=y(end,2);
    iter=iter+1;
    incre=abs(ybt-ypbt-beta);
    t1=t2; t2=t; % actualizamos los valores de t1 y t2
    yb1=ybt; ypb1=ypbt; % actualizamos los valores de yb1 y ypb1
end
if incre>tol
    disp('Cambiar los t iniciales');
else
    solve=y(:,1);
end


end


