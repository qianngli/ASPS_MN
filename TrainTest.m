function [ trnData,trnLab,tstData,tstLab ] = TrainTest(data, lab, trnPer, clsCnt)

clsNum = zeros(1, clsCnt);          
trnNum = zeros(1, clsCnt);         
tstNum = zeros(1, clsCnt);          

 for i = 1 : clsCnt
   index = find(lab == i);             
   clsNum(i) = size(index, 1);                   
   trnNum(i) = ceil(clsNum(i) * trnPer);       
   tstNum(i) = clsNum(i) - trnNum(i);        
 end

trnData = [];                        
trnLab = [];                       
tstData = [];              
tstLab = [];                       

for i = 1 : clsCnt
   index = find(lab == i);                 
   random_index = index(randperm(length(index)));

   index = random_index(1: trnNum(i));            
   trnData = [trnData data(index, :)'];         
   trnLab = [trnLab ones(1, length(index)) * i];   

   index = random_index(trnNum(i) + 1:end);        
   tstData = [tstData data(index, :)'];         
   tstLab = [tstLab ones(1, length(index)) * i];    
end
