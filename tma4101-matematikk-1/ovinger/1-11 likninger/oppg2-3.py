import numpy as np
import numpy.random as random
import matplotlib.pyplot as plt

def main():
    N = 1000
    theta = np.zeros(N + 1)
    theta[0] = random.randint(-10, 10)
    L = 0.739085133215161

    conv_int = 0

    for n in range(N):
        theta[n + 1] = np.cos(theta[n])
        if theta[n + 1] > L:
            conv_int = n



    print(theta)
    print(conv_int)
    
    if conv_int == N:
        print("Not enough iterations")


    print(theta[conv_int])
main()
