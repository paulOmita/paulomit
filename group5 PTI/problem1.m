 clc;
clear;
close all;
 
% Maximize profit: linprog performs minimization
f = [-12000 -10000];
 
% Resource constraints: A*x <= b
A = [2 1;
     1 2];
b = [100;
     80];
 
% Lower bounds for production quantities
lb = [0 0];
 
% Solve the linear programming problem
[xopt, fval] = linprog(f,A,b,[],[],lb,[]);
 
% Display the optimal solution
disp('Cotton shirts, polyester shirts:');
disp(xopt);
disp('Maximum profit (UGX):');
disp(-fval);
 
% Plot constraints and feasible region
t = linspace(0,60,300);
yLabour = 100 - 2*t;
yMaterial = (80 - t)/2;
 
figure;
hold on;
xlim([0 60]); ylim([0 60]);
plot(t,yLabour,'r','LineWidth',2);
plot(t,yMaterial,'b','LineWidth',2);
plot(xopt(1),xopt(2),'ko','MarkerFaceColor','y','MarkerSize',8);
xlabel('Cotton shirts (x)');
ylabel('Polyester shirts (y)');
title('Problem 1: Profit Maximization');
legend('Labour constraint','Raw material constraint','Optimal point','Location','northeast');
grid on;
hold off;

