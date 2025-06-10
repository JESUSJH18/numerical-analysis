function dy = p1examen2023N(x, y)
    % apartado 1b, newton
    % y = [y1; y2; z1; z2] (vector columna)
    dy = zeros(4, 1);
    dy(1) = y(2);  % y1' = y2
    dy(2) = y(1)*y(2) + y(1)^2 + exp(-x)*(x - 2 - x*exp(-x));  % y2'
    dy(3) = y(4);  % z1' = z2 (derivada para Newton)
    dy(4) = (y(2) + 2*y(1))*y(3) + y(1)*y(4);  % z2'
end