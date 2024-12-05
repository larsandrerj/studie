import numpy as np
import matplotlib.pyplot as plt

def p_dot(q):
    return q

def q_dot(p, g, l):
    return - (g / l) * np.sin(p)

def E_m(p, q, m, g, l):
    return (1 / 2) * m * (l * q) - m * g * l * np.cos(p)


def euler_explicit_symplectic(T, N, method=0):
    g = 9.81
    l = 1
    m = 1

    h = T/N

    t = np.linspace(0, T, N + 1)
    p = np.zeros(len(t))
    q = np.zeros(len(t))
    e = np.zeros(len(t))

    p[0] = 1
    q[0] = 0
    e[0] = E_m(p[0], q[0], m, g, l)

    if method == 0:
        for n in range(N):
            p[n + 1] = p[n] + h * p_dot(q[n])
            q[n + 1] = q[n] + h * q_dot(p[n], g, l)
            e[n + 1] = E_m(p[n + 1], q[n + 1], m, g, l)
    else:
        for n in range(N):
            p[n + 1] = p[n] + h * p_dot(q[n])
            q[n + 1] = q[n] + h * q_dot(p[n + 1], g, l)
            e[n + 1] = E_m(p[n + 1], q[n + 1], m, g, l)

    plt.figure()
    plt.plot(t, p)
    plt.plot(t, q)
    plt.grid()

    plt.figure()
    plt.plot(t, e)
    plt.grid()

def main():
    euler_explicit_symplectic(10, 10000, 0)
    euler_explicit_symplectic(10, 10000, 1)
    plt.show()

main()
