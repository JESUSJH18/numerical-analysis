function [dy] = pr18(t,y)
    dy=[y(2); t^2*y(1)-2*y(2)];
end
