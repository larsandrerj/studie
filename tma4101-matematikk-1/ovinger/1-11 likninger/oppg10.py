import numpy as np

def g(x):
    return (16 * x**3 ) / ((1 - 4*x) ** 2)

def main():

    N = 10
    k_c = 0.5

    for n in range(N):
        k_c = g(k_c)
        print(k_c)

main()