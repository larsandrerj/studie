import numpy as np

A = np.matrix([[1, 2, 2],
               [2, 6, 2],
               [2, 2, 6]])

print(np.linalg.eig(A))