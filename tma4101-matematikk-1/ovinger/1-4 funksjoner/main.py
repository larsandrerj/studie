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


def oppg9():
    x = np.linspace(0, 1, 6)
    exp_lambda_t = np.array([1.00, 1.105, 1.22, 1.35, 1.49, 1.65])
    log_exp_lambda_t = np.array(np.log(exp_lambda_t))

    plt.plot(x, log_exp_lambda_t)
    plt.grid()
    plt.show()

def oppg13_x(y):
    return y * np.sin(y)

def oppg13():
    y = np.linspace(0, 10, 100)
    x = np.zeros(len(y))

    for i in range(len(y)):
        x[i] = oppg13_x(y[i])

    plt.plot(x, y)
    plt.grid()
    plt.show()
