import numpy as np
import matplotlib.pyplot as plt

def main():
    v_i = np.array([685, 592, 535, 512, 372, 80, -118, -514])
    v_0 = np.array([600, 1795, 4800, 7357, 9297, 9301, 9300, 9300])

    plt.plot(v_i, v_0)
    plt.grid()
    plt.xlabel("v_i")
    plt.ylabel("v_0")
    plt.show()

main()
