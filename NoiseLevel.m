function weight  = NoiseLevel(imgSrc, W, H, L)

B = 10; % the size of block is B ¡Á B
regionSize_x = W / B; 
regionSize_y = H / B; 

% For the hyperspectral band image that cannot be completely partitioned, it is a common practice  
% to remove some columns or rows of the band image until all the blocks of the same size are segmented

blockNumber = regionSize_x * regionSize_y; 
M = floor(blockNumber * 0.1);  % choose 10% blocks
alpha = floor((M) * 0.33);

for i = 1 : L
    img = reshape(imgSrc(:, i), W, H);
    partition = zeros(1, blockNumber);
    partition(1, randperm(blockNumber, M)) = 1;
    Block = reshape(partition, regionSize_x, regionSize_y);
    
    count = 1;
    LM = []; % local mean
    LV = []; % local variance
    for u = 1 : regionSize_x
        for v = 1 : regionSize_y
            if(Block(u,v) == 1)
                S = img((B * (u - 1) + 1):(B * u),(B * (v - 1) + 1):(B * v));
                LM(u, v) = mean(mean(S));
                mse = (S(:) - LM(u, v)).^2;
                LV(count) = sqrt(sum(mse) / (B * B - 1));
                count = count + 1;
            end
        end
    end
    lv = LV(:);
    [x,y] = hist(lv, alpha);
    [p,q] = max(x);
    max_index = y(q);
    tmp = (y(2) - y(1)) / 2;
    weight(i) = sum(lv(find((lv < max_index + tmp) & (lv > max_index - tmp)))) / p;
end
end

