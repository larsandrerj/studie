import numpy as np

def g(x):
    return (1 / 3) * (x**3 + x**2) - 1

def main():

    N = 100
    x = -1.9

    for n in range(N):
        x = g(x)

    print(x)
main()