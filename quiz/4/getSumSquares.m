function sumSquares = getSumSquares(Time,CellCount,lambda,coef)
    sumSquares = 0.;
    for i = 1: length(Time)
        sumSquares = sumSquares + ( CellCount(i) - getTumorCellCount(Time(i),lambda,coef) )^2;
    end
end