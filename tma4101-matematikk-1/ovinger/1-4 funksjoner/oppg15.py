import numpy as np
import matplotlib.pyplot as plt

def f(x):
    return np.exp(x)

def f_inv(y):
    return np.log(y)

def main():
    # y_1 = f(x_1)
    # x_2 = f_inv(y_2)

    x_1 = np.linspace(0, 10 , 11)
    y_2 = np.linspace(0, 10 , 11)

    y_1 = np.zeros(len(x_1))
    x_2 = np.zeros(len(y_2))


    for i in range(len(x_1)):
        y_1[i] = f(x_1[i])

    for i in range(len(y_2)):
        x_2[i] = f_inv(y_2[i])

    plt.plot(x_1, y_1, "r")
    plt.plot(y_2, x_2, "b")
    plt.grid()
    plt.show()


main()



