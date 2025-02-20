import numpy as np
import matplotlib.pyplot as plt
from scipy.fft import fft
from scipy.signal import find_peaks
import pandas as pd

# Load data from CSV files (assuming two columns: time and amplitude)
input_data = pd.read_csv("input_signal.csv", header=None, names=["time", "input_signal"])
output_data = pd.read_csv("output_signal.csv", header=None, names=["time", "output_signal"])

# Ensure time vectors match
if not np.array_equal(input_data["time"].values, output_data["time"].values):
    raise ValueError("Time vectors in the input and output files do not match!")

t = input_data["time"].values  # Time vector
fs = 1 / np.mean(np.diff(t))  # Estimate sampling frequency

# Extract signals
input_signal = input_data["input_signal"].values
output_signal = output_data["output_signal"].values

# Compute FFT
N = len(t)
freqs_fft = np.fft.fftfreq(N, d=1/fs)
input_fft = fft(input_signal)
output_fft = fft(output_signal)

# Find peaks corresponding to dominant frequencies
peaks, _ = find_peaks(np.abs(input_fft), height=10)

# Extract magnitude and phase at peak frequencies
bode_magnitude = []
bode_phase = []
frequencies = []

for peak in peaks:
    if freqs_fft[peak] > 0:  # Ignore negative frequencies
        mag = np.abs(output_fft[peak]) / np.abs(input_fft[peak])  # Gain
        phase = np.angle(output_fft[peak]) - np.angle(input_fft[peak])  # Phase shift
        frequencies.append(freqs_fft[peak])
        bode_magnitude.append(mag)
        bode_phase.append(phase)

# Plot Bode Magnitude
plt.figure(figsize=(10, 5))
plt.subplot(2, 1, 1)
plt.semilogx(frequencies, 20 * np.log10(bode_magnitude), 'o-')
plt.xlabel("Frequency (Hz)")
plt.ylabel("Magnitude (dB)")
plt.title("Bode Magnitude Plot")
plt.grid()

# Plot Bode Phase
plt.subplot(2, 1, 2)
plt.semilogx(frequencies, np.degrees(bode_phase), 'o-')
plt.xlabel("Frequency (Hz)")
plt.ylabel("Phase (degrees)")
plt.title("Bode Phase Plot")
plt.grid()

plt.tight_layout()
plt.show()
