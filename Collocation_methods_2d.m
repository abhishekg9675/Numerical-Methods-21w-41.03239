%% Collocation by Points
clc;
syms u(x,y) x y a1 a2 a3 a1sol a2sol a3sol f x0 y0 x1 y1 a b;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parameter = 1;
P1 = (a^2-x^2)*(b^2-y^2);
P2 = 0;
P3 = 0;

%[x1,y1,x2,y2] = deal(0,0,1,2);
%P0 = y1+((y1-y2)/(x1-x2))*(x-x1)
P0 = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

u = P0 + a1*P1 + a2*P2 + a3*P3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R = -diff(u,x,2)-diff(u,y,2)-f;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
point_x1 = x0;
point_x2 = 0;
point_x3 = 0;

point_y1 = y0;
point_y2 = 0;
point_y3 = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (parameter == 3)
    RA1=subs(R,{x,y},{point_x1,point_y1});
    RA2=subs(R,{x,y},{point_x2,point_y2});
    RA3=subs(R,{x,y},{point_x3,point_y3});
    [a1sol,a2sol,a3sol]=solve(RA1,RA2,RA3, a1,a2,a3);
    double( [a1sol,a2sol, a3sol]);
    u=double(subs(u,{x,y,a1,a2,a3},{point_x1,point_y1, double(a1sol), double(a2sol), double(a3sol)}))
    u=double(subs(u,{x,y,a1,a2,a3},{point_x2,point_y2, double(a1sol), double(a2sol), double(a3sol)}))
    u=double(subs(u,{x,y,a1,a2,a3},{point_x2,point_y3, double(a1sol), double(a2sol), double(a3sol)}))

elseif (parameter == 2)
    RA1=subs(R,{x,y},{point_x1,point_y1});
    RA2=subs(R,{x,y},{point_x2,point_y2});
    [a1sol,a2sol]=solve(RA1,RA2,a1,a2);
    double( [a1sol,a2sol])
    u=double(subs(u,{x,y,a1,a2},{point_x1,point_y1 double(a1sol), double(a2sol)}))
    u=double(subs(u,{x,y,a1,a2},{point_x2,point_y2 double(a1sol), double(a2sol)}))

elseif (parameter == 1)
    RA1=subs(R,{x,y},{point_x1,point_y1});
    [a1sol]=solve(RA1,a1);
    vpa(a1sol)
    %u=double(subs(u,{x,y,a1},{point_x1,point_y1 double(a1sol)}))
end
%% Collocation by SubDomains
clc;
syms u(x,y) x y a1 a2 a3 a1sol a2sol a3sol f x0 y0 x1 y1 a b;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parameter = 1;
P1 = (a^2-x^2)*(b^2-y^2);
P2 = 0;
P3 = 0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%[x1,y1,x2,y2] = deal(0,0,1,2);
%P0 = y1+((y1-y2)/(x1-x2))*(x-x1)
P0 = 0
u = P0 + a1*P1 + a2*P2 + a3*P3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R = -diff(u,x,2)-diff(u,y,2)-f;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[xlim1, ylim1, xlim2, ylim2] = deal(x0,y0,x1,y1); %%1 parameter

%[xlim1, ylim1, xlim2, ylim2] = deal(0,1,1,3); %%2 parameter
%[xlim3, ylim3, xlim4, ylim4] = deal(0,1,1,3); %%2 parameter

%[xlim1, ylim1, xlim2, ylim2] = deal(0,1,1,3); %%2 parameter
%[xlim3, ylim3, xlim4, ylim4] = deal(0,1,1,3); %%2 parameter
%[xlim5, ylim5, xlim6, ylim6] = deal(0,1,1,3); %%2 parameter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (parameter == 3)
    RA1=int(int(R,x,xlim1, xlim2),y,ylim1,ylim2);
    RA2=int(int(R,x,xlim3, xlim4),y,ylim3,ylim4);
    RA3=int(int(R,x,xlim5, xlim6),y,ylim5,ylim6);
    [a1sol,a2sol,a3sol]=solve(RA1,RA2,RA3, a1,a2,a3)
    double( [a1sol,a2sol, a3sol]);
    u=double(subs(u,{x,y,a1,a2,a3},{point_x1,point_y1, double(a1sol), double(a2sol), double(a3sol)}))
    u=double(subs(u,{x,y,a1,a2,a3},{point_x2,point_y2, double(a1sol), double(a2sol), double(a3sol)}))
    u=double(subs(u,{x,y,a1,a2,a3},{point_x2,point_y3, double(a1sol), double(a2sol), double(a3sol)}))

elseif (parameter == 2)
    RA1=int(int(R,x,xlim1, xlim2),y,ylim1,ylim2);
    RA2=int(int(R,x,xlim3, xlim4),y,ylim3,ylim4);
    [a1sol,a2sol]=solve(RA1,RA2,a1,a2)
    double([ a1sol,a2sol])
    u=double(subs(u,{x,y,a1,a2,a3},{point_x1,point_y1, double(a1sol), double(a2sol), double(a3sol)}))
    u=double(subs(u,{x,y,a1,a2,a3},{point_x2,point_y2, double(a1sol), double(a2sol), double(a3sol)}))
    
elseif (parameter == 1)
    RA1=int(int(R,x,xlim1, xlim2),y,ylim1,ylim2);
    [a1sol]=solve(RA1,a1)
    vpa( [a1sol])
    %u=double(subs(u,{x,y,a1,a2,a3},{point_x1,point_y1, double(a1sol), double(a2sol), double(a3sol)}))
end
%% Cross Check with Exact function
syms u(x) x

u = (x^2+1)^0.5 ;
double(subs(u,{x}, 0.5))
