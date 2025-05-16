function [t,y]= MilneTrapecios(f,a,b,y0,N)
    % [t,y]= MilneTrapecios(f,a,b,h,y0,y1)
    % Este codigo está hecho para el problema 20 de las transparencias del tema 6
    % Resuelve la ecuacion diferencial y' = f(t,y) con el metodo de Milne-Trapecios
    %uso: [t,y]= MilneTrapecios('pr20',0,3,[1 2 0],80)
    % plot(t,y)
    h=(b-a)/N; % paso
    t=a:h:b; 
    y=zeros(N+1,length(y0));
    y(1,:)=y0; % valor inicial
    for k=1:3
        k1 = feval(f, t(k), y(k,:)');                % y(k,:) es fila → transponer a columna
        k2 = feval(f, t(k+1), y(k,:)' + h * k1);     % predictor
        y(k+1,:) = y(k,:) + h/2 * (k1' + k2');
    end
    %predictor Milne para el resto de los puntos
    for k=4:N
        f1 = feval(f, t(k),   y(k,:)')';
        f2 = feval(f, t(k-1), y(k-1,:)')';
        f3 = feval(f, t(k-2), y(k-2,:)')';

        yp = y(k-3,:) + 4*h/3 * (2*f1 - f2 + 2*f3);
        fp = feval(f, t(k+1), yp')';
        %corrector
        y(k+1,:) = y(k,:) + h/2 * (f1 + fp);
    end


end
