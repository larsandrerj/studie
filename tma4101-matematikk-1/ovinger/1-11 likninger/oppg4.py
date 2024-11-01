import numpy as np
import numpy.random as rnd

def g1(x):
    return 1 / np.log(np.abs(x))

def g2(x):
    return np.exp(1 / x)

def main():
    N = 1000
    x1 = np.zeros(N + 1)
    x2 = np.zeros(N + 1)

    randnum = rnd.random()

    x1[0] = 0.1
    x2[0] = randnum

    epsi = 10**(-16)

    conv_int1 = N
    conv_int2 = N

    for n in range(N):
        print(x1[n])
        x1[n + 1] = g1(x1[n])   
        x2[n + 1] = g2(x2[n])


    for n in range(N):
        if x1[n] < x1[N] + epsi and x1[n] > x1[N] - epsi:
            conv_int1 = n if n < conv_int1 else conv_int1
        if x2[n] < x2[N] + epsi and x2[n] > x2[N] - epsi:
            conv_int2 = n if n < conv_int2 else conv_int2

    print(conv_int1)



main()
    