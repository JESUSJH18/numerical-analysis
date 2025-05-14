function ln = Legendre(n)
% ln = legendre(n) obtiene los coeficientes del
% polinomio de Legendre
a=-1; b=1;
l0=1; ln=l0; grado=1;
alpha0 = intPolyab(conv(l0,l0),a,b);
while grado<=n
    if grado==1
        b1=1/alpha0*intPolyab(conv([1 0],conv(l0,l0)),a,b);
        l1=[1 -b1]; ln=l1; grado=grado+1;
    else
        if grado>=2
            alpha1=intPolyab(conv(l1,l1),a,b);
            b2=1/alpha1*intPolyab(conv([1 0],conv(l1,l1)),a,b);
            c2=1/alpha0*intPolyab(conv([1 0],conv(l1,l0)),a,b);
            l2=conv([1 -b2],l1)-c2*[0 0 l0]; ln=l2;
            l0=l1; l1=l2; alpha0=alpha1; grado=grado+1;
        end
    end
end
end

function I=intPolyab(p,a,b)
I0 = polyint(p);
I = diff(polyval(I0,[a b]));
end