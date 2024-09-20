import numpy as np
import matplotlib.pyplot as plt

def v(t, v0, u, m, k):
    return (1 / k) * u + (v0 - (1 / k) * u) * np.exp(-(k / m) * t)

def oppg1g():
    u = 500
    m = 200
    k = 100

    t_start = 0
    t_stop = 15

    t_values = np.linspace(t_start, t_stop)
    v1_values = np.zeros(len(t_values))
    v2_values = np.zeros(len(t_values))

    for i in range(len(t_values)):
        v1_values[i] = v(t_values[i], 15, u, m, k)
        v2_values[i] = v(t_values[i], -5, u, m, k)

    plt.plot(t_values, v1_values)

    plt.plot(t_values, v2_values)

    plt.grid()
    plt.show()

oppg1g()






