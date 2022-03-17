%% 1D Galerkin Method (Upto 3 parameter approximation)
syms x a1 a2 a3 f E I g myu L alpha
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parameter = 1

P1 = sin(pi*x/4)
%P1 = x*(1-x)
%P2 = (x^2+y^2)*P1
P2 = 0
%P3 = x^2*y^2 * P1
P3 = 0

P0 = 0

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[lim1,lim2] = deal(0,4)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
u = P0 + a1*P1 + a2*P2 + a3*P3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
diff_eqn = 23*diff(u,x,2)+8*u-6*x
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
residual = subs(diff_eqn,{u},{u})
if parameter == 1
    eqn1 = int(P1*residual,x,lim1,lim2)==0
    simplify(eqn1)
    [a1sol]=solve(eqn1,a1)
    double([a1sol])
elseif parameter == 2
    eqn1 = int(P1*residual,x,lim1,lim2)==0
    eqn2 = int(P2*residual,x,lim1,lim2)==0
    [a1sol, a2sol]=solve(eqn1,eqn2,a1,a2)
    double([a1sol, a2sol])
elseif parameter == 3
    eqn1 = int(P1*residual,x,lim1,lim2)==0
    eqn2 = int(P2*residual,x,lim1,lim2)==0
    eqn3 = int(P3*residual,x,lim1,lim2)==0
    [a1sol, a2sol, a3sol]=solve(eqn1,eqn2,eqn3,a1,a2,a3)
    double([a1sol, a2sol, a3sol])
end


%2 parameter approximation
% eqn1 = int(int(P1*residual,x,-1,1),y,-1,1)==0
% eqn2 = int(int(P2*residual,x,-1,1),y,-1,1)==0
% eqn3 = int(int(P3*residual,x,-1,1),y,-1,1)==0
% [a1sol,a2sol,a3sol]=solve(eqn1,eqn2,eqn3, a1,a2,a3);
% simplify([a1sol,a2sol,a3sol])
%% 2D Galerkin Method (Upto 3 parameter approximation)
syms x y a1 a2 a3 F E I g myu L alpha
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parameter = 1

P1 = sin(pi*x) * sin(pi*y)
%P1 = x*(1-x)
%P2 = (x^2+y^2)*P1
P2 = 0
%P3 = x^2*y^2 * P1
P3 = 0

P0 = 0

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[lim1,lim2, lim3, lim4] = deal(0,1,0,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
u = P0 + a1*P1 + a2*P2 + a3*P3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
diff_eqn = diff(u,x,2)+diff(u,y,2)+F
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
residual = subs(diff_eqn,{u},{u})
if parameter == 1
    eqn1 = int(int(P1*residual,x,lim1,lim2),y,lim3,lim4)%==0
    [a1sol]=solve(eqn1,a1)
    vpa([a1sol])
elseif parameter == 2
    eqn1 = int(int(P1*residual,x,lim1,lim2),y,lim3,lim4)==0
    eqn2 = int(int(P2*residual,x,lim1,lim2),y,lim3,lim4)==0
    [a1sol, a2sol]=solve(eqn1,eqn2,a1,a2)
    vpa([a1sol, a2sol])
elseif parameter == 3
    eqn1 = int(int(P1*residual,x,lim1,lim2),y,lim3,lim4)==0
    eqn2 = int(int(P2*residual,x,lim1,lim2),y,lim3,lim4)==0
    eqn3 = int(int(P3*residual,x,lim1,lim2),y,lim3,lim4)==0
    [a1sol, a2sol, a3sol]=solve(eqn1,eqn2,eqn3,a1,a2,a3)
    vpa([a1sol, a2sol, a3sol])
end

