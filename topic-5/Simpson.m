function I = Simpson(f,a,b,n)
%n tiene que ser par
h=(b-a)/n;
nodos=a:h:b;
y=feval(f,nodos);
pesos=2*ones(1,n+1);
pesos(2:2:n)=4;
pesos(1)=1;
pesos(end)=1;
%tambien se puede con vector primero de cuatros
%pesos=4*ones(1,n+1);
%pesos(1)=1;
%pesos(end)=1;
%pesos(3:2:end-2)=2;
I=h/3*sum(pesos.*y);

end