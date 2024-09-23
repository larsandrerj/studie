import numpy as np
import matplotlib.pyplot as plt

def ohms_lov_i_mA(u, r):
    return (u / r) * 1000

def oppg6_7():
    t = np.linspace(0, 60, 7)

    v_c_1 = np.array([0, 7.68, 7.69, 7.70, 7.70, 7.70, 7.70])
    v_c_2 = np.array([7.70, 0.900, 0.310, 0.125, 0.056, 0.029, 0.019])

    i_1 = np.zeros(len(t))
    i_2 = np.zeros(len(t))

    for i in range(len(t)):
        i_1[i] = ohms_lov_i_mA(v_c_1[i], 100)
        i_2[i] = ohms_lov_i_mA(v_c_2[i], 100)

    print(i_1)
    print(i_2)
    print(t)

    plt.plot(t, i_1)
    plt.plot(t, i_2)
    plt.xlabel("t [s]")
    plt.ylabel("i [mA]")
    plt.grid()
    plt.show()

oppg6_7()


    