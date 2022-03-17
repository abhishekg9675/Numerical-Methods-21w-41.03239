%% 1D Least Square Method (Upto 3 parameter approximation)
syms x a1 a2 a3 F u
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parameter = 1

%P1 = x^4 -8/3 *x^3 +2*x^2
P1 = sin(pi*x/3)
P2 = 0
%P2 = 0
%P3 = x^2*y^2 * P1
P3 = 0

P0 = 0

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[lim1,lim2] = deal(0,3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
u = P0 + a1*P1 + a2*P2 + a3*P3
%uu = u
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%2*diff(u,x,2)+3*u-5*x^2
residual = 19*diff(u,x,2)+15*u-2*x^2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if parameter == 1
    eqn1 = int(diff(residual,a1)*residual,x,lim1,lim2)==0
    [a1sol]=solve(eqn1,a1)
    double([a1sol])
elseif parameter == 2
    eqn1 = int(diff(residual,a1)*residual,x,lim1,lim2)==0
    eqn2 = int(diff(residual,a2)*residual,x,lim1,lim2)==0
    [a1sol, a2sol]=solve(eqn1,eqn2,a1,a2)
    double([a1sol, a2sol])
elseif parameter == 3
    eqn1 = int(diff(residual,a1)*residual,x,lim1,lim2)==0
    eqn2 = int(diff(residual,a2)*residual,x,lim1,lim2)==0
    eqn3 = int(diff(residual,a3)*residual,x,lim1,lim2)==0
    [a1sol, a2sol, a3sol]=solve(eqn1,eqn2,eqn3,a1,a2,a3)
    double([a1sol, a2sol, a3sol])
end


%2 parameter approximation
% eqn1 = int(int(P1*residual,x,-1,1),y,-1,1)==0
% eqn2 = int(int(P2*residual,x,-1,1),y,-1,1)==0
% eqn3 = int(int(P3*residual,x,-1,1),y,-1,1)==0



% [a1sol,a2sol,a3sol]=solve(eqn1,eqn2,eqn3, a1,a2,a3);
% simplify([a1sol,a2sol,a3sol])

% eqn1 = int(int(diff(residual,a1)*residual,x,lim1,lim2),y,lim3,lim4)==0
%     eqn2 = int(int(diff(residual,a2)*residual,x,lim1,lim2),y,lim3,lim4)==0
%     [a1sol, a2sol]=solve(eqn1,eqn2,a1,a2)
%     vpa([a1sol, a2sol])
%     %double(subs(a1sol,{f},{10}))
%% 
%diff(int(subs(residual,u,uu),x,0,1),a1)
