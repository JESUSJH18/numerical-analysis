function [ai,bi,ci,di,p] = splineCubicoNatural(xi,fi)
% splineCubicoNatural -Calcula el spline cúbico natural
% Entrada:
% xi -nodos (vector de longitud n+1)
% fi -valores de la función en los nodos
% Salida:
% ai, bi, ci, di -coeficientes de cada tramo del spline
% P función spline como expresión simbólica por tramos -
%[ai,bi,ci,di,p] = splineCubicoNatural(xi,fi)
n = length(xi) -1;
m = n + 1;
ai = fi(:);  % columna
hi = diff(xi);  % longitudes entre nodos


% Inicializar vectores para sistema tridiagonal
dP = zeros(m,1);
% diagonal principal
dS = zeros(m,1);
% superdiagonal (con tamaño m)
dI = zeros(m,1);
% subdiagonal (con tamaño m)
v = zeros(m,1);
% lado derecho
dP(1) = 1;
dP(end) = 1;
for i = 2: n
    dI(i) = hi(i - 1) ;
    dP(i)=2 * (hi(i - 1) + hi(i)) ;
    dS(i) = hi(i);
    term1 = 3 / hi(i) * (ai(i+1) - ai(i));
    term2 = 3 / hi(i-1) * (ai(i) - ai(i-1));
    v(i) = term1 - term2;
end
% Resolver sistema tridiagonal para obtener ci
c = Crout(dP, dS, dI, v);

% Calcular bi y di
bi = zeros(n, 1);
di= zeros(n, 1);
for i = 1:n
    bi(i)= (ai(i + 1) - ai(i)) / hi(i) -hi(i)/3* (2 * c(i)+c(i+1)) ;
    di(i)= (c(i + 1) - c(i)) /(3* hi(i)) ;
end
ci = c(1: n) ; % para salida
% Construcción del spline simbólico por tramos
%despues poner en contruirPolinomios.m
syms x;
p = sym(0);
for i = 1 : n
    S=ai(i)+bi(i) * (x-xi(i))+ci(i) * (x - xi(i))^ 2 + di(i) * (x - xi(i))^ 3 ;
    p = piecewise((x>=xi(i))& (x<=xi(i+1)), S, p);
end
end