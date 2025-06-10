function dv = ej1(t, v)
    m = 0.11;   % Masa (kg)
    g = 9.8;    % Gravedad (m/s²)
    k = 0.002;  % Coeficiente de resistencia (kg/m)
    dv = (-m*g - k * v * abs(v)) / m;  % Ecuación: dv/dt = [-mg - kv|v|]/m
end