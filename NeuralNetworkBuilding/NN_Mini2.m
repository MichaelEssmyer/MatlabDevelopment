import ezroc3.*
%Review information about MATLAB?s internal dataset ?bodyfat_dataset? by typing ?help bodyfat_dataset?. 
[X,T] = bodyfat_dataset;
size(X)
size(T)

net = fitnet(15, 'trainbr');
view(net)

[net,tr] = train(net,X,T);

plotperform(tr)

testX = X(:,tr.testInd);
testT = T(:,tr.testInd);

testY = net(testX);

perf = mse(net,testT,testY)

Y = net(X);

plotregression(T,Y)

e = T - Y;

ploterrhist(e)

%Find correlation coefficient of each input with the output: 
%R = Correlation Coefficient
%P = pvalue

%1. Age (years)
[Rage,Page] = corrcoef(X(1,:),T);
% R = 0.2915
% P = 2.5221 e -06

%2. Weight (lbs)
[Rweight,Pweight] = corrcoef(X(2,:),T);
% R = 0.6124
% P = 2.4463 e -27
 
%3. Height (inches)
[Rheight,Pheight] = corrcoef(X(3,:),T);
% R = -0.0895
% P = 2.4731 e -27

%4. Neck circumference (cm)
[Rneck,Pneck] = corrcoef(X(4,:),T);
% R = 0.4906
% P = 1.1471 e -16

%5. Chest circumference (cm)
[Rchest,Pchest] = corrcoef(X(5,:),T);
% R = 0.7026
% P = 8.0854 e -39

%6. Abdomen 2 circumference (cm)
[Rabdomen,Pabdomen] = corrcoef(X(6,:),T);
% R = 0.8134
% P = 2.5221 e -06

%7. Hip circumference (cm)
[Rhip,Phip] = corrcoef(X(7,:),T);
% R = 0.6252
% P = 9.8190 e -29

%8. Thigh circumference (cm)
[Rthigh,Pthigh] = corrcoef(X(8,:),T);
% R = 0.5596
% P = 3.6129 e -22

%9. Knee circumference (cm)
[Rknee,Pknee] = corrcoef(X(9,:),T);
% R = 0.5087
% P = 5.4651 e -18

%10. Ankle circumference (cm)
[Rankle,Pankle] = corrcoef(X(10,:),T);
% R = 0.2660
% P = 1.8819 e -06

%11. Biceps (extended) circumference (cm)
[Rbicep,Pbicep] = corrcoef(X(11,:),T);
% R = 0.4933
% P = 7.3881 e -17

%12. Forearm circumference (cm)
[Rforearm,Pforearm] = corrcoef(X(12,:),T);
% R = 0.3614
% P = 3.4370 e -09

%13. Wrist circumference (cm)
[Rwrist,Pwrist] = corrcoef(X(13,:),T);
% R = 0.3466
% P = 1.6003 e -08

%Which inputs are more suitable for a multivariate linear regression?
%Abdomen has the greatest correlation coefficient and the lowest pvalue
%Chest has the second greatest correlation coefficient and higher pvalue
%Hip has the third greatest correlation coefficient and an even higher pvalue
%Weight has the fourth greatest correlation coefficient and an even higher pvalue
%Height is the worst choice for a linear regression

%%%%%%%%%%%%%%%%%%%%Could not figure this part out....
%Find that linear regression (i.e. the linear mixture coefficients) 
%by using those variables that have better correlation coefficient 
%(see your previous assignment/mini project 1). 
%tbl = table(X(6,:),X(5,:),X(7,:),X(2,:),X(3,:),'VariableNames',{'Abdomen','Chest','Hip', 'Weight', 'Height'});
%lme = fitlme(tbl,'X~Abdomen+(1|Chest)+(Hip-1|Weight)+(Hip-1|Height)');

%lme = fitlmematrix(X(6,:),X(5,:),X(7,:),X(2,:),X(3,:));
%lme.CoefficientCovariance

% [X,d] = bodyfat_dataset;
% w=X(1,:)'\d(1,:)'; %Training/MSE linear model creation
% y=X(1,:)'*w; %Activation/testing
% [X,Y,T,AUC] = perfcurve(d(1,:),y',1);
% figure,plot(X,Y)%Visualize 
% xlabel('False positive rate') 
% ylabel('True positive rate')
% title(['This is Age Figure 1: 2D ROC, AUC=' num2str(AUC)])
%AUC = 

%Now we will use different MLPs and compare their results to those of the best baseline linear model found above:
%Here you will be using 4/5 - 1/5 (train/validation) data partition for the neural network regression. 
%For each requested task, reset (using the comment ?init?) and 
%retrain the neural network at hand 10 times and report on both mean and variance on training, 
%validation (if applicable) MSEs for all folds as follows:
%Description
%[trainInd,valInd,testInd] = divideblock(Q,trainRatio,valRatio,testRatio) separates targets into three sets: training, validation, and testing. It takes the following inputs:
%Q	
%Number of targets to divide up.

%trainRatio	
%Ratio of targets for training. Default = 0.7.

%valRatio	
%Ratio of targets for validation. Default = 0.15.

%testRatio	
%Ratio of targets for testing. Default = 0.15.

%and returns

%trainInd	
%Training indices

%valInd	
%Validation indices

%testInd	
%Test indices
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Create a simple 10 node one hidden layer regression MLP using the command ?fitnet?. 
%Use the network with its default settings except for training, (early stopping) validation, 
%and test data partitioning ratios, which you shall set at 80%, 20%, and 0 % respectively.
[trainInd,valInd,testInd] = divideblock(X, .8, .2,0);
net = fitnet(10,'trainbr');
view(net)

[net,tr] = train(net,X,T);

plotperform(tr)

testX = X(:,tr.testInd);
testT = T(:,tr.testInd);

testY = net(testX);
disp('10 hidden networks with train and validation ratios to 80% and 20%');

perf = mse(net,testT,testY)

Y = net(X);

plotregression(T,Y)

e = T - Y;

ploterrhist(e)
%Find the mean and variance of MSEs for training and validation portions of the dataset for all the 10 repetitions x 5 folds.
%Change network size to 2 nodes and then to 50 nodes and repeat the above. 
%Next change train and validation ratios to 40% and 60% for each of the aforesaid cases. 
[trainInd,valInd,testInd] = divideblock(252, .4, .6, 0);
net = fitnet(2,'trainbr');
view(net)

[net,tr] = train(net,X,T);

plotperform(tr)

testX = X(:,tr.testInd);
testT = T(:,tr.testInd);

testY = net(testX);

disp('2 hidden networks with train and validation ratios to 40% and 60%');
perf = mse(net,testT,testY)

Y = net(X);

plotregression(T,Y)

e = T - Y;

ploterrhist(e)
%%%%%%%%%%%%%%%%%%%%%
net = fitnet(50,'trainbr');
view(net)

[net,tr] = train(net,X,T);

plotperform(tr)

testX = X(:,tr.testInd);
testT = T(:,tr.testInd);

testY = net(testX);
disp('50 hidden networks with train and validation ratios to 40% and 60%');
perf = mse(net,testT,testY)

Y = net(X);

plotregression(T,Y)

e = T - Y;

ploterrhist(e)
%Tabulate/show and explain your observations.
%For the last case have regularization set at 0.1 and 0.5 . Show and explain your observations
%Submit your results as a powerpoint along all your ORIGINAL code. Don't forget to include your linear baseline numbers. Due by Friday night October 5 electronically via blackboard ONLY. Counts as one of your semester long projects (see your syllabus for details).
[trainInd,valInd,testInd] = divideblock(252, .1, .5, .4);
net = fitnet(2,'trainbr');
view(net)

[net,tr] = train(net,X,T);

plotperform(tr)

testX = X(:,tr.testInd);
testT = T(:,tr.testInd);

testY = net(testX);
disp('2 hidden networks with train and validation ratios to 10% and 50%');

perf = mse(net,testT,testY)

Y = net(X);

plotregression(T,Y)

e = T - Y;

ploterrhist(e)


