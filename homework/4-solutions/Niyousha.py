import numpy as np
def getCellCount(time,lamda,coef):
    from numpy import exp
    return 100000.0 * exp( lamda * ( 1.0 - exp( -coef * time ) ) ) 

GetCellCount = np.vectorize(getCellCount)

def getSumSquaredDiff(ParamVec):
    import numpy as np
    TimeVec = np.double([ 0.0, 10.0, 12.0, 14.0, 16.0, 18.0, 20.0, 22.0 ])
    CellVec = np.double([ 10000.0, 20000.0, 30000.0, 40000.0, 50000.0, 60000.0, 70000.0, 80000.0])
    ExpectedCellCount = GetCellCount( TimeVec, ParamVec[0], ParamVec[1] )
    return np.sum( ExpectedCellCount - CellVec ) ** 2

from scipy.optimize import fmin
BestParam = fmin( getSumSquaredDiff, x0 = np.double([1,0]) )