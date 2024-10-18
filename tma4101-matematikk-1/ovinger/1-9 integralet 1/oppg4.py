import numpy as np

def normal(x):
    return (1 / np.sqrt(np.pi)) * np.exp( - (x**2) / 2)


def riemann(a, b, f):
    n = 1000

    dx = (b - a) / n

    I = 0

    for i in range(1, n + 1):
        I += f(a + dx * i) * dx

    return I

print(riemann(0, 1, normal))


