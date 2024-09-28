import numpy as np
import matplotlib.pyplot as plt

def f(v, u, m, k):
    return (1 / m) * u - (k / m) * v

def v_t(v0, u, k, m, t):
    return np.exp(- (k / m) * t) * (v0 - (u / k)) + (u / k)

def main():
    v0 = 0
    u = 500
    m = 200
    k = 100

    h = 0.1 #Tidsskritt
    t_start = 0.0 #Tidsintervall
    t_slutt = 15.0

    steps = int((t_slutt - t_start) / h)
    t = np.linspace(t_start, t_slutt, steps)

    print(t)

    v_euler = np.zeros(steps)
    v_analytical = np.zeros(steps)

    v_euler[0] = v0

    for i in range(1, steps):
        v_euler[i] = v_euler[i - 1] + h * f(v_euler[i - 1], u, m, k)

    for i in range(0, steps):
        v_analytical[i] = v_t(v0, u, k, m, t[i])

    plt.plot(t, v_euler, "r")
    plt.plot(t, v_analytical, "g")
    plt.xlabel("t")
    plt.ylabel("v(t)")
    plt.grid()
    plt.show()

main()