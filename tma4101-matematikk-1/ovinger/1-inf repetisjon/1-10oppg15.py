import numpy as np
import matplotlib.pyplot as plt

def f(x_n, y_n):
    return x_n + y_n - np.log(abs(x_n)) - np.log(abs(y_n))

def x_dot(x_n, y_n):
    return x_n * (1 - y_n) 

def y_dot(x_n, y_n):
    return y_n * (-1 + x_n)

def euler_explicit(T, N):
    h = T / N

    t = np.linspace(0, T, N + 1)

    x = np.zeros(len(t))
    y = np.zeros(len(t))
    fxy = np.zeros(len(t))

    x[0] = 2
    y[0] = 2
    fxy[0] = f(x[0], y[0])

    for n in range(N):
        x[n + 1] = x[n] + h * x_dot(x[n], y[n])
        y[n + 1] = y[n] + h * y_dot(x[n], y[n])
        fxy[n] = f(x[n], y[n])

    plt.plot(t, x)
    plt.plot(t, y)
    plt.grid()
    plt.figure()

    plt.plot(t, fxy)
    plt.grid()
    plt.show()

euler_explicit(20, 1000)
