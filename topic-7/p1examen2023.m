function dy= p1examen2023(x,y)
dy=[y(2);
y(1)*y(2)+y(1)^2+exp(-x)*(x-2-x*exp(-x))
];
end