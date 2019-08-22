import scipy.io
import pandas as pd
import matplotlib.pyplot as plt
mat = scipy.io.loadmat('D:\\Git\\MAPCP2019U\\exam\\1\\data\\cells.mat')
#print(mat)

import numpy as np
cells=mat['cells']
#print(len(cells),len(cells[0]),len(cells[0][0]),len(cells[0][0][0]))

time=[10,12,14,16,18,20,22]
for j in range(len(cells[0][0][0])):
    fig = plt.figure(figsize=(10, 10))
    ax = fig.add_subplot(1,1,1)
    ax.set_xlabel('voxel number in x direction')
    ax.set_ylabel('voxel number in y direction')
    ax.set_title('Time = {} days. Brain MRI slices along Z-direction,Rat W09. No radiation treatment'.format(time[j]))
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)
    ax.spines['left'].set_visible(False)
    ax.spines['bottom'].set_visible(False)
    ax.set_xticks([])
    ax.set_yticks([])
    ax.yaxis.labelpad = 20
    cbaxes = fig.add_axes([1.0, 0.1, 0.03, 0.8])
    for i in range(len(cells[0][0])):
        fig.add_subplot(4, 4, i+1)
        im=plt.imshow((cells[:,:,i,j]), vmin=0, vmax=4.3*10**4,cmap='jet')
    cbar = plt.colorbar(im,cax = cbaxes)
    plt.show()