import numpy as np
import matplotlib.pyplot as plt

def x(t):
    return np.exp(-t) * ( np.cos( np.sqrt(2) * t) + ( np.sqrt(2) / 2 ) * np.sin( np.sqrt(2) * t ) )

def plot_x():
    t = np.linspace(0, 10)
    x_values = np.zeros(len(t))

    for i in range(len(t)):
        x_values[i] = x(t[i])

    plt.plot(t, x_values)
    plt.grid()
    plt.show()

plot_x()
