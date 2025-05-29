function [X,solve]= Diffinitas_A1(p,q,r,a,b,alfa,beta,N)

h=(b-a)/N+1; %N+2 puntos, N+1 numero de subintervalos
X=a:h:b; 
x=X(2:end-1); X=X(:);
px=feval(p,x);
qx=feval(q,x);
rx=feval(r,x);
dp=2+h^2*qx;
ds=-1+h/2*px(1:end-1);
di=-1-h/2*px(2:end);
%construimos el término independiente
d=-h^2*rx;
d(1)=d(1)+(1+(h/2)*px(1))*alfa;
d(end)=d(end)+(1-(h/2)*px(end))*beta;
y=crout(dp,ds,di,d); %dp= diagonal principal, ds= diagonal superior, di= diagonal inferior
solve=[alfa;y;beta]; 
end




