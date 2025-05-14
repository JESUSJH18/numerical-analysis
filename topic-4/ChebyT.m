function tTn = chebyT(n)
% tTn = chebyshevT(n) 
tT0=1; tTn=tT0; grado=1;
while grado<=n
    if grado==1
        tT1=[1 0]; tTn=tT1; grado=grado+1;
    else
        if grado>=2
            tT2=2*conv([1 0],tT1)-[0 0 tT0]; 
            tTn=tT2;
            tT0=tT1; tT1=tT2; grado=grado+1;
        end
    end
end
end