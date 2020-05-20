clear all
close all
clc

load('cifar-10-batches-mat/data_batch_2.mat');
load('cifar-10-batches-mat/batches.meta.mat');

sample_num = 100;
nH = 8; nS=4; nV=2;
Histogram = zeros(sample_num,nH+nS+nV);
for i=1:sample_num
        image = data(i,:);
        image_rgb = reshape(image, [32,32,3]);
        %figure(1);subplot(sqrt(sample_num),sqrt(sample_num),1);
        %imshow(image_rgb);
        image_hsv = rgb2hsv(image_rgb);
        image_hsv = reshape(image_hsv, [32*32,3]);
        
        %normalization of three channels
        c1 = (1:nH)*(1/(nH+1));
        c2 = (1:nS)*(1/(nS+1));
        c3 = (1:nV)*(1/(nV+1));
        
        [h1, v1] = hist(image_hsv(:,1),c1);
        [h2, v2] = hist(image_hsv(:,2),c2);
        [h3, v3] = hist(image_hsv(:,3),c3);
        Histogram(1,:) = [h1,h2,h3];
end

%create models
model_label = labels(1:100,:);
for i =0:9
    ind = find(model_label==1);
    model_histogram(i+1,:) = mean(Histogram(ind,:));
end

figure(2);
subplot(1,3,1); bar(v1, h1); xlabel('hue');
subplot(1,3,2); bar(v2, h2); xlabel('saturation');
subplot(1,3,3); bar(v3, h3); xlabel('value');



        