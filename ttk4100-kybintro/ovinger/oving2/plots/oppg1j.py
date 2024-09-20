import numpy as np
import matplotlib.pyplot as plt

def v(t, v0, u, m, k):
    return (1 / k) * u + (v0 - (1 / k) * u) * np.exp(-(k / m) * t)

def oppg1j():
    m = 200
    k = 100

    t_start = 0
    t_stop = 30

    t_values = np.linspace(t_start, t_stop, 31)
    v_values = np.zeros(len(t_values))

    u = 200
    v0 = 0
    for i in range(0, 15):
        v_values[i] = v(t_values[i], v0, u, m, k)

    u = 0
    v0 = v_values[14]
    for i in range(15, 30):
        v_values[i] = v(t_values[i], v0, u, m, k)

    plt.plot(t_values, v_values)

    plt.grid()
    plt.show()

oppg1j()