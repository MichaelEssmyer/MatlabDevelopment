clear %variables in memory
clc %command window
close all %close any opened files

r1 = 0:4:28; 
r2 = 69:-1:62;
r3 = 1.4:-0.3:-0.7;

A = [r1; r2; r3];

a= [2 -1 0 6];
b= [-5 20 12 -3];
c = [10 7 -2 1];

r = [a;b; c]%r[abc]
c = [a' b' c']%c[abc]
