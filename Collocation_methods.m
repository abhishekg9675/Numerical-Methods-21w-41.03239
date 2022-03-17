%% Collocation by Points
clc;
syms u(x) x a1 a2 a3 a1sol a2sol a3sol f;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parameter = 2;
P1 = -x*(3-x);
P2 = -x^2*(3-x);
P3 = 0;

%[x1,y1,x2,y2] = deal(0,0,1,2);
%P0 = y1+((y1-y2)/(x1-x2))*(x-x1)
P0 = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

u = P0 + a1*P1 + a2*P2 + a3*P3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R = 19*diff(u,x,2)+15*u-2*x^2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
point_x1 = 0;
point_x2 = 2;
point_x3 = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (parameter == 3)
    RA1=subs(R,{x},{point_x1});
    RA2=subs(R,{x},{point_x2});
    RA3=subs(R,{x},{point_x3});
    [a1sol,a2sol,a3sol]=solve(RA1,RA2,RA3, a1,a2,a3);
    double( [a1sol,a2sol, a3sol]);
    u=double(subs(u,{x,a1,a2,a3},{point_x1, double(a1sol), double(a2sol), double(a3sol)}))
    u=double(subs(u,{x,a1,a2,a3},{point_x2, double(a1sol), double(a2sol), double(a3sol)}))
    u=double(subs(u,{x,a1,a2,a3},{point_x2, double(a1sol), double(a2sol), double(a3sol)}))

elseif (parameter == 2)
    RA1=subs(R,{x},{point_x1})
    RA2=subs(R,{x},{point_x2})
    [a1sol,a2sol]=solve(RA1,RA2,a1,a2);
    double( [a1sol,a2sol])
    u=double(subs(u,{x,a1,a2},{point_x1, double(a1sol), double(a2sol)}))
    u=double(subs(u,{x,a1,a2},{point_x2, double(a1sol), double(a2sol)}))

elseif (parameter == 1)
    RA1=subs(R,{x},{point_x1});
    [a1sol]=solve(RA1,a1);
    double(a1sol)
    u=double(subs(u,{x,a1},{point_x1, double(a1sol)}))
end
%% Collocation by SubDomains
clc;
syms u(x) x a1 a2 a3 a1sol a2sol a3sol f;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parameter = 2;
P1 = -x*(3-x);
P2 = -x^2*(3-x);
P3 = 0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%[x1,y1,x2,y2] = deal(0,0,1,2);
%P0 = y1+((y1-y2)/(x1-x2))*(x-x1)
P0 = 0
u = P0 + a1*P1 + a2*P2 + a3*P3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R = 19*diff(u,x,2)+15*u-2*x^2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[xlim1, xlim2, xlim3, xlim4, xlim5, xlim6] = deal(0,1,1,3,0,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (parameter == 3)
    RA1=int(R,xlim1, xlim2);
    RA2=int(R,xlim3, xlim4);
    RA3=int(R,xlim5, xlim6);
    [a1sol,a2sol,a3sol]=solve(RA1,RA2,RA3, a1,a2,a3)
    double( [a1sol,a2sol, a3sol]);
    u=double(subs(u,{x,a1,a2,a3},{xlim1, double(a1sol), double(a2sol), double(a3sol)}))
    u=double(subs(u,{x,a1,a2,a3},{xlim2, double(a1sol), double(a2sol), double(a3sol)}))
    u=double(subs(u,{x,a1,a2,a3},{xlim3, double(a1sol), double(a2sol), double(a3sol)}))

elseif (parameter == 2)
    RA1=int(R,xlim1, xlim2);
    RA2=int(R,xlim3, xlim4);
    [a1sol,a2sol]=solve(RA1,RA2,a1,a2)
    double([ a1sol,a2sol])
    u=double(subs(u,{x,a1,a2},{xlim1, double(a1sol), double(a2sol)}))
    u=double(subs(u,{x,a1,a2},{xlim2, double(a1sol), double(a2sol)}))
    
elseif (parameter == 1)
    RA1=int(R,xlim1, xlim2);
    [a1sol]=solve(RA1,a1)
    double( [a1sol])
    u=double(subs(u,{x,a1},{xlim1, double(a1sol)}))
end
%% Cross Check with Exact function
syms u(x) x

u = (x^2+1)^0.5 ;
double(subs(u,{x}, 0.5))
