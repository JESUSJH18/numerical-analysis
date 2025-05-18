function I = IntegraLobattoImpropio(a,b,f,n,k)
%I = IntegraLobattoImpropio(a,b,f,n,k)
I=0;
for i=2:k
    ai=1/(2^(i));
    I=I+IntegraLobattoAB(a+ai,a+ai*2,f,n);
end
I=I+IntegraLobattoAB(a+0.5,b,f,n);
end

