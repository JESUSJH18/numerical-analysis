function dy=pvi1(x,y)
    
    dy=[y(2);
        -2./x.*y(2)+2./x.^2*y(1)+sin(log(x))./x.^2;
        
         ];
end

