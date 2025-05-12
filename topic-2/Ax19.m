function [sol,dif,iter,ACOC,xk] = Ax19(x0,f,df,tol,maxiter)
% [sol,dif,iter,ACOC] = Ax19(x0,f,df,tol,maxiter)
iter=0; dif=tol+1; I=[];
while and (dif>tol,iter<maxiter )
    x1=x0-(f(x0)*df(x0))./((df(x0))^2+2*(f(x0))^2);
    dif=abs(x1-x0);
    I=[I dif];
    x0=x1;
    iter=iter+1;

end
if iter>=maxiter %No ha convergido
    sol=[]; disp("No ha convergido, número de iteraciones excecida, dame mas maxiter")
    ACOC=[];
else % Si ha convergido
    sol=x1;
    xk=x0;
    %tasa(I);
    ACOC=fACOC(I);
end


end