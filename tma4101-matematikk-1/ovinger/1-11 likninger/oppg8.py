import numpy as np
import matplotlib.pyplot as plt

def f(theta):
    return 2 * np.sin(2 * theta) + np.pi + 4 * theta

def f_dot(theta):
    return 4 * np.cos(2 * theta) - 4

def g(theta):
    return ( 1 / 2 ) * np.sin(2 * theta) + (1 / 4) * np.pi

def main():
    N = 10

    theta_newton = np.zeros(N + 1)
    theta_fp = np.zeros(N + 1)

    theta_newton[0] = 0.5
    theta_fp[0] = 0.5

    for n in range(N):
        theta_newton[n + 1] = theta_newton[n] - f(theta_newton[n]) / f_dot(theta_newton[n])
        theta_fp[n + 1] = g(theta_fp[n])

        print(np.cos(theta_newton[n + 1]))
        print(np.cos(theta_fp[n + 1]))


    plt.plot(np.cos(theta_newton))
    plt.plot(np.cos(theta_fp))
    plt.grid()
    plt.show()

main()

    