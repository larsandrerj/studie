import numpy as np
import matplotlib.pyplot as plt

def v_c(t, r, c, u):
    return r * c * u * (1 - np.exp(- t / (r * c) ))

def main():
    r = 750
    c = 10 * 10**(-6)
    u = 7.5

    T = 10
    N = 1000

    t = np.linspace(0, T, N + 1)
    v = np.zeros(len(t))

    for n in range(N):
        v[n] = v_c(t[n], r, c, u)

    plt.plot(t, v)
    plt.grid()
    plt.show()

main()