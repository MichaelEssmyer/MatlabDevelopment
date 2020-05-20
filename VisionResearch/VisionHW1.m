rootFolder = 'cifar10Train';
categories = {'Deer','Dog','Frog','Cat'};
imds = imageDatastore(fullfile(rootFolder, categories), 'LabelSource', 'foldernames');
imds.ReadFcn = @readFunctionTrain;


im1 = imread('p1.jpg');
im2 = imread('p2.jpg');

imhist(im1);
%color histogram
nH=8; nS=4; nV=4;

im1 = rgb2hsv(im1);
[h, w, dim]=size(im1);
x = reshape(im1,[h*w,3]);

%centroids
c1=[1:nH]*(1/(nH+1));
c2=[1:nS]*(1/(nS+1));
c3=[1:nV]*(1/(nV+1));

[h1, v1]=hist(x(:,1), c1);
[h2, v2]=hist(x(:,2), c2);
[h3, v3]=hist(x(:,3), c3);

figure(2);
subplot(1,3,1); bar(v1, h1); xlabel('hue');
subplot(1,3,2); bar(v2, h2); xlabel('saturation');
subplot(1,3,3); bar(v3, h3); xlabel('value');
%%%%%%%%%%%%%%%%%%%%%% End of Color Histogram

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nColor = 16;
[h, w, dim] = size(im);
x = double(reshape(im, [h*w, dim]));
%%centroids from k-means
[indx, c]= kmeans(x, nColor);
%%COUNT
for k=1 : nColor
	color_cnt(k) = length(find(indx==k));
end
color_cnt = color_cnt./(sum(color_cnt));

%%Quantize image
figure(21);
subplot(2,2,1); imshow(im);
subplot(2,2,3); bar(color_cnt); grid on; title('color distribution');
subplot(2,2,2); plot3(c(:,1), c(:,2), c(:,3), '*'); grid on; hold on;
xlabel('red'); ylable('green'); zlabel('blue');

%%%%%% Image similarity
[d]=getHSVDistance(im1, im2, c);
