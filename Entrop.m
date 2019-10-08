function H = Entrop(X)
    X = X';
    G = 256;
    [L, N] = size(X);
    H = zeros(L, 1);
    minX = min(X(:));
    maxX = max(X(:));
    edge = linspace(minX, maxX, G);
    for i = 1 : L
        histX = hist(X(i, :), edge) / N;
        H (i) = - histX * log(histX + eps)';
    end  
end
