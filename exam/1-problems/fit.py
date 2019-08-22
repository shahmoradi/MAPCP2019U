import math
from scipy.io import loadmat
import scipy.optimize as so
data = loadmat('cells.mat')
cells = data['cells']
times = [10,12,14,16,18,20,22]
cell_count = [0 for i in range(len(times))]

for day in range(len(times)):
    summ = 0
    for i in cells[:,:,:,day]:
        for j in i:
            for k in j:
                summ += k
                cell_count[day] = summ

print("cell_count: ", cell_count)

#global variables    
lambd = 10.0
c = 0.1

def predictedNumber(lambd,c,time):
    return 100000.0 * math.exp(lambd*(1-math.exp(-c*time)))

def leastSquares(param):
    SS = 0.0
    for i,time in enumerate(globals()['times']):
        lambd=param[0]
        c=param[1]
        x = predictedNumber(lambd,c,time)
        N = globals()['cell_count'][i]
        SS += (N - x)**2
    return SS

def getSq(X):
    ss = 0.0
    for x in X:
        ss += x**2
    return ss

BestFitParam = so.fmin  ( leastSquares
                        , x0 = []