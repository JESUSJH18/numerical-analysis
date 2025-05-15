function [t, y] = Heun_sistemas(f, a, b, y0, N)
% [t, y] = Heun_sistemas(f, t0, tf, y0, h)
% Resuelve el sistema de ecuaciones diferenciales y' = f(t,y) con el metodo de Heun
h= (b-a)/N; % Paso
t= a:h:b; % Vector de nodos, vector fila
y = zeros(N+1,length(y0)); % Inicializar matriz de soluciones
y(1,:)= y0; % Condiciones iniciales
k1= zeros(N+1,length(y0)); % Inicializar matriz de pendientes
k2= zeros(N+1,length(y0)); % Inicializar matriz de pendientes
for k=1:N
    k1(k,:)= feval(f,t(k),y(k,:))'; 
    k2(k,:)= feval(f,t(k+1),y(k,:)+h*k1(k,:))'; % Pendiente en el punto siguiente
    y(k+1,:)= y(k,:) + h*(k1(k,:)+k2(k,:))/2; % Metodo de Heun
end
end
% Error de truncamiento global de orden 2, O(h^2).