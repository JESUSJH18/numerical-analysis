function x=Crout(dP,dS,dI,b)
% x=Crout(dP,dS,dI,b) obtiene la solución del sistema Ax=b
n=length(dP);
% 1. Obtención de las matrices L y U tales que A = LU
l(1)=dP(1); u(1)=dS(1)/l(1);
for i=2:n-1
    l(i)=dP(i)-dI(i-1)*u(i-1);
    u(i)=dS(i)/l(i);
end
l(n)=dP(n)-dI(n-1)*u(n-1);
% 2. Solución del sistema Lz = d
z(1)=b(1)/l(1);
for i=2:n
    z(i)=(1/l(i))*(b(i)-dI(i-1)*z(i-1));
end
% 3. Solución del sistema Ux = z
x(n)=z(n);
for i=n-1:-1:1
    x(i)=z(i)-u(i)*x(i+1);
end
x=x(:);