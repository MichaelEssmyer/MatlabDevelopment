clear
clc
close all
%Define initial variables
vo = 5;
theta = 30;
g = 9.809;
%Perform calculations
%R = 2*((vo)^2*cos(theta)*sin(theta))/g;
%vox = vo*cosd(theta);
%tR = R/vox;
%Thermal Expansion
To = 120;
Ts  =38;
t = 3;
k=.45;
T=Ts+(To - Ts)*exp(-k*t);
T
%output in cmd windw
R
tR

t = [0:0.1:4];
T=Ts+(To - Ts)*exp(-k*t);
T
