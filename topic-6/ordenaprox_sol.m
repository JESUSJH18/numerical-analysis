function [orden, E]=ordenaprox_sol(f,a,b,y0,N,m)
% [orden]=ordenaprox_sol(f,a,b,y0,N,m)
% aproximamos el orden de Euler a traves de la solucion, a traves de sol1 y sol2
E=zeros(m,length(y0)); % Inicializar el vector de errores
for k=1:m % mejor con un while con condicion de parada, m es el numero de veces que quieres duplicar N,
    %puedes ponerle m=10 o incluso mas
    [t, y] = EulerSistemas(f, a, b, y0, N);
    sol1=exp(5*t)/3-exp(-t)/3+exp(2*t); % esto es conocido del problema
    sol2=exp(5*t)/3+2*exp(-t)/3+t.^2.*exp(2*t); % esto es conocido del problema
    solex= [sol1',sol2']; % Solucion exacta que solo depende de t, ' para trasponer
    E(k,:)=max(abs(y-solex)); % Error absoluto
    N=2*N; %duplicar el numero de nodos
end
orden=log2(E(1:end-1,:)./E(2:end,:)); % Orden de convergencia de teoria