function  P  = ASPS(S, L, K)

P = floor(linspace(1, L, K)); 

for i =  1 : length(P)-2
    for j = P(i):P(i + 2) - 3
        a = [P(i), j+1];  
        sum1 = triu(S(a(1): a(2), a(1): a(2)));
        U1 = sum(sum(sum1)) / combntns(a(2) - a(1) + 1, 2); 
        
        b = [j + 2, P(i + 2)];
        sum2 = triu(S(b(1): b(2), b(1): b(2)));
        U2 = sum(sum(sum2)) / combntns(b(2) - b(1) + 1, 2);
        
        t = S(a(1): a(2), b(1): b(2));
        t(find(t == 0)) = inf;
        Dinter = max(max(t));  
        bandIndex(j+1) = (U1 + U2)/Dinter; 
    end    
        bandIndex(find(bandIndex == 0)) = inf;
        [~,zy] = min(bandIndex);
        P(i + 1) = zy;
        bandIndex = [];
        a = [];
        b = [];
end

end

