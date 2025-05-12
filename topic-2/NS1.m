 function [sol,incr,iter,ACOC] = NS1(x0,m,f,df,tol,maxiter)
 % [sol,incr,iter,ACOC] = NS1(x0,m,f,df,tol,maxiter) , Newton-Schröder 1
iter=0; incr=tol+1; I=[];

while and (incr>tol,iter<maxiter )
   
    x1=x0-m*(f(x0)/df(x0));
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
    if and (ACOC(end)==Inf,length(ACOC)>1)
        disp("Ojo que ACOC ha dado Inf, hay que ver la verdadera sol con NS1(vpa(x0),m,f,df,tol,maxiter) y haciendo vpa(sol,5)")
        sol=vpa(sol,5);
        ACOC=[ACOC vpa(ACOC(end-1),5)];
        %esto es pq si es infinito tienes que encontrar el de antes
    end
    fprintf("hemos convergido a la sol %d en %d iteraciones. El valor de ACOC≈ %d nos da el orden de convergencia.\n",sol, iter,ACOC(end))
    
end

end