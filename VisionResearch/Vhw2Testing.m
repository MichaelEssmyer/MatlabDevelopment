clear all
close all
clc

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

% Compute the SIFT feature
[f1,d1] = vl_sift(im2single(img1_gray));
[f2,d2] = vl_sift(im2single(img2_gray));

[matches, scores] = vl_ubcmatch(d1,d2);
numMatches = size(matches,2) ;

X1 = f1(1:2,matches(1,:)) ; X1(3,:) = 1;
X2 = f2(1:2,matches(2,:)) ; X2(3,:) = 1;

for t = 1:100
  % estimate homograpyh
  subset = vl_colsubset(1:numMatches, 4) ;
  A = [] ;
  for i = subset
    A = cat(1, A, kron(X1(:,i)', vl_hat(X2(:,i)))) ;
  end
  [U,S,V] = svd(A) ;
  H{t} = reshape(V(:,9),3,3) ;

  % score homography
  X2_ = H{t} * X1 ;
  du = X2_(1,:)./X2_(3,:) - X2(1,:)./X2(3,:) ;
  dv = X2_(2,:)./X2_(3,:) - X2(2,:)./X2(3,:) ;
  ok{t} = (du.*du + dv.*dv) < 6*6 ;
  score(t) = sum(ok{t}) ;
end

[score, best] = max(score) ;
H = H{best} ;
ok = ok{best} ;

dh1 = max(size(img2,1)-size(img1,1),0) ;
dh2 = max(size(img1,1)-size(img2,1),0) ;

figure(1) ; clf ;
subplot(2,1,1) ;
imagesc([padarray(img1,dh1,'post') padarray(img2,dh2,'post')]) ;
o = size(img1,2) ;
line([f1(1,matches(1,:));f2(1,matches(2,:))+o], ...
     [f1(2,matches(1,:));f2(2,matches(2,:))]) ;
title(sprintf('%d tentative matches', numMatches)) ;
axis image off ;

subplot(2,1,2) ;
imagesc([padarray(img1,dh1,'post') padarray(img2,dh2,'post')]) ;
o = size(img1,2) ;
line([f1(1,matches(1,ok));f2(1,matches(2,ok))+o], ...
     [f1(2,matches(1,ok));f2(2,matches(2,ok))]) ;
title(sprintf('%d (%.2f%%) inliner matches out of %d', ...
              sum(ok), ...
              100*sum(ok)/numMatches, ...
              numMatches)) ;
axis image off ;

drawnow ;