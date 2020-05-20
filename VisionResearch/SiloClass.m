clear
clc
close all

%%create user inputs
%%v = input('Total silo volume in cubic feet; ');
%%r = input('Cylinder radius in feet: ');
%%R = input('Sphere radius in feet: ');
%v = 120000;
%r =- 30;
%R=45;
%%intermediate calculations
%theta = asin(r/R);
%h = R*(1-cos(theta));
%Vcap = (1/3)*pi*h^2*(3*R-h);
%
%%calculate cylinder height
%H = (v-Vcap)/(pi*r^2);
%
%%display results
%%disp(H);
%
%fprintf('Cylinder height is %3.2f feet. \n',H);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%vo = input('Enter initial velocity in m/s: ');
%theta = input('Enter angle in degrees: ');
%g = 9.81;
%
%%calculations
%R = 2*vo^2*cosd(theta)*sind(theta)/g;
%tR = R/(vo*cosd(theta));
%
%%display outputs
%fprintf('Total distance travelled is %3.2f feet \n', R);
%fprintf('Total time travelled is %3.2f seconds \n', tR);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Define constants
H = 50;
h = 130;
x = [30:0.5:300];

%Angle calculations
thetatop = atan((H+h)./x);
thetabot = atan(h./x);
theta = thetatop - thetabot;

%Plotting
plot(x,theta);

%Find maximum theta, distance
[tMax, iMax] = max(theta)
xMax = x(iMax)


%output
fprintf('Maximum angle (%3.2f degrees) occurs at %3.2f feet from building \n',tMax*(180/pi), xMax);






