import numpy as np
import matplotlib.pyplot as plt


def main():
    v_p = np.array([ 1485, 1287, 1089, 990, 792, 396, 198, 99, 0, -99, -198, -396, -792, -990, -1089, -1287, -1485])
    v_0 = np.array([ 4339, 3861, 3267, 2970, 2376, 1188, 594, 297, 0, -297, -594, -1188, -2375, -2970, -3267, -3736, -3749])



    plt.plot(v_p, v_0)
    plt.grid()
    plt.xlabel("v_p")
    plt.ylabel("v_0")
    plt.show()

main()
