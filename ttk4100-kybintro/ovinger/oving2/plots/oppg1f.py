import numpy as np
import matplotlib.pyplot as plt

def v(t):
    return 5 * (1 - np.exp((-1 / 2) * t))


def oppg1f():
    t_start = 0
    t_stop = 15

    t_values = np.linspace(t_start, t_stop)
    v_values = np.zeros(len(t_values))

    for i in range(len(t_values)):
        v_values[i] = v(t_values[i])

    plt.plot(t_values, v_values)
    plt.grid()
    plt.show()


oppg1f()
