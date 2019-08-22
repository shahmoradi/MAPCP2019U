function tumorCellCount = getTumorCellCount(time,lambda,coef)
    tumorCellCount = 100000 * exp( lambda * (1-exp(-coef*time)) );
end