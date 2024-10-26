import numpy as np
import matplotlib.pyplot as plt

def p_dot(q):
    return q

def q_dot(p, g, l):
    return - (g / l) * np.sin(p)

def euler_explicit():
    g = 9.81
    l = 1   

    T = 20
    N = 2000
    h = T/N

    t = np.linspace(0, T, N + 1)
    p = np.zeros(len(t))
    q = np.zeros(len(t))

    p[0] = 2
    q[0] = 2

    for n in range(N):
        p[n + 1] = p[n] + h * p_dot(q[n])
        q[n + 1] = q[n] + h * q_dot(p[n], g, l)

    plt.figure()
    plt.plot(p, q)
    plt.grid()

def euler_symplectic():
    g = 9.81
    l = 1   

    T = 20
    N = 2000
    h = T/N

    t = np.linspace(0, T, N + 1)
    p = np.zeros(len(t))
    q = np.zeros(len(t))

    p[0] = 2
    q[0] = 2

    for n in range(N):
        p[n + 1] = p[n] + h * p_dot(q[n])
        q[n + 1] = q[n] + h * q_dot(p[n + 1], g, l)

    plt.figure()
    plt.plot(p, q)
    plt.grid()



euler_explicit()
euler_symplectic()
plt.show()