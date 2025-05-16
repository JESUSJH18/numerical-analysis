function [dy] = pr20(t,y)
    dy=[y(2); y(3);-2*y(3)+y(2)+2*y(1)+exp(t)];
end
