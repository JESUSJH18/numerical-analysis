function [t,y]= MilneTrapecios(f,a,b,h,y0,y1)
    % [t,y]= MilneTrapecios(f,a,b,h,y0,y1)
    % Este codigo está hecho para el problema 20 de las transparencias del tema 6
    % Resuelve la ecuacion diferencial y' = f(t,y) con el metodo de Milne-Trapecios
    h=(b-a)/h; % paso
    t=a:h:b; 
    y=zeros(N+1,1);
    y(1)=y0; % valor inicial
    for k=1:3
        k1=feval(f,t(k),y(k));
        k2=feval(f,t(k+1),y(k)+h*k1);
        y(k+1)=y(k)+h/2*(k1+k2);
    end
    %predictor Milne para el resto de los puntos
    for k=4:N
        yp=y(k-3)+4*h/3*(2*feval(f,t(k),y(k))-feval(f,t(k-1),y(k-1))+2*feval(f,t(k-2),y(k-2)));

        %corrector de trapecios implicito
        y(k+1)=y(k)+h/2*(feval(f,t(k),y(k))+feval(f,t(k+1),yp));
    end


end
