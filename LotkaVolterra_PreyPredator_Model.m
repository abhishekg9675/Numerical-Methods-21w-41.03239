%type lotka
sym y
lotka1 = y*diag([1 - 0.01*y(2), -1 + 0.02*y(1)]);

t0 = 0;
tfinal = 15;
y0 = [2; 20];   
% [t,y] = ode45(@lotka,[t0 tfinal],y0);
% plot(t,y)
% title('Predator/Prey Populations Over Time')
% xlabel('t')
% ylabel('Population')
% legend('Prey','Predators','Location','North')

[t,y] = ode45(@lotka1,[t0 tfinal],y0);
plot(t,y)
title('Predator/Prey Populations Over Time')
xlabel('t')
ylabel('Population')
legend('Prey','Predators','Location','North')