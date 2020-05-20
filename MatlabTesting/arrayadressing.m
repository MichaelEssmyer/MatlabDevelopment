clear
clc
close all

%1
Afirst = [3:4:51];
Asecond(1:4) = Afirst(1:4);
Asecond(5:7) = Afirst(11:13);

%2
B = [15 12 9 6 3; 2 4 6 8 10; 6 12 18 24 30];
%6 element column vector contians c2 and c4 of B
r13 = B(:,2);
r46 = B(:,4);
r6 = [r13;r46];

%5 element column vector contains r3 of B
r5 = B(3,:)';

%3
%4 by 7 matrix A
A = [.01:0.1:0.7;14:-2:2;1 1 1 1 0 0 0 ; 3:3:21];

%3 by 4 matrix from roxs 1 through 3 and columns 1 through 4 of A
a34 = A(1:3,1:4)
%2 by 7 matrix from rows 2 through 3 and columns 1 through 5 of A
a2 = A(1:2,1:5)