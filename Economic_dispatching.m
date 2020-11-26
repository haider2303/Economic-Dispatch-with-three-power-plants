clc 
clear all

%------------------- Defining the parameters ----------------------------%
syms p1 
syms p2 
syms p3
power = 0;
syms lambda

%------------------ Input for first differential equation ---------------%
equation =  inputdlg('Enter the three constants space seperated for power plant equation:',...
             'Power Plant 1', [1 50]);
equation_constant  =  str2num(equation{1});    
power_plant1 = equation_constant(1) + equation_constant(2)*p1 + equation_constant(3)*(p1.^2);

%------------------- Input for second differential equation --------------%
equation =  inputdlg('Enter the three constants space seperated for power plant equation:',...
             'Power Plant 2', [1 50]);
equation_constant  =  str2num(equation{1}); 
power_plant2 = equation_constant(1) + equation_constant(2)*p2 + equation_constant(3)*(p2.^2);

% ------------------ Input for third differential equation ---------------%
equation =  inputdlg('Enter the three constants space seperated for power plant equation:',...
             'Power Plant 3', [1 50]);
equation_constant  =  str2num(equation{1});    
power_plant3 = equation_constant(1) + equation_constant(2)*p3 + equation_constant(3)*(p3.^2);

%-------------------- Input of total fuel costs --------------------------%
fuel_costs = inputdlg({'Fuel cost1','Fuel cost2','Fuel cost3'},...
              'Fuel Costs', [1 50; 1 12; 1 7]);
fuel_cost1 = str2num(fuel_costs{1});
fuel_cost2 = str2num(fuel_costs{2});
fuel_cost3 = str2num(fuel_costs{3});

total_power= input('Enter Total power:');
power = p1 + p2 +p3 == total_power;


total_fuel1 = fuel_cost1*power_plant1;
total_fuel2 = fuel_cost2*power_plant2;
total_fuel3 = fuel_cost3*power_plant3;

differential_1 = diff(total_fuel1,p1) == lambda;
differential_2 = diff(total_fuel2,p2) == lambda;
differential_3 = diff(total_fuel3,p3) == lambda;

%--------------------- Langrange Multiplier -----------------------------%
sol = solve(differential_1 ,differential_2 ,differential_3, power)
P1 = double(sol.p1)
P2 = double(sol.p2)
P3 = double(sol.p3)



