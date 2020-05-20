clear all
close all
clc

% Compute Image Features, 
% create a matlab/python function that compute n x d features by calling vl_feat HoG, 
% DSIFT and SIFT functions (notice that vl_feat also has Python version), 
% implementing the following function:
%
%  im - input images, let us make them all grayscale only, so it is a  h x w matrix
%  opt.type = {?hogf?, ?sift?, ?dsft?} for hog, sift and densesift
%  f - n x d matrix containing n features of d dimension
% function [f]=getImageFeatures(im, opt)
run('vlfeat-0.9.21/toolbox/vl_setup')
vl_version verbose

% Load images
img1 = imread('p1.jpg');
% figure;
% imshow(img1);

img2 = imread('p2.jpg');
% figure;
% imshow(img2);

% Convert to grayscale
img1_gray = rgb2gray(img1);
img2_gray = rgb2gray(img2);


% Compute VLAD and Fisher Vector models of image features, 
% for this purpose you need to first compute a Kmeans model for HoG, DenseSIFT and SIFT. 
% Use the CDVS data set given as both training and testing for convenience 
% (not the right way in research though, should use a different data set, 
% say FLICKR MIR, or ImageNet), implementing the following functions:
% f - n x d matrix containing training features from say 100 images. 
% k - VLAD kmeans model number of cluster 
% kd - desired dimension of the feature 
% vlad_km - VLAD kmeans model
% A - PCA projection for dimension reduction
function [vlad_km, A]=getVladModel(f, kd, k)
% PCA dimension reduction of the feature
[A,s,lat]=princomp(f); 
f0 = f*A(:,1:kd); % this is the feature with desired d-dimensions
end
% f - n x d matrix containing n features from say 100 images. 
% k - number of GMM components 
% kd - desired lower dimension of the feature
% fv_gmm - FisherVector GMM model:
%         fv_gmm.m - mean, fv_gmm.cov - variance, fv_gmm.p - prior
% A - PCA for dimension reduction
function [fv_gmm, A]=getFisherVectorModel(f, kd, k)
[A,s,lat]=princomp(f); 
f0 = f*A(:,1:kd); % this is the feature with desired d-dimensions

%hint from last year?s gmm training with a set of dimensions and number of clusters

%train SIFT PCA GMM
doTrainGMM=0;
if doTrainGMM
   load data/hw-2-data.mat;
   [A, s, lat] = princomp(double(sift_gmm_km_train));
   figure(21); grid on; hold on; plot(lat, '.-');
   
   kd=[16,24]; nc = [16,32,64,96];
    t0cputume;
    for j=1:length(kd)
        for k=1:length(nc)
            fprintf('\n t=%1.2f: GMM: kd(%d)=%d, nc(%d)=%d',cputime-tO, j, kd(j), k, nc(k));
            x = double(sift_gmm_km_train)*A(:,1:kd(j));
            [gmm(j,k).m, gmm(j,k).cov, gmm(j,k).p]=vl_gmm(x', nc(k), 'MaxNumIterations', 30);
        end
    end
    save data/hw2-A-gmm-kd-16-24-nc-16-32-64-96.mat A gmm;
else
    load data/hw2-A-gmm-kd-16-24-nc-16-32-64-96.mat A gmm;
end
end
%Compute VLAD and Fisher Vector Aggregation of Images, 
%from the given VLAD and FV models, 
%implementing the following functions. 
%Notice that the feature nxd f need to be projected 
%to the desired lower dimension via, f0=f*A(:,1:kd), 
%to match the VLAD model dimension before calling this function. 

% f - n x d matrix containing a feature from an image by calling f=getImageFeature(im,.. 
% vlad_km - VLAD kmeans model
function [vlad]=getVladAggregation(vlad_km, f)
end
% f - n x d matrix containing a feature from an image by calling f=getImageFeature(im,.. 
% fv_gmm - GMM Model from features, has m, cov, and p. 
function [fv]=getFisherVectorAggregation(fv_gmm, f)
end


% Now benchmarking the TPR-FPR performance of various 
% feature and aggregation scheme performance against the mini CDVS data set: 
% https://app.box.com/s/oea1ng52b3ghac813qgry6v6xds3rpzy.  
% For HoG feature, let us have kd=[8, 16] and number of cluster nc=[32, 64] for VLAD 
% and FV models, and for the SIFT and DenseSIFT features, let us have kd=[24,48], nc=[32, 64, 96]. 
% So for each image, we will have 4 + 6 = 10 different feature + aggregation representations. 
% For the total of N images in the mini CDVS dataset, 
% we have M=N*(N-1)/2 total image pairs, and the matching pairs 
% ground truth are given, we only care about the first 100 matching pairs and their associated images.  
% let us use the Euclidean distance to on those features to compute the TPR-FPR ROCs and 
% find out which one have the best performance. 
% Last year?s plots are attached below for example, 
% you only need to plot the last row for 10 feature-aggregation combinations.


