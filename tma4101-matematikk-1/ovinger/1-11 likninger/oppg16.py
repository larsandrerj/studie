import numpy as np
import matplotlib.pyplot as plt

def p(x):
    return x**4 - 10 * x**3 + 35 * x**2 - 50 * x + 24

def p_dot(x):
    return 4 * x**3 - 30 * x**2 + 70 * x - 50

def q(x):
    return x**4 - 9 * x**3 + 27 * x**2 - 31 * x + 12

def q_dot(x):
    return 4 * x**3 - 27 * x**2 + 54 * x - 31

def main():

    N = 20
    x0 = 0

    x_p = np.zeros(N + 1)
    x_q = np.zeros(N + 1)

    x_p[0] = x0
    x_q[0] = x0

    for n in range(N):
        x_p[n + 1] = x_p[n] - p(x_p[n]) / p_dot(x_p[n])
        x_q[n + 1] = x_q[n] - q(x_q[n]) / q_dot(x_q[n])
        
    print(x_p)   
    print(x_q)   

    plt.plot(x_p, "r-") 
    plt.plot(x_q)
    plt.grid()
    plt.show()

main()