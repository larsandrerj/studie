import numpy as np
import matplotlib.pyplot as plt

def plot_func(f, a, b, complex = False):
    x = np.linspace(a, b, 100)

    if not complex:
        x, y = calc_real_data(f, x)
    else:
        x, y = calc_complex_data(f, x)

    plt.plot(x, y)
    plt.grid()
    plt.show()

def calc_real_data(f, x):
    y = np.zeros(len(x))

    for i in range(len(x)):
        y[i] = f(x[i])

    return x, y

def calc_complex_data(f, x):
    re = np.zeros(len(x))
    im = np.zeros(len(x))

    for i in range(len(x)):
        re[i] = f(x[i]).real
        im[i] = f(x[i]).imag

    return re, im






def f(x):
    return x**2

def g(x):
    return np.exp(x)

def h(x):
    return x**3

def i(x):
    return np.emath.sqrt(x)


plot_func(f, -10, 10)
plot_func(g, -10, 10)
plot_func(h, -10, 10)
plot_func(i, -10, 10, True)
