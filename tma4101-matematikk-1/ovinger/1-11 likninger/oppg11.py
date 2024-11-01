import numpy as np

def g(x):
    return np.arctan((2 * np.sqrt(x * ( 1 - x))) / (2 * x - 1)) ** 2

def main():

    N = 100
    x = 0.5 + 0j

    for n in range(N):
        x = g(x)
        print(x)

main()