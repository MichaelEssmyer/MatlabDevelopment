import ezroc3.*

%all the data classes
[X,d] = cancer_dataset; %Type help cancer_dataset for more info 
w=X'\d(2,:)'; %Training/MSE linear model creation
y=X'*w; %Activation/testing
[X,Y,T,AUC] = perfcurve(d(2,:),y',1);
figure,plot(X,Y)%Visualize 
xlabel('False positive rate') 
ylabel('True positive rate')
title(['Clump thickness Figure 0: 2D ROC, AUC=' num2str(AUC)])
%.99128

%A- Find a subset of input variables for the linear regressor to see if a reduced input space performs better. 
%Test at least 5 subsets (including the full 9-dimensional input) and use ROC AUC as your measure of success.
%B- Keep the first half of the data for creating the linear regressor (training) and the second half for testing.
%Repeat the the above and report the AUCs. Summarize your observations.

%1a. Clump thickness
[X,d] = cancer_dataset;
w=X(1,:)'\d(2,:)'; %Training/MSE linear model creation
y=X(1,:)'*w; %Activation/testing
[X,Y,T,AUC] = perfcurve(d(2,:),y',1);
figure,plot(X,Y)%Visualize 
xlabel('False positive rate') 
ylabel('True positive rate')
title(['Uniformity of cell size Figure 1: 2D ROC, AUC=' num2str(AUC)])
%AUC = .90984
%1b. Clump thickness
[X,d] = cancer_dataset;
w=X(1,1:350)'\d(2,1:350)'; %Training/MSE linear model creation
y=X(1,1:350)'*w; %Activation/testing
[X,Y,T,AUC] = perfcurve(d(2,1:350),y',1);
figure,plot(X,Y)%Visualize 
xlabel('False positive rate') 
ylabel('True positive rate')
title(['Uniformity of cell size Figure 1: 2D ROC, AUC=' num2str(AUC)])
%AUC = .90063

%2a. Uniformity of cell size
[X,d] = cancer_dataset;
w=X(2,:)'\d(2,:)'; %Training/MSE linear model creation
y=X(2,:)'*w; %Activation/testing
[X,Y,T,AUC] = perfcurve(d(2,:),y',1);
figure,plot(X,Y)%Visualize 
xlabel('False positive rate') 
ylabel('True positive rate')
title(['Uniformity of cell size Figure 2: 2D ROC, AUC=' num2str(AUC)])
%AUC = .974
%2b. Uniformity of cell size
[X,d] = cancer_dataset;
w=X(2,1:350)'\d(2,1:350)'; %Training/MSE linear model creation
y=X(2,1:350)'*w; %Activation/testing
[X,Y,T,AUC] = perfcurve(d(2,1:350),y',1);
figure,plot(X,Y)%Visualize 
xlabel('False positive rate') 
ylabel('True positive rate')
title(['Uniformity of cell size Figure 2: 2D ROC, AUC=' num2str(AUC)])
%AUC = .96443

%3a. Uniformity of cell shape
[X,d] = cancer_dataset;
w=X(3,:)'\d(2,:)'; %Training/MSE linear model creation
y=X(3,:)'*w; %Activation/testing
[X,Y,T,AUC] = perfcurve(d(2,:),y',1);
figure,plot(X,Y)%Visualize 
xlabel('False positive rate') 
ylabel('True positive rate')
title(['Uniformity of cell shape Figure 3: 2D ROC, AUC=' num2str(AUC)])
%AUC = .97353
%3b. Uniformity of cell shape
[X,d] = cancer_dataset;
w=X(3,1:350)'\d(2,1:350)'; %Training/MSE linear model creation
y=X(3,1:350)'*w; %Activation/testing
[X,Y,T,AUC] = perfcurve(d(2,1:350),y',1);
figure,plot(X,Y)%Visualize 
xlabel('False positive rate') 
ylabel('True positive rate')
title(['Uniformity of cell shape Figure 3: 2D ROC, AUC=' num2str(AUC)])
%AUC = .96712

%4a. Marginal Adhesion
[X,d] = cancer_dataset;
w=X(4,:)'\d(2,:)'; %Training/MSE linear model creation
y=X(4,:)'*w; %Activation/testing
[X,Y,T,AUC] = perfcurve(d(2,:),y',1);
figure,plot(X,Y)%Visualize 
xlabel('False positive rate') 
ylabel('True positive rate')
title(['Marginal Adhesion Figure 4: 2D ROC, AUC=' num2str(AUC)])
%AUC = .89566
%4b. Marginal Adhesion
[X,d] = cancer_dataset;
w=X(4,1:350)'\d(2,1:350)'; %Training/MSE linear model creation
y=X(4,1:350)'*w; %Activation/testing
[X,Y,T,AUC] = perfcurve(d(2,1:350),y',1);
figure,plot(X,Y)%Visualize 
xlabel('False positive rate') 
ylabel('True positive rate')
title(['Marginal Adhesion Figure 4: 2D ROC, AUC=' num2str(AUC)])
%AUC = .8926

%5a. Single epithelial cell size
[X,d] = cancer_dataset;
w=X(5,:)'\d(2,:)'; %Training/MSE linear model creation
y=X(5,:)'*w; %Activation/testing
[X,Y,T,AUC] = perfcurve(d(2,:),y',1);
figure,plot(X,Y)%Visualize 
xlabel('False positive rate') 
ylabel('True positive rate')
title(['Single epithelial cell size Figure 5: 2D ROC, AUC=' num2str(AUC)])
%AUC = .92189
%5b. Single epithelial cell size
[X,d] = cancer_dataset;
w=X(5,1:350)'\d(2,1:350)'; %Training/MSE linear model creation
y=X(5,1:350)'*w; %Activation/testing
[X,Y,T,AUC] = perfcurve(d(2,1:350),y',1);
figure,plot(X,Y)%Visualize 
xlabel('False positive rate') 
ylabel('True positive rate')
title(['Single epithelial cell size Figure 5: 2D ROC, AUC=' num2str(AUC)])
%AUC = .91683

%6a. Bare nuclei
[X,d] = cancer_dataset;
w=X(6,:)'\d(2,:)'; %Training/MSE linear model creation
y=X(6,:)'*w; %Activation/testing
[X,Y,T,AUC] = perfcurve(d(2,:),y',1);
figure,plot(X,Y)%Visualize 
xlabel('False positive rate') 
ylabel('True positive rate')
title(['Single epithelial cell size Figure 6: 2D ROC, AUC=' num2str(AUC)])
%AUC = .94566
%6b. Bare nuclei
[X,d] = cancer_dataset;
w=X(6,1:350)'\d(2,1:350)'; %Training/MSE linear model creation
y=X(6,1:350)'*w; %Activation/testing
[X,Y,T,AUC] = perfcurve(d(2,1:350),y',1);
figure,plot(X,Y)%Visualize 
xlabel('False positive rate') 
ylabel('True positive rate')
title(['Single epithelial cell size Figure 6: 2D ROC, AUC=' num2str(AUC)])
%AUC = .92013

%7a. Bland chomatin
[X,d] = cancer_dataset;
w=X(7,:)'\d(2,:)'; %Training/MSE linear model creation
y=X(7,:)'*w; %Activation/testing
[X,Y,T,AUC] = perfcurve(d(2,:),y',1);
figure,plot(X,Y)%Visualize 
xlabel('False positive rate') 
ylabel('True positive rate')
title(['Single epithelial cell size Figure 7: 2D ROC, AUC=' num2str(AUC)])
%AUC = .94095
%7b. Bland chomatin
[X,d] = cancer_dataset;
w=X(7,1:350)'\d(2,1:350)'; %Training/MSE linear model creation
y=X(7,1:350)'*w; %Activation/testing
[X,Y,T,AUC] = perfcurve(d(2,1:350),y',1);
figure,plot(X,Y)%Visualize 
xlabel('False positive rate') 
ylabel('True positive rate')
title(['Single epithelial cell size Figure 7: 2D ROC, AUC=' num2str(AUC)])
%AUC = .93628

%8a. Normal nucleoli
[X,d] = cancer_dataset;
w=X(8,:)'\d(2,:)'; %Training/MSE linear model creation
y=X(8,:)'*w; %Activation/testing
[X,Y,T,AUC] = perfcurve(d(2,:),y',1);
figure,plot(X,Y)%Visualize 
xlabel('False positive rate') 
ylabel('True positive rate')
title(['Single epithelial cell size Figure 8: 2D ROC, AUC=' num2str(AUC)])
%AUC = .88974
%8b. Normal nucleoli
[X,d] = cancer_dataset;
w=X(8,1:350)'\d(2,1:350)'; %Training/MSE linear model creation
y=X(8,1:350)'*w; %Activation/testing
[X,Y,T,AUC] = perfcurve(d(2,1:350),y',1);
figure,plot(X,Y)%Visualize 
xlabel('False positive rate') 
ylabel('True positive rate')
title(['Single epithelial cell size Figure 8: 2D ROC, AUC=' num2str(AUC)])
%AUC = .89245

%9a. Mitoses
[X,d] = cancer_dataset;
w=X(9,:)'\d(2,:)'; %Training/MSE linear model creation
y=X(9,:)'*w; %Activation/testing
[X,Y,T,AUC] = perfcurve(d(2,:),y',1);
figure,plot(X,Y)%Visualize 
xlabel('False positive rate') 
ylabel('True positive rate')
title(['Single epithelial cell size Figure 9: 2D ROC, AUC=' num2str(AUC)])
%AUC = .71014
%9b. Mitoses
[X,d] = cancer_dataset;
w=X(9,1:350)'\d(2,1:350)'; %Training/MSE linear model creation
y=X(9,1:350)'*w; %Activation/testing
[X,Y,T,AUC] = perfcurve(d(2,1:350),y',1);
figure,plot(X,Y)%Visualize 
xlabel('False positive rate') 
ylabel('True positive rate')
title(['Single epithelial cell size Figure 9: 2D ROC, AUC=' num2str(AUC)])
%AUC = .71765

%%Summary:
%Using a single factor increased the total error and using half the dataset
%for each factor increased the error even more. This aboservation was
%consistent through every run.
