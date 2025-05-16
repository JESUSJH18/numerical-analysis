function I = Trapecios(f,a,b,n)
h=(b-a)/n;
nodos=a:h:b;
y=feval(f,nodos);
pesos=2*ones(1,n+1);
pesos(1)=1;
pesos(end)=1;
I=h/2*sum(pesos.*y);

end