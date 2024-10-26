import numpy as np
import matplotlib.pyplot as plt


def x_dot(x, y):
    return x - x * y

def y_dot(x, y):
    return -y + x * y

def euler_explicit():
    T = 20
    N = 2000
    h = T/N

    t = np.linspace(0, T, N + 1)
    x = np.zeros(len(t))
    y = np.zeros(len(t))

    x[0] = 2
    y[0] = 2

    for n in range(N):
        x[n + 1]  = x[n] + h * x_dot(x[n], y[n])
        y[n + 1]  = y[n] + h * y_dot(x[n], y[n])

    plt.plot(x, y)
    plt.grid()
    plt.figure()

    plt.plot(t, x)
    plt.plot(t, y)
    plt.grid()
    plt.figure()

def euler_symplectic():
    T = 20
    N = 2000
    h = T/N

    t = np.linspace(0, T, N + 1)
    x = np.zeros(len(t))
    y = np.zeros(len(t))

    x[0] = 2
    y[0] = 2

    for n in range(N):
        x[n + 1]  = x[n] + h * x_dot(x[n], y[n])
        y[n + 1]  = y[n] + h * y_dot(x[n + 1], y[n])

    plt.plot(x, y)
    plt.grid()
    plt.figure()

    plt.plot(t, x)
    plt.plot(t, y)
    plt.grid()

euler_explicit()
euler_symplectic()
plt.show()