import numpy as np
import matplotlib.pyplot as plt

#x_dot
def f(x):
    return -x

#eulers metode
def euler(x_n, h):
    return f(x_n) * h + x_n

#kjøring av eulers metode
def approx(x0, steps, h):
    x = np.zeros(steps)
    x[0] = x0
    for i in range(1, steps):
        x[i] = euler(x[i - 1], h)

    return x

def main():
    h = 0.001
    stop = 10
    steps = int(stop / h)
    x0 = 10

    x = approx(x0, steps, h)

    t = np.linspace(0, stop, steps)

    plt.plot(t, x)
    plt.grid()
    plt.show()

main()
