function I = I2_gauss_lobatto_adaptive(b,f_sub,n_sub, n_nodes)
    
    %   - n_sub: Número de subdivisiones geométricas (30 funciona bien)
    %   - n_nodos: Número de nodos por subintervalo (100 tmb funciona bien,
    %   pero cuidao que se puede ir por coste computacional
    
    a = 0; % Límite inferior original (se deberia de poner de input la vdd
    
    m = n_sub; % Número de subdivisiones (se puede cambiar a n_sub directamente ns)
    I = 0;
    
    % Generar puntos r_k = pi / 2^k, converge a 0
    r = zeros(1, m + 1);
    r(1) = b; % r_0 = pi
    for k = 2:m+1
        r(k) = r(k-1) / 2;
    end
    r(end) = a + 1e-12; 
    
    
    for k = 1:m
        a_sub = r(k+1);
        b_sub = r(k);
        
       
        
        
        % Aplicar Gauss-Lobatto en [a_sub, b_sub]
        I_sub = IntegraGaussLobato(f_sub, a_sub, b_sub, n_nodes);
        I = I + I_sub;
    end
end