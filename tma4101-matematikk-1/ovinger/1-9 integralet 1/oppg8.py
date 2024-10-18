import numpy as np

def trapes(f, a , b, n):
    h = (b - a) / n

    I_v = 0
    I_h = 0
    for i in range(1, n + 1):
        #I += f(a + h * (i - (1 / 2))) * h
        I_v += f(a + h * i) * h
        I_h += f(a + h * (i + 1)) * h


    return (I_v + I_h) / 2

def riemann(f, a, b, n):
    h = (b - a) / n

    I = 0

    for i in range(1, n + 1):
        I += f(a + h * i) * h

    return I

def sinc(x):
    if x == 0:
        return 1
    return np.sin(x) / x

def main():
    a = 0
    b = np.pi
    for i in range(5):
        n = 10**i

        tra = trapes(sinc, a, b, n)
        rie = riemann(sinc, a, b, n)

        print('trapes :' + str(tra))
        print('riemann :' + str(rie))
        print('diff: ' + str(tra - rie) + '\n') 



main()

