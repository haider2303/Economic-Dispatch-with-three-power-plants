clc 
clear all
syms p1 
syms p2 
syms p3
p = 0;
syms L

a = input("Enter total power:");

h1 = 510 + 7.2*p1 + 0.00142*p1.^2;
h2 = 310 + 7.85*p2 + 0.00194*p2.^2;
h3 = 78 + 7.97*p3 + 0.00482*p3.^2;

p = p1+p2+p3==a;

fuel_c1 = 1.1;
fuel_c2 = 1.0;
fuel_c3 = 1.0;

f1 = fuel_c1*h1;
f2 = fuel_c2*h2;
f3 = fuel_c3*h3;

d1 = diff(f1,p1)==L;
d2 = diff(f2,p2)==L;
d3 = diff(f3,p3)==L;

sol = solve(d1,d2,d3,p);
P1 = double(sol.p1)
P2 = double(sol.p2)
P3 = double(sol.p3)


