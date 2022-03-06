syms u(t)
ode = diff(u,t,2)+4*u == 5*sin(t)
ySol(t) = dsolve(ode);
ySol = simplify(ySol);

cond1 = u(0) == 0;
diffy = diff(u,t)
cond2 = diffy(0) == 0;
cond = [cond1 cond2];
ySol(t) = dsolve(ode,cond)
ySol = simplify(ySol)
