function [x,y,t,iter,incr]= DisparonolinealN1b(PVI,a,b,alfa,beta,N,tol,maxiter)
        %  [x,y,t,iter,incr]= DisparonolinealN1b('p1examen2023N',2,3,exp(-2),exp(-3),10,1e-6,100)

    
    % es para examen de 2023, ejercicio 1b
    % Método de disparo con Newton adaptado al examen 2023 -> p1 parte b
    % alfa = y(2) + y'(2) = 1/exp(2)
    % beta = y(3) + y'(3) = 1/exp(3)
h = (b - a)/N;
    x = a:h:b;
    incr = tol + 1;
    iter = 0;
    t0=0;% se puede cambiar 

    % Condiciones iniciales para y y z
    y0 = [t0, alfa - t0, 1, -1]; % [y(2), y'(2), z(2), z'(2)], z(2) y z'(2) son las derivadas parciales con respecto a t

    while incr > tol && iter < maxiter
        % Resolver el sistema extendido con RK4
        [x, ysol] = RK4_sis(PVI, a, b, y0, N);
        yb = ysol(end, 1);      % y(t, 3)
        dyb = ysol(end, 2);     % y'(t, 3)
        zb = ysol(end, 3);      % z(t, 3)
        dzb = ysol(end, 4);     % z'(t, 3)

        % Evaluar F(t) y su derivada F'(t)
        F = yb + dyb - beta;
        dF = zb + dzb;

        % Actualizar t usando Newton
        t = t0 - F / dF;

        % Actualizar condiciones iniciales para la próxima iteración
        y0 = [t, alfa - t, 1, -1];
        incr = abs(F);
        t0 = t;
        iter = iter + 1;
    end

    if incr > tol
        disp('No se alcanzó la precisión deseada.');
    end

    % La solución y(x) corresponde a las primeras dos columnas de ysol
    y = ysol(:, 1:2);
end