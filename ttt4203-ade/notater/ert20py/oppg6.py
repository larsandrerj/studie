import numpy as np
import matplotlib.pyplot as plt

def v_c(t):
    return 5 * (1 - np.exp(-t))

def main():
    T = 10
    N = 1000

    t = np.linspace(0, T, N + 1)
    v = np.zeros(len(t))

    for n in range(N):
        v[n] = v_c(t[n])

    plt.plot(t, v)
    plt.grid()
    plt.show()

main()