clc;
syms w x y z lambda alpha k;

f(w,x,y,z)= ((y-w)^2+(z-x)^2)^0.5-1
g(w,x,y,z)= w^2+x^2-0.25
h(w,x,y,z)= z-k*y^2+2.6


L = f + lambda * g + alpha * h ;
system=jacobian(L,[w,x,y,z,lambda,alpha]);

[wsol, xsol, ysol, zsol, lambda_val, alpha_val] = solve(system, [w x y z lambda alpha])

fprintf('[w,x,y,z,value]')
xyzvalues = vpa([[wsol,xsol, ysol, zsol], vpa(f(wsol,xsol,ysol,zsol))])
fprintf('[multiplier1, multiplier2]')
multipliers = vpa([lambda_val, alpha_val])

%% clc;
syms  x y lambda;

f(x,y)= sin(x)^2+cos(y)^2
g(x,y)= sin(x)*cos(y);

L = f + lambda * g ;
system=jacobian(L,[x,y,lambda]);

[xsol, ysol, lambda_val] = solve(system, [x y lambda], 'Real', true);

fprintf('[x,y,value]')
xyzvalues = double([[xsol, ysol], vpa(f(xsol,ysol))])
fprintf('[multiplier1]')
multipliers = [lambda_val]
%% 
% 
% clc;
syms x1 y1 x2 y2 lambda alpha k;

f(x1,y1,x2,y2)= (y2+2.6)/(x2^2)

g(x1,y1,x2,y2)= x1^2+y1^2-0.5^2
h(x1,y1,x2,y2)= ((x2-x1)^2+(y2-y1)^2)^0.5-1

L = f + lambda * g + alpha * h ;
system=jacobian(L,[x1,y1,x2,y2,lambda,alpha]);

[wsol, xsol, ysol, zsol, lambda_val, alpha_val] = solve(system, [x1 y1 x2 y2 lambda alpha])

fprintf('[w,x,y,z,value]')
xyzvalues = double([[wsol,xsol, ysol, zsol], double(h(wsol,xsol, ysol, zsol)+1)])
fprintf('[multiplier1, multiplier2]')
multipliers = vpa([lambda_val, alpha_val])
%% 
% clc;
syms x1 y1 x2 y2 lambda alpha k;

f(x1,y1,x2,y2)= ((x2-x1)^2+(y2-y1)^2)^0.5

g(x1,y1,x2,y2)= x1^2+y1^2-0.5^2
h(x1,y1,x2,y2)= 1.9*x2^2-2.6-y2

L = f + lambda * g + alpha * h ;
system=jacobian(L,[x1,y1,x2,y2,lambda,alpha]);

[wsol, xsol, ysol, zsol, lambda_val, alpha_val] = solve(system, [x1 y1 x2 y2 lambda alpha])

fprintf('[w,x,y,z,value]')
xyzvalues = double([[wsol,xsol, ysol, zsol], double(f(wsol,xsol, ysol, zsol))])
fprintf('[multiplier1, multiplier2]')
multipliers = vpa([lambda_val, alpha_val])
