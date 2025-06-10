function dy=pr21(t,y)
mu= 398598.309;
r=42167.911;
dy=[y(2); -mu*y(1)/r^3;y(4); -mu*y(3)/r^3];
end