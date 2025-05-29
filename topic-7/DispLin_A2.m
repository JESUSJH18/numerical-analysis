function [x,Y]= DispLin_A2(pvi1,pvi2,a,b,N,alfa,beta)
    % [x,y]= DispLin_A2(pvi1,pvi2,a,b,N,alfa,beta)
    %pv1 y pv2 codigos auxiliares que cambian segun el problema
    h= (b-a)/N;
    x= a:h:b; % Vector de nodos, vector fila
    [x,y1]= ode45(pvi1,x,[alfa,0]);

    [x,y2]= ode45(pvi2,x,[0,1]);
    Y=y1+(beta-y1(end,1))/(y2(end,1))*y2;

end