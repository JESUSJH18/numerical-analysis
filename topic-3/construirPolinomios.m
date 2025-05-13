function polinomios = construirPolinomios(ai, bi, ci, di, xi)
% Devuelve un cell array con los polinomios de cada tramo del spline
n=length(ai) - 1;
syms x
polinomios = cell(n,1);
for i = 1:n
    p=ai(i)+bi(i)* (x-xi(i))+ci(i)* (x - xi(i)) ^ 2 +di(i) * (x-xi(i))^3;
    polinomios{i} = expand(p); % expandir para mostrar bonito
end
end