function I = IntegraLobattoAB(a,b,f,n)
%I = IntegraLobatto(f,n)
[ti,wi]=GaussLobatto(n);
syms x;
ba=ones(1,n)*(b+a)/2;
ti=(ti*(b-a)/2)+ba;
fi=[];
for i=1:n
    fi=[fi f(ti(i))];
end
s=fi.*wi;
I=sum(s)*(b-a)/2;
end