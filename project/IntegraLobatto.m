function I = IntegraLobatto(f,n)
%I = IntegraLobatto(f,n)
[ti,wi]=GaussLobatto(n);
syms x;
fi=[];
for i=1:n
    fi=[fi f(ti(i))];
end
s=fi.*wi;
I=sum(s);
end