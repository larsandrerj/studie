import numpy as np

def g(x):
    return np.sqrt(np.exp(- x**2))

def main():

    N = 100
    x = 1

    for n in range(N):
        x = g(x)
        print(x)

main()