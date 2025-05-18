function [ti,wi] = GaussLobatto(n)
%[ti,wi] = GaussLobatto(n)
wi=[];
wn=2/(n*(n-1));
if n>2
    cl=pol_LegendreT(n-1);
    ci=((n-1):-1:0).*cl;
    ci=ci(:,(1:n-1));
    ti=roots(ci);
    ti=ti';
    ti=sort(ti,"descend");
    for i=1:(n-2)
        pi=polyval(cl,ti(i));
        w=wn/(pi^2);
        wi=[wi w];
    end
    wi=[wn wi wn];
    ti=[1 ti -1];
else 
    if n==2
        wi=[wn wn];
        ti=[1 -1];
    else
        disp("Se necesitan al menos 2 nodos para la cuadratura!")
    end
end
end