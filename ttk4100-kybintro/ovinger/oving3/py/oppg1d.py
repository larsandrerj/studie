import numpy as np
import matplotlib.pyplot as plt

def f(v, u, m, k):
    return (1 / m) * u - (k / m) * v


def main():
    u = 500
    m = 200
    k = 100

    h = 0.1 #Tidsskritt
    t_start = 0.0 #Tidsintervall
    t_slutt = 15.0

    steps = int((t_slutt - t_start) / h)
    t = np.linspace(t_start, t_slutt, steps)

    print(t)

    v = np.zeros(steps)

    v[0] = 0

    for i in range(1, steps):
        v[i] = v[i - 1] + h * f(v[i - 1], u, m, k)

    print(v)

    plt.plot(t, v)
    plt.xlabel("t")
    plt.ylabel("v(t)")
    plt.grid()
    plt.show()


main()


    