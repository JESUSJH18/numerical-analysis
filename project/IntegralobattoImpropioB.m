function [I] = IntegralobattoImpropioB(a, b, f, n, k, c)

% - k: Número de subdivisiones cerca de la singularidad
% - c: Punto singular (opcional, por defecto c = a)

if nargin < 6
    c = a; % Singularidad en a por defecto si pones menos de 6 parametros
end

I = 0;

% Obtener nodos y pesos de Gauss-Lobatto para el intervalo [-1, 1]
[nodes, weights] = getGLNodesWeights(n); % Función interna

% Caso 1: Singularidad en a
if c == a
    j = 1;
    a_end = a + 1/(2^j);
    while a_end > b
        j = j + 1;
        a_end = a + 1/(2^j);
    end
    for i = j:j + k - 1
        ai = 1/(2^i);
        left = a + ai/2;
        right = a + ai;
        I = I + gaussLobattoQuad(left, right, f, nodes, weights); % Integral en subintervalo
    end
    I = I + gaussLobattoQuad(a + a_end, b, f, nodes, weights);

% Caso 2: Singularidad en b
elseif c == b
    j = 1;
    b_start = b - 1/(2^j);
    while b_start < a
        j = j + 1;
        b_start = b - 1/(2^j);
    end
    for i = j:j + k - 1
        bi = 1/(2^i);
        left = b - bi;
        right = b - bi/2;
        I = I + gaussLobattoQuad(left, right, f, nodes, weights);
    end
    I = I + gaussLobattoQuad(a, b_start, f, nodes, weights);

% Caso 3: Singularidad en c \in (a, b)
else
    delta = min(c - a, b - c);
    for i = 1:k
        step = delta/(2^i);
        left = max(a, c - step);
        right = min(b, c + step);
        I = I + gaussLobattoQuad(left, right, f, nodes, weights);
    end
    I = I + gaussLobattoQuad(a, c - delta/(2^k), f, nodes, weights) ...
          + gaussLobattoQuad(c + delta/(2^k), b, f, nodes, weights);
end


function integral = gaussLobattoQuad(a_sub, b_sub, f, nodes, weights)
    % Escalar nodos y pesos al intervalo [a_sub, b_sub]
    scale = (b_sub - a_sub)/2;
    scaled_nodes = a_sub + (nodes + 1)*scale;
    scaled_weights = weights * scale;
    % Evaluar la función y sumar
    integral = sum(f(scaled_nodes) .* scaled_weights);
end


    function [nodes, weights] = getGLNodesWeights(n)
    switch n
        case 3 % Nodos: -1, 0, 1; Pesos: 1/3, 4/3, 1/3
            nodes = [-1, 0, 1];
            weights = [1/3, 4/3, 1/3];
        case 4
            nodes = [-1, -sqrt(1/5), sqrt(1/5), 1];
            weights = [1/6, 5/6, 5/6, 1/6];
        case 5 
            nodes = [-1, -sqrt(3/7), 0, sqrt(3/7), 1];
            weights = [1/10, 49/90, 32/45, 49/90, 1/10];
        case 9 
            nodes = [-1, -0.8997579954, -0.6771862795, -0.3631174638, 0, ...
                      0.3631174638, 0.6771862795, 0.8997579954, 1];
            weights = [0.0277777778, 0.1654953616, 0.2745387126, 0.3464285110, ...
                       0.3715192744, 0.3464285110, 0.2745387126, 0.1654953616, 0.0277777778]; %vaya mierda de hardcodeada la vdd
        otherwise
            error('Solo soporta n=3, 4, 5, 9');
    end
end

end