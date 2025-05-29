function dy=pvi4(x,y)
    %resolucion del ejemplo 6 del tema 7
    dy=[y(2);
        1/8*(32+2*x.^3-y(1)*y(2));
        y(4);
        -1/8*y(2)*y(3)-1/8*y(1)*y(4);     
      

    ];
end

