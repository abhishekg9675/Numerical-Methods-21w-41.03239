syms u(x) E A
sympref('default');

%Enter Integrand of Energy Functional Here
f = diff(u,x)^2 + cos(u);

fprintf('Differential Equation is')
G = functionalDerivative(f,u)==0,
GG=simplify(G)
pretty(GG);

ySol = dsolve(GG);
ySol = simplify(ySol)

%% Reverse Mode(Differential Equation to Energy Functional)

syms E A u(x) L

%Enter Differential Equation
f = -diff(E*A*diff(u,x),x);

w = int(f,0,L);
G = functionalDerivative(f,x)


%% 
syms z, fun;

fun=z^2;

F=int(fun,0,x)
