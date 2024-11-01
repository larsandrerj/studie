import numpy as np


def f(x):
    return x - np.cos(x)
    #return x / np.cos(x)

def f_dot(x):
    return 1 + np.sin(x)
    #return (np.cos(x) + x * np.sin(x)) / (np.cos(x) ** 2)


def main():
    N = 10
    x = np.zeros(N + 1)
    x[0] = 1

    L = 0.739085133215161
    
    for n in range(N):
        x[n + 1] = x[n] - f(x[n]) / f_dot(x[n])

    print(x)

main()
