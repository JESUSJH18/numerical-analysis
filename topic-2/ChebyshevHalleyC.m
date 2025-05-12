function [sol,incr,iter,ACOC,incr2] = ChebyshevHalleyC(x0,f,df,d2f,beta,tol,maxiter)
% [sol,incr,iter,ACOC] = ChebyshevHalleyC(x0,f,df,d2f,beta,tol,maxiter)
iter=0; incr=tol+1; I=[];

while and (incr>tol,iter<maxiter )
    Lf= f(x0)*d2f(x0)/(df(x0)).^2;
    x1=vpa(x0- (1 + (0.5 * Lf / (1-beta*Lf)))*f(x0)/df(x0),200);
    incr=vpa(abs(x1-x0),200);
    I=[I incr];
    incr2 = abs ( f ( x1 ) ) ;
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
    if and (ACOC(end)==Inf,length(ACOC)>1)
        disp("Ojo que ACOC ha dado Inf, hay que ver la verdadera sol con NS1(vpa(x0),m,f,df,tol,maxiter) y haciendo vpa(sol,5)\n")
        sol=vpa(sol,200);
        ACOC=[ACOC vpa(ACOC(end-1),200)];
        %esto es pq si es infinito tienes que encontrar el de antes
    end
    fprintf("hemos convergido a la sol %d en %d iteraciones. El valor de ACOC≈ %d nos da el orden de convergencia.\n",sol, iter,ACOC(end))
    
end


end