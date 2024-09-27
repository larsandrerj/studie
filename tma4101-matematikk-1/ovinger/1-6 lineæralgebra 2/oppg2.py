import numpy as np
import matplotlib.pyplot as plt

A = np.matrix([[2, 1, 1, 2],
              [1, 0, 1, 1],
              [1, -2, 1, -1],
              [0, 1, 0, 1]])

print(A)
print(np.linalg.det(A))



