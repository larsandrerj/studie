import numpy as np
#Redigeringslogg:
#2023 - Emil Johnsen
#2025 - Torstein Nordgård-Hansen
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# Vi bruker denne for å få pyplot til å bruke latex til tegning av figurtekst på akser osv
# Det går og an å sette fontstørrelse her, men å sette figurstørrelsen vil i de fleste tilfeller ha samme effekt
# Hvis dere ikke ønkser å bruke latex til tegning av figurtekst på akser osv, må dere kommentere ut de følgende kodelinjene
# plt.rcParams.update({
#    "text.usetex": True,
#    "font.family": "sans-serif",
#    "font.sans-serif": ["Helvetica"]})

# Her kan dere legge inn flere filer om dere trenger det
# file1 = "csv-fil som inneholder data dere ønsker å plotte"
file1 = "csv-testfiler/CHAN1.csv"

#leser csv-fila
data1 = pd.read_csv(file1)

# Hent ut måleserie og tid, konverter til numpy
time = data1.iloc[:,0].to_numpy()
signal = data1.iloc[:,1].to_numpy()


# 1) Sett tidsaksen til å starte på 0
# 2) Pass på at tidsaksen er i millisekunder (datapunktene vi henter ut fra filene er i sekunder)
# ----- SKRIV DERES KODE HER -----
#plt.xlim(0, 1)
plt.ylim(-20, 20)

# --------------------------------

# Plot med pyplot, her kan dere bruke så mye avanserte funksjoner dere vil, med subplots osv
fig, a = plt.subplots(1, 1)

# 1) Fest plot av målt signal mot tid til a - Merk: det er ofte veldig mange datapunkter, så ofte bør man velge ut f.eks. hvert tiende
#    eller hvert hundrede punkt for å spare regnekraft.
# 2) Sett labels på aksene
# ----- SKRIV DERES KODE HER -----
plt.plot(time, signal)
plt.xlabel("time :)")
plt.ylabel("not time :()")
plt.grid()

# --------------------------------

# Lagre data i et egnet format, her ligger eksempler for både tikz via pgf og pdf
# Dersom du bruker Tikz, må du bruke pakkene pgfplots og tikz i latex-dokumentet ditt
# plt.savefig('filNavn.pgf', format='pgf')

# Med pdf lagres plottet som et bilde, som betyr at
# dere må justere størrelsen på figuren manuelt før dere lagrer for å sikre at fontstørrelsen blir lesbar:
# - Merk hvis dere ikke ønsker en figur i esp-format må dere kommentere ut de følgende linjene
fig.set_size_inches(4,3)
plt.tight_layout()
plt.savefig('figur.pdf')

# 1) Vis plottet til slutt for å sjekke om alt ser greit ut
# ----- SKRIV DERES KODE HER -----
plt.show()

# --------------------------------