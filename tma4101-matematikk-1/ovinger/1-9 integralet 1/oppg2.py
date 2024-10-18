import numpy as np

def f(x):
    return (1 / np.sqrt(np.pi)) * np.exp( - (x**2) / 2)


def riemann():
    n = 1000
    a = 0
    b = 1

    dx = (b - a) / n

    I = 0

    for i in range(1, n + 1):
        I += f(a + dx * i) * dx

    return I

print(riemann())