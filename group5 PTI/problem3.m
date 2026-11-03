clc;
clear;
close all;
 
% Maximize total garment production
% Negative coefficients convert maximization to minimization
f = [-1 -1];
 
A = [3 2;
     2 4];
b = [120;
     160];
 
lb = [0 0];
 
% Solve the linear programming problem
[xopt, fval] = linprog(f,A,b,[],[],lb,[]);
 
disp('Type A garments, type B garments:');
disp(xopt);
disp('Maximum total garments:');
disp(-fval);
 
% Plot the constraint boundaries
t = linspace(0,60,300);
yFabric = (120 - 3*t)/2;
yLabour = (160 - 2*t)/4;
 
figure;
hold on;
xlim([0 60]); ylim([0 60]);
plot(t,yFabric,'r','LineWidth',2);
plot(t,yLabour,'b','LineWidth',2);
plot(xopt(1),xopt(2),'ko','MarkerFaceColor','y','MarkerSize',8);
xlabel('Type A garments (x)');
ylabel('Type B garments (y)');
title('Problem 3: Garment Production Maximization');
legend('Fabric constraint','Labour constraint','Optimal point','Location','northeast');
grid on;
hold off;


