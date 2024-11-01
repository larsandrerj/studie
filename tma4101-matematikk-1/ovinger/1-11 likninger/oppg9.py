import numpy as np
import matplotlib.pyplot as plt

def f(x):
    return x**3 + x**2 + x + 1

def f_dot(x):
    return 3*x**2 + 2*x + 1

def main():
    N = 10

    #x = np.zeros(N + 1)

    x = 0 + -1 * 1j


    for n in range(N):
        #x[n + 1] = x[n] + f(x[n]) / f_dot(x[n])
        x = x - f(x) / f_dot(x)


    #plt.plot(x)
    #plt.grid()
    #plt.show()
    print(x)

main()