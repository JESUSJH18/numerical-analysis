function [I] = MonteCarlo (f,a,b,n)
    % I=MonteCarlo (f,a,b,n)
x=rand(1,n);
nodos=a+x*(b-a);
y=feval(f,nodos);
I=((b-a)/n)*sum(y);
end