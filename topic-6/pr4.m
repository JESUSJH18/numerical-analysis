function dy=pr4(t,y)

E=exp(-0.06*pi*t)*sin(2*t-pi);
dfE=(3*pi*sin(2*t)*exp(-(3*pi*t)/50))/50 - 2*cos(2*t)*exp(-(3*pi*t)/50); %calculado con diff
d2fE=4*sin(2*t)*exp(-(3*pi*t)/50) + (6*pi*cos(2*t)*exp(-(3*pi*t)/50))/25 - (9*pi^2*sin(2*t)*exp(-(3*pi*t)/50))/2500;
dy=[0.3*d2fE+1/14*dfE+1/1.7*E];

end