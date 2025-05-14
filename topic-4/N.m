function [Nodos]=N(n)
Nodos=zeros(1,n);
for k=1:n
    Nodos(k) = cos((2 * k-1) * pi/(2 * n));
end