function di_dt = difnum(ti, i, t, num_puntos)
    %Aproxima la derivada de i respecto a t usando diferencias finitas
    % para ti(1), el primer punto te lo hace con progresiva, ti(end) con
    % regresiva y los demas con diferencia central, las formulas con
    % num_puntos
    % ti: Vector de tiempo (equiespaciado), ti=[0, 1, 2, ...]
    % i: Vector de corriente, i=[1,2,3,4,...]
    % t: Instante donde se aproxima la derivada
    % num_puntos: 2, 3, 4 o 5 (fórmulas hardcodeadas)
    
    % Verificar que t esté en ti
    idx = find(ti == t);
    if isempty(idx)
        error('El tiempo t no existe en el vector ti.');
    end
    
    h = ti(2) - ti(1); % Paso (asume equiespaciado)
    n = length(ti);
    
    % Seleccionar fórmula según num_puntos y posición de t
    switch num_puntos
        case 2 % 2 puntos (progresiva/regresiva)
            if idx == 1 % Primer punto: diferencia progresiva
                di_dt = (i(idx+1) - i(idx)) / h;
            elseif idx == n % Último punto: diferencia regresiva
                di_dt = (i(idx) - i(idx-1)) / h;
            else
                error('Para 2 puntos, t debe ser extremo.');
            end
            
        case 3 % 3 puntos (progresiva/regresiva/central)
            if idx == 1 % Progresiva de 3 puntos
                di_dt = (-3*i(idx) + 4*i(idx+1) - i(idx+2)) / (2*h);
            elseif idx == n % Regresiva de 3 puntos
                di_dt = (3*i(idx) - 4*i(idx-1) + i(idx-2)) / (2*h);
            else % Central de 2 puntos (usa 3 nodos)
                di_dt = (i(idx+1) - i(idx-1)) / (2*h);
            end
            
        case 4 % 4 puntos (progresiva/regresiva)
            if idx == 1 % Progresiva de 4 puntos
                di_dt = (-11*i(idx) + 18*i(idx+1) - 9*i(idx+2) + 2*i(idx+3)) / (6*h);
            elseif idx == n % Regresiva de 4 puntos
                di_dt = (2*i(idx-3) - 9*i(idx-2) + 18*i(idx-1) - 11*i(idx)) / (6*h);
            else
                error('Fórmula central de 4 puntos no implementada.');
            end
            
        case 5 % 5 puntos (central)
            if idx < 3 || idx > n-2 % Requiere 2 puntos a cada lado
                error('t debe estar al menos 2 pasos alejado de los extremos.');
            end
            di_dt = (-i(idx+2) + 8*i(idx+1) - 8*i(idx-1) + i(idx-2)) / (12*h);
            
        otherwise
            error('num_puntos debe ser 2, 3, 4 o 5.');
    end
end