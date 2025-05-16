function [Integral,iter, incre] = TrapeciosIterativo(f,a,b,n,tol,maxiter)

incre=tol+1;
iter=1;
I(1)=Trapecios(f,a,b,n);
while incre>tol && iter<maxiter
    n=2*n;
    iter=iter+1;
    I(iter)=Trapecios(f,a,b,n);
    incre=abs(I(iter)-I(iter-1));

end
if incre>tol
    disp('mas iteraciones')
else
    Integral=I(end);
end

end