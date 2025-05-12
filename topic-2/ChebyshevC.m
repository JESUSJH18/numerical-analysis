function [sol,incr,iter,ACOC] = ChebyshevC(x0,f,df,d2f,tol,maxiter)
% [sol,incr,iter,ACOC] = ChebyshevC(x0,f,df,d2f,tol,maxiter)
iter=0; incr=tol+1; I=[];
while and (incr>tol,iter<maxiter )
    x1=x0- (1 + (0.5 * (f(x0) * d2f(x0)) / (df(x0)^2))) * (f(x0) / df(x0));
    incr=abs(x1-x0);
    I=[I incr];
    x0=x1;
    iter=iter+1;

end
if iter>=maxiter %No ha convergido
    sol=[]; disp("No ha convergido, número de iteraciones excecida, dame mas maxiter")
    ACOC=[];
else % Si ha convergido
    sol=x1;
    %tasa(I);
    ACOC=fACOC(I);
    fprintf("hemos convergido a la sol %d en %d iteraciones. El valor de ACOC≈ %d nos da el orden de convergencia.\n",sol, iter,ACOC(end))
end


end