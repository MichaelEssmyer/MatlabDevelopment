%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% vladSiftEncoding()
%   ref:  Herve Jegou, Matthijs Douze, Cordelia Schmid:
%    Improving Bag-of-Features for Large Scale Image Search, IJCV vol. 87(3): 316-336 (2010)
% input:
%   - sift: n x 128 input
%   - codebook: m x 128 code book
% output:
%   - vc: m x 128 aggregation via VLAD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%function [vc]=vladSiftEncoding(sift, codebook)
function [vc]=vladSiftEncoding(sift, codebook)
dbg=1;
if dbg
    if (1) % init VL_FEAT, only need to do once
        run('vlfeat-0.9.20/toolbox/vl_setup.m');
    end
    im = imread('p1.jpg');
    [f, sift] = vl_sift(single(rgb2gray(im))); sift = single(sift');
    kd=12; nc=6;
    [indx, codebook] = kmeans(double(sift(:,1:kd)), nc);
    % make sift # smaller    
    sift = double(sift(1:30,1:kd));
end
[n, kd]=size(sift);
[m, kd]=size(codebook); 

% compute assignment
dist = pdist2(codebook, sift); 

[minv, offs]=min(dist); 
% hard assignment
assignment = zeros(m, n); 
for k=1:n 
    assignment(offs(k), k) = 1; 
end

vc=vl_vlad(sift', codebook', assignment); 

if dbg
    figure(41); colormap(gray); 
    subplot(2,2,1); imshow(im); title('image'); 
    subplot(2,2,2); imagesc(dist); title('m x n distance'); 
    subplot(2,2,3); imagesc(indx); title('m x n assignment'); 
    subplot(2,2,4); imagesc(reshape(vc, [m, kd]));title('vlad code'); 
end

return;