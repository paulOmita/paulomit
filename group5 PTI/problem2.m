clc;
clear;
close all;
 
% Minimize total production cost
f = [4000 5000];
 
% linprog uses A*x <= b, so convert >= constraints
A = [-1 -1;
     -2 -3];
b = [-40;
     -100];
 
lb = [0 0];
 
% Solve the linear programming problem
[xopt, fval] = linprog(f,A,b,[],[],lb,[]);
 
disp('Standard fabric, premium fabric:');
disp(xopt);
disp('Minimum cost (UGX):');
disp(fval);
 
% Plot the constraint boundaries
t = linspace(0,60,300);
yDemand = 40 - t;
yQuality = (100 - 2*t)/3;
 
figure;
hold on;
xlim([0 60]); ylim([0 60]);
plot(t,yDemand,'r','LineWidth',2);
plot(t,yQuality,'b','LineWidth',2);
plot(xopt(1),xopt(2),'ko','MarkerFaceColor','y','MarkerSize',8);
xlabel('Standard fabric units (x)');
ylabel('Premium fabric units (y)');
title('Problem 2: Production Cost Minimization');
legend('Demand constraint','Quality constraint','Optimal point','Location','northeast');
grid on;
hold off;
