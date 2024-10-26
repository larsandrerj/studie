import numpy as np
import matplotlib.pyplot as plt

def x_1_dot(x_2):
    return x_2

def x_2_dot(x_1, x_2, mu):
    return - mu * (x_1 ** 2 - 1) * x_2 - x_1

def euler_symplectic():
    mu = 2

    T = 20
    N = 2000
    h = T/N

    t = np.linspace(0, T, N + 1)
    x_1 = np.zeros(len(t))
    x_2 = np.zeros(len(t))

    x_1[0] = 1
    x_2[0] = 1

    for n in range(N):
        x_1[n + 1] = x_1[n] + h * x_1_dot(x_2[n])
        x_2[n + 1] = x_2[n] + h * x_2_dot(x_1[n + 1], x_2[n], mu)

    plt.plot(x_1, x_2)
    plt.grid()
    plt.show()

euler_symplectic()