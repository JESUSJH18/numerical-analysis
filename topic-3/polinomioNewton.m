function [p,D] = polinomioNewton(xi,fi)
 % p = polinomioNewton(xi,fi) obtiene el polinomio de
 % interpolacion de Newton de grado n, con n+1 datos
 % de entrada
 syms x
 xi=xi(:); fi=fi(:); n=length(xi); vx=x.^0;
 % Obtencion de la tabla de diferencias divididas D y los
 % vectores vx=(x-x0)(x-x1)···
 D = fi;
 for col = 2:n
    for fil = col:n
 % Calculo de los elementos D(fil,col)
        D(fil, col) = (D(fil, col-1) - D(fil-1, col-1)) / (xi(fil) - xi(fil-col+1));
    end
 % Actualizacion de vx
    vx(col)=vx(col-1)*(x-xi(col-1));
 end
 % Obtencion del polinomio
 dD=diag(D);
 p=sum(dD.*vx(:));
 end