function ACOC = fACOC(I)
    ACOC=log(I(3:end)./I(2:end-1))./log(I(2:end-1)./I(1:end-2));
end