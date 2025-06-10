function dudx = pr14(x, u)
    dudx = [...
        u(2); ...  % du1/dx = u2
        u(3); ...  % du2/dx = u3
        -36/u(3) - 60/(x-1)^6 + 3*(x-1)^5 ...  % du3/dx = ...
    ];
end