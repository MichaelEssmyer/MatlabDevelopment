%Michael Essmyer HW 2
import ezroc3.*

%import the dataset into x and the ground truth into t
[x,t]= cancer_dataset;
%x = Dataset
%T = Ground Truth
  
%View Cancer Dataset  
%disp(x)
%disp(t)

%plot 9 ROC curves (one for each variable or row)
%2. Uniformity of cell size .974
ezroc3(x(2,:),t(2,:));

%3. Uniformity of cell shape .97353
ezroc3(x(3,:),t(2,:));

%6. Bare nuclei .94566
ezroc3(x(6,:),t(2,:));

%7. Bland chomatin .94095
ezroc3(x(7,:),t(2,:));

%5. Single epithelial cell size .92189
ezroc3(x(5,:),t(2,:));

%1. Clump thickness .90984
ezroc3(x(1,:),t(2,:));

%4. Marginal Adhesion .89566
ezroc3(x(4,:),t(2,:));

%8. Normal nucleoli .88974
ezroc3(x(8,:),t(2,:));

%9. Mitoses .71014
ezroc3(x(9,:),t(2,:));


