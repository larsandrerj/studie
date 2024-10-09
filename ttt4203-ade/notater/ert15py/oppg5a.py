import numpy as np
import matplotlib.pyplot as plt

def main():
    v_i = np.array([ 4500, 2970, 2574, 2475, 2277, 1089, 396, 99, 0, -99, -396, -1089, -2277, -2475, -2574, -2970, -4455])
    v_0 = np.array([ 5000, 5000, 5000, 4950, 4554, 2178, 792, 198, 0, -198, -792, -2178, -4554, -4950, -5000, -5000, -5000])

    plt.plot(v_i, v_0)
    plt.grid()
    plt.xlabel("v_i")
    plt.ylabel("v_0")
    plt.show()

main()

