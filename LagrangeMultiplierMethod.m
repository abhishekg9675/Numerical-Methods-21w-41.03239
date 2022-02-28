clear;
syms x y z lambda alpha;

f(x,y,z)= -0.5*x^2-y^2-0.3*x+4 ;
g(x,y,z)= x^2+y^2-1 ;
h(x,y,z)= sym(0) ;

L = f + lambda * g + alpha * h ;
system=jacobian(L,[x,y,z,lambda,alpha]);

[xsol, ysol, zsol, lambda_val, alpha_val] = solve(system, [x y z lambda alpha], 'Real', true);

xyzvalues = [[xsol, ysol, zsol], vpa(f(xsol,ysol,zsol))]
multipliers = [lambda_val, alpha_val]


