import numpy as np

def midt_riemann(f, a , b, n):
    h = (b - a) / n

    I = 0
    for i in range(1, n + 1):
        I += f(a + h * (i - (1 / 2))) * h

    return I

def f1(x):
    return (1 / np.sqrt(2 * np.pi)) * np.exp(- (x**2) / 2 )

def main():
    for i in range(6):

        n = 10**i
        print(midt_riemann(f1, 0, 1, n))

    
main()