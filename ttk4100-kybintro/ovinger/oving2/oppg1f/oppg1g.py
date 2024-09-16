import numpy as np
import matplotlib.pyplot as plt

def v(t, v0, u, m, k):
    return (1 / k) * u + (v0 - (1 / k) * u) * np.exp((- k  / m) * t)

def main():
    u = 500
    m = 200
    k = 100
    v0 = 15

    t = np.linspace(0, 15, 16)
    v_values = np.zeros(len(t))

    for i in range(len(t)):
        v_values[i] = v(t[i], v0, u, m, k)

    plt.plot(t, v_values)

    v_values = np.zeros(len(t))

    v0 = -5

    for i in range(len(t)):
        v_values[i] = v(t[i], v0, u, m, k)

    plt.plot(t, v_values)
    
    plt.grid()
    plt.show()


main()
