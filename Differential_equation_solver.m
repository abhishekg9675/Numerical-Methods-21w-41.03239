syms u(x) x F
ode = 10*diff(u,x,2) + 63*diff(u,x,4)
ySol = dsolve(ode);
ySol = simplify(ySol);

cond1 = 63*diff(u,x,2)==0;
cond2 = diff(u,x,3) + 10*diff(u,x)==0;
cond3 = u(0)==0
cond4 = u(1)==0

cond = [cond1 cond2 cond3 cond4];
ySol(t) = dsolve(ode,cond)
ySol = simplify(ySol)
