function normLogLike = getNormLogLike(RandVec)
    normLogLike = 0.0;
    for i = 1:length(RandVec)
        normLogLike = normLogLike + log10(normpdf(RandVec(i),0,1));
    end
end