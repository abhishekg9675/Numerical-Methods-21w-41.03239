% syms x a b u(x) v(x)
% expr = diff(u,2)*v;
% 
% F = int(expr,x,[a,b])
% G = integrateByParts(F,diff(u(x), x, x))
% H = integrateByParts(F,diff(u(x), x))


