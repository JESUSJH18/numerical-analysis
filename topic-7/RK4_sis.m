function [t,y]= RK4_sis(f,a,b,y0,N)
% [t,y]= Runge_Kutta_sis(f,a,b,y0,N)
h= (b-a)/N; % Paso
t= a:h:b; % Vector de nodos, vector fila
y = zeros(N+1,length(y0)); % Inicializar matriz de soluciones
y(1,:)= y0; % Condiciones iniciales
k1= zeros(N+1,length(y0)); 
k2= zeros(N+1,length(y0)); 
k3= zeros(N+1,length(y0)); 
k4= zeros(N+1,length(y0)); 
for k=1:N
    k1(k,:)= feval(f,t(k),y(k,:))';
    k2(k,:)= feval(f,t(k)+h/2,y(k,:)+h*k1(k,:)/2)';
    k3(k,:)= feval(f,t(k)+h/2,y(k,:)+h*k2(k,:)/2)';
    k4(k,:)= feval(f,t(k)+h,y(k,:)+h*k3(k,:))';
    y(k+1,:)= y(k,:)+ h/6*(k1(k,:)+2*k2(k,:)+2*k3(k,:)+k4(k,:)); % Metodo de Runge-Kutta
end
end
