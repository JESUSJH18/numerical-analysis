function [t,y] = Euler(f, a, b, y0, N)
% [t,y] = Euler(f, t0, y0, h, N)
% % Resuelve la ecuacion diferencial y' = f(t,y) con el metodo de Euler
h= (b-a)/N; % Paso
t= a:h:b; % Vector de nodos, vector fila
y = zeros(N+1,1); 
y(1)= y0; % Condicion inicial
for k=1:N
    y(k+1)= y(k) + h*feval(f,t(k),y(k)); % Metodo de Euler
end

%Error de truncamiento global de orden 1, O(h).
