 function [E2,Emax] = erroresAC(f,F,a,b,h)
 syms x
 % [E2,Emax] = erroresAC(f,F,a,b,h) obtiene los errores al
 % realizar la aproximaci´ on continua, siendo E2 el error
 % cuadr´atico y Emax el error m´aximo al aproximar f por F
 % en el intervalo [a,b]
E2 = vpa(int((f-F)^2,x,a,b),6); %lo redondeas a 6 c.f.
xx=a:h:b; %te creas este vector
fxx=vpa(subs(f,x,xx),6);%sustituir x por xx en la funcion simbólica, con syms x, 6 c.f
Fxx=vpa(subs (F,x,xx),6); %6 c.f
Emax=max(abs(fxx-Fxx));

 end