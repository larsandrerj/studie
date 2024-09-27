import numpy as np


A = np.matrix([[3, -1, -1, 0],
               [1, -3, 0, 1],
               [-1, 0, 3, -1],
               [0, 1, 1, -3]])

v_v1 = np.array([1, 0, 0, 0])
v_v2 = np.array([0, 1, 0, 0])
v_v3 = np.array([0, 0, 1, 0])
v_v4 = np.array([0, 0, 0, 1])

print(np.linalg.solve(A, v_v1))
print(np.linalg.solve(A, v_v2))
print(np.linalg.solve(A, v_v3))
print(np.linalg.solve(A, v_v4))
print(np.linalg.solve(A, v_v1) + np.linalg.solve(A, v_v2) + np.linalg.solve(A, v_v3) + np.linalg.solve(A, v_v4))
