import numpy as np
import matplotlib.pyplot as plt

def v(t, v0, u, m, k):
    return (1 / k) * u + (v0 - (1 / k) * u) * np.exp((- k  / m) * t)

def main():
    u = 200
    m = 200
    k = 100
    v0 = 0

    t = np.linspace(15, 30  )
    v_values = np.zeros(len(t))

    for i in range(len(t)):
        v_values[i] = v(t[i], v0, u, m, k)
    plt.plot(t, v_values)

    u = 0
    v_values = np.zeros(len(t))

    for i in range(len(t)):
        v_values[i] = v(t[i], v0, u, m, k)
    plt.plot(t, v_values)

    plt.grid()
    plt.show()


main()
