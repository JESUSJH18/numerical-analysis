function [x,y,t,iter,incr]= DisparonolinealN(pvi,a,b,N,alfa,beta,tol,maxiter)
    % [x,y,t,iter,incr]= DisparonolinealN(pvi,a,b,N,tol,maxit), N=Newton
h=(b-a)/N; x=a:h:b; 
iter=1;
% incr=tol+1;
t=(beta-alfa)/(b-a);
[x,y]=ode45(pvi,x,[alfa,t,0,1]); 
incr=abs(y(end,1)-beta);
while incr>tol && iter<maxiter
    t=t-(y(end,1)-beta)/(y(end,3));
    [x,y]=ode45(pvi,x,[alfa,t,0,1]); 
    incr=abs(y(end,1)-beta);
    iter=iter+1;
end
if incr>tol
    disp('No ah convergido');
else
    

end