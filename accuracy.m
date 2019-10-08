function ave_acc = accuracy(tstLab, preLab, clsCnt, tstNum)
    ConMat = zeros(clsCnt, clsCnt);
    m = length(tstLab);
    for i = 1 : m
        ConMat(tstLab(i), preLab(i)) = ConMat(tstLab(i), preLab(i)) + 1;
    end   
    ave_acc = sum(diag(ConMat)) / sum(tstNum);
end

