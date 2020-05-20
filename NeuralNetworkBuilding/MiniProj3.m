import ezroc3.*
% TDNN Gesture Recognition
import Gesture Data.*

% Your datasets1 have data from 4 movements, each repeated 3 times by each of the six subjects as follows:
% Four movement types (all with approximate 1Hz frequency, 10 repetitions/record, and within a vertical XZ plane parallel to, and in front of the subject?s torso):
% 1-Clockwise (CW) circle 2-CW triangle
% 3-Linear, left to right 4-Linear, up-down
% Signal sampling rate: 30Hz
% Recoding device: on-wrist wearable with 3-axis accelerometer
% Overview:
% For subject specific calculations: Given three rounds of data, use a 3-fold cross validation and report on the ROC (copy the curve, quote its area or AUC, and equal error rate EER use ezroc3) as described below. To do so, first, produce all classifier output matrices as follows.
% Fold 1: (subject specific) for all N movements (N=4), use run 1 and 2 for training the classifier, and then for each subject create NxN classifier output matrices (classifier continuous outputs without thresholding, a 4x4 decision profile matrix) using run 3 for each of the 6 subjects as testing.
% Fold 2: repeat using run 2 and 3 for training, 3 for testing.
% Fold 3: repeat using run 1 and 3 for training, 2 for testing.
% This should give you 3 classifier output matrices for each subject: H1, H2, and H3 (one for each fold). Report on overall AUC and EER, and show 3-fold cross-validation ROC graph FOR EACH SUBJECT, using ezroc3(cat(3, H1, H2, H3)).
% Note: the diagonal of H matrices should be mostly positive, and off-diagonal elements should be mostly negative.
% For subject independent calculations: since we have 6 subjects, use a similar but 6- fold cross validation process where you train on 5 subjects and test on the sixth (use 3 runs for each), and cycle trough 6 times and provide the 6-fold cross validation ROC curve accordingly.
% Specifics:
% Your inputs are the original x(t),z(t) signals of the 4 movements. First, produce all dynamic NN output matrices as follows (1 hidden layer, use timedelaynet and read its help file). Use ?trainbr?. 
% This part is compute-intensive and time-consuming, so you need to start early. Read help files for TDNN very carefully, following their examples and the dynamic NN samples I showed you in class. Validation based early stopping is not
% 1 Many thanks to Fahad Moiz for the recordings and sorting them into these excel files.
%     
%  TDNN Gesture Recognition
% required for this homework since we?re using Bayesian regularization via ?trainbr?, but do optimize network size and memory depth as follows2.
% Pre-fold 1: First, using subject 2, use x(t) and z(t) from run 1 for neural net training, and run 2 (validation) for choosing configuration via ROC AUC. 
% Use a TDNN (timedelaynet) with 4 outputs (+/-1 target signals with the same length as your x(t),z(t) for class/not- class). 
% Try 3 different hidden layer sizes and 3 different input delay line depths. As the starting point for the number hidden nodes, use 1/2 the size of input delay line. 
% Compute the ensuing nine validation ROCs and their AUCs by stacking validation outputs of 5 initialized trainings (e.g. neti=init(net)) into a 4x4x5 H using ?cat? command, and don?t forget to save every trained network first! 
% Train for 100 (?trainbr?) with no early stopping (i.e. set the train ratio to 1 and test and validation to 0). Choose the best hidden layer and tapped delay line sizes based on highest validation ROC AUC before proceeding. 
% In interest of time, use this best configuration for all the ensuing calculations. Report on your observations. Note: to convert the output of the dynamic neural nets from a time signal into a single value, replace each signal segment with its average. 
% Don?t forget to use sequential rather than concurrent format when dealing with dynamic NNs.
% Subject Specific:
% Repeat the above and find the three H matrices and stack them for three fold validation by:
% Fold 2: use run 2 and 3 for training, 1 for testing.
% Fold 3: use run 1 and 3 for training, 2 for testing.
% You will show 6 ROCs and their AUC & EERs as a result (one ROC per subject). No repeated initialization necessary (though you may optionally try the process say 3-5 times and show us the best result).
% Subject Independent: since we have 6 subjects, use a similar but 6-fold cross validation process where you train on 5 subjects and test on the sixth, and cycle trough 6 times and provide the training ROC curve accordingly. In this case use all the 3 runs for each subject.
% Report on overall AUC and EER, and show ROC graph using ezroc3(cat(3, H1, H2, .... H6)). Note: the diagonal of H matrices should be mostly positive.
% 2 You may also use the signal processing toolbox command decimate(x,n) to down-sample your signal x, n times before using them should your computers freeze due to memory limitations, but usually not required with decently specs?ed PCs.
%  Fold 1: use the above best TDNN configuration and create 6 individual output ?H? matrices using run 3 as test set for each of the 6 subjects (concatenate run 1 and 2 x(t) and z(t) into twice-long signals for training). Use no early stopping/validation. 
% That is, using NN?s 4 outputs issued for 4 movements, once for each subject, to get 6 4x4x3 matrices. Again, you need to collapse each output time signal snippet relating to the period of execution of each movement into a scalar by averaging.
%     
% TDNN Gesture Recognition
% Bonus: create committees through sum rule (H-matrix averaging). Investigate committees for 6 subject-specific and the subject-independent cases (remember, the more diverse the committee, the better). 
% Max 5 bonus points per each case upon successful completion (i.e. the resulting committee AUC is better than that of the best constituent). Total maximum of 10 bonus points.
% Deliverables: a power point, and all requested information above, including test ROC, AUC, EER, and your observations and conclusions + your code + trained NN objects.
% Upload your code, objects, and PPT in a zip file with names as a part of filename (abbreviate if too long) on Blackboard. Deadline is Monday October 29 by midnight.
% Note: given the square decision profile matrices, the ezroc3 does not require target values T as a second input.