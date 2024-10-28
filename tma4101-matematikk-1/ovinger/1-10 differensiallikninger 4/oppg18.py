import numpy as np
import matplotlib.pyplot as plt

def x_dot(x):
    return x

def x_exact(t):
    return np.exp(t)

def x_heuns(x_n, h):
    X_pred = x_n + h * x_dot(x_n)
    return x_n + (h / 6) * (x_dot(x_n) * (x_dot(x_n) + 4 * x_dot((2*x_n + h * x_dot(x_n)) / 4) + x_dot(x_n + h * x_dot(x_n))))

def main():
    T = 5
    N = 100
    h = T/N
    
    t = np.linspace(0, T, N + 1)
    x_he = np.zeros(len(t))
    x_ex = np.zeros(len(t))

    x_he[0] = 1
    x_ex[0] = 1


    for n in range(N):
        x_ex[n + 1] = x_exact(t[n + 1])
        x_he[n + 1] = x_heuns(x_he[n], h)

    plt.plot(t, x_he)
    plt.grid()

    plt.figure()
    plt.plot(t, x_ex)
    plt.grid()
    plt.show()

main()
