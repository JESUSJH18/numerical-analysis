function dy=pr3(t,y)

dfE=(3*pi*sin(2*t)*exp(-(3*pi*t)/50))/50 - 2*cos(2*t)*exp(-(3*pi*t)/50); %calculado con diff
dy=[(dfE-y/1.1)/2.1];
end