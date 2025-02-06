import numpy as np
import matplotlib.pyplot as plt

import pandas as pd


file1 = "3_5d_pos.CSV"
file2 = "3_5d_neg.CSV"

#leser csv-f
data1 = pd.read_csv(file1)
data2 = pd.read_csv(file2)

# Hent ut måleserie og tid, konverter til numpy
time = data1.iloc[:,0].to_numpy()
signal1 = data1.iloc[:,1].to_numpy()
signal2 = data2.iloc[:,1].to_numpy()

plt.plot(time, signal1, 'red')
plt.plot(time, signal2, 'green')
plt.grid()
plt.show()