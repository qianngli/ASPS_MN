close all
clear 
clc

%% load data
load PaviaU;
img_src = paviaU;
clear paviaU;

load PaviaU_gt;
img_gt = paviaU_gt(:);
clear paviaU_gt;

[W, H, L]=size(img_src);
img_src = double(img_src);
img_src = reshape(img_src, W * H, L);

%% band selection
tic
K = 6; % the number of selected bands K

for i = 1 : L
    img(:, i) = img_src(:,i) / max(max(img_src(:,i)));
end
    
D = get_D(img);
P = ASPS(D, L, K);

%H = Entrop(img);  %choose information entropy to select band in each subcube
N = NoiseLevel(img, W, H, L);

for i = 1 : K - 1
     if i == 1
        index = 1;
    else
        index = P(i) + 1;
    end
     %[~, b] = max(H(index : P(i+1)));   
     [~, b] = min(N(index : P(i + 1)));
    Y(i )= b + index - 1;
end
toc
Y % that is bandSet

%% evaluation
newData = img_src(:, Y)';
trnPer = 0.1; % 10% samples from each class based on selected bands are selected 
clsCnt = length(unique(img_gt)) - 1; 
[trnData, trnLab, tstData, tstLab] = TrainTest(newData', img_gt, trnPer, clsCnt);

tstNum = zeros(1, clsCnt);
for i = 1 : clsCnt
    index = find(tstLab == i);
    tstNum(i) = length(index);
end

k = 5; % the parameter of KNN
preLab = KNN(trnData, trnLab, tstData, tstLab, k);
acc = accuracy(tstLab, preLab, clsCnt, tstNum)






