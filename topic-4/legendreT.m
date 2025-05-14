function lk = legendreT(k)
% lk = legendreT(k) 
l0=1; lk=l0; grado=1;
while grado<=k
    if grado==1
        l1=[1 0]; lk=l1; grado=grado+1;
    else
        if grado>=2
            l2=(2*grado-1)/grado*conv([1 0],l1)-...
                (grado-1)/grado*[0 0 l0]; lk=l2;
            l0=l1; l1=l2; grado=grado+1;
        end
    end
end
end