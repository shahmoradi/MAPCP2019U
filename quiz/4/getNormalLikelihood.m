function likelihood = getNormalLikelihood(RandVec)
    likelihood = 1.0;
    for i = 1:length(RandVec)
        likelihood = likelihood * normpdf(RandVec(i),0,1);
    end
end