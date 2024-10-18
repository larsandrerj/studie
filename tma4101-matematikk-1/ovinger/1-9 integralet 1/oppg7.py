import numpy as np


def trapes_riemann(f, a , b, n):
    h = (b - a) / n

    I_v = 0
    I_h = 0
    for i in range(1, n + 1):
        #I += f(a + h * (i - (1 / 2))) * h
        I_v += f(a + h * i) * h
        I_h += f(a + h * (i + 1)) * h


    return (I_v + I_h) / 2

def f1(x):
    return (1 / np.sqrt(2 * np.pi)) * np.exp(- (x**2) / 2 )




def main():
    for i in range(6):

        n = 10**i
        print(trapes_riemann(f1, 0, 1, n))

    
main()