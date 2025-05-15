function [t, y] = EulerSistemas(f, a, b, y0, N)
% [t, y] = EulerSistemas(f, t0, tf, y0, h)

h= (b-a)/N; % Paso
t= a:h:b; % Vector de nodos, vector fila
y = zeros(N+1,length(y0)); % Inicializar matriz de soluciones
y(1,:)= y0; % Condiciones iniciales
for k=1:N
    y(k+1,:)= y(k,:) + h*feval(f,t(k),y(k,:))'; % Metodo de Euler
end
end