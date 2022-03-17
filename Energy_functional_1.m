clc;
syms u(x) E A y I myu g L F D11 D12 D22 f(x) u(x) m
sympref('default');

%Enter Integrand of Energy Functional Here
%f =0.5 * E*I*(diff(u,x,2)^2) -0.5 * F * (diff(u,x))^2;
f = 0.5*(5*(diff(u,x,2))^2-myu*(u)^2);

fprintf('Differential Equation is')
G = functionalDerivative(f,u);
GG=simplify(G)
%pretty(GG)

%dsolve(GG)
%% Boundary conditions F(u,u',x)

%bc = diff(f,diff(u,x,2))
bc=-diff(f,diff(u,x,1)) + diff(diff(u,x,2),x)
pretty(bc)
%% 
cond1 = u(0) == 1;

cond2 = bc(1)==0;
%cond2 = u(1) == 2;

cond = [cond1 cond2];

ySol = dsolve(GG,cond);
ySol = simplify(ySol)
pretty(ySol)
%% clc;
syms u(x,y) f(x,y,z) b(x,y) c(x,y) E A x y z
sympref('default');

%Enter Integrand of Energy Functional Here
%f = 0.5*(diff(u,x)^2 + u^2 -2*u*x*diff(u,x));
f = (diff(u,x)^2 + 1/x^2*diff(u,y)^2)*x;

fprintf('Differential Equation is')
G = functionalDerivative(f,u);
GG=simplify(G==0)
%pretty(GG)

%dsolve(GG)
%% %% FOR DUAL FUNCTIONALS and VARIABLE END POINTS (Only Differential Equation)
clc;
syms u(x,y) f(x,y,z) b(x,y) c(x,y) E A x y z
sympref('default');

%Enter Integrand of Energy Functional Here
%f = 0.5*(diff(u,x)^2 + u^2 -2*u*x*diff(u,x));
f = 0.5*(diff(u,x)^2);

fprintf('Differential Equation is')
G = diff(f,u)-diff(diff(f,diff(u,x)),x);
GG=simplify(G==0)
%pretty(GG)

%dsolve(GG)
%% Stationary principle
clc;
syms a1 x;

uu = a1 * x*(1-x);

solve(diff(int(subs(f,u,uu),x,0,1),a1),F)
%% 


f
G = functionalDerivative(f,u)
bc = diff(f,diff(u,x,2))
