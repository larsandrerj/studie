import numpy as np


def f(x):
    return x - np.cos(x)
    #return x / np.cos(x)

def f_dot(x):
    return 1 + np.sin(x)
    #return (np.cos(x) + x * np.sin(x)) / (np.cos(x) ** 2)



def main():
    N = 10
    x_newton = np.zeros(N + 1)
    x_newton[0] = 1

    L = 0.739085133215161
    
    for n in range(N):
        x_newton[n + 1] = x_newton[n] - f(x_newton[n]) / f_dot(x_newton[n])


    print(x_newton)

main()
