function sol=Crout(a,b,c,d)
n=length(a); % Obtenci´on de las matrices L y U tales que A= LU
l(1)=a(1);
u(1)=b(1)/l(1);
for i=2:n-1
l(i)=a(i)-c(i-1)*u(i-1);
u(i)=b(i)/l(i);
end
l(n)=a(n)-c(n-1)*u(n-1); % Soluci´on del sistema Lz = d
z(1)=d(1)/l(1);
for i=2:n
z(i)=(1/l(i))*(d(i)-c(i-1)*z(i-1));
end % Soluci´on del sistema Ux = z
x(n)=z(n);
for i=n-1:-1:1
x(i)=z(i)-u(i)*x(i+1);
end
sol=x(:);