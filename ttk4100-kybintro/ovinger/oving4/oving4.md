# Kybintro øving 4 - Lars André Roda Jansen

Oppgave 1)

a)
![[oppg1a_utregning.png]]

Modell: 
$$
\frac{d}{dt}h = - \frac{k}{\rho A}h + \frac{1}{\rho A}w_{inn}
$$

Vi må anta att massen fra w_inn jevnes ut med engang med en gang den legges til i tanken.
Pådragsorganet vil være røret der $w_{inn}$ kommer fra.
Pådraget vil være $w_{inn}$ .

b) 
![[oppg1b_utregning.png]]

c)
Om $w_{inn} = 0$, så vil $t \to \infty$, $h \to 0$. Dette er fordi all massen i tanken vil bare renne ut og bli tom om ingenting annet renner inn. 
Dette kan vi se på vår modell. Ettersom $w_{inn} = 0$, så vil ifølge modellen
$$
\frac{d}{dt}h = - \frac{k}{\rho A}h
$$
Dette fører til att endringen $\dot{h}$ vil være negativ helt til $h = 0$, altså att nivået tilsvarer 0.
Modellen vil bli stabil fordi den går mot en bestemt tilstand $h = 0$.

d)
Om vi hadde hatt en positiv tilbakekobling i systemet så hadde dette innebært att $\frac{d}{dt}h$  hadde vært positiv, slik att tanken blir bare fylt opp med væske, i stedet for att væske renner ut.

Modellen hadde derfor vært ustabil fordi den aldri når en stasjonærverdi, men vil heller forevig øke.

Oppgave 2)
a)
![[oppg2a.PNG]]

b)
![[oppg2b_1.png]]![[oppg2b_2.png]]

c)
![[oppg2c.PNG]]
Den er lik og tilsvarer $0.05$

d)
Man kan unngå problemer med standardavvik med å legge til ett I-ledd i regulatoren.

e)
![[oppg2e.PNG]]
Stasjonæravviket vårt nå blir på ca $-0.95$

f)
$$
u = K_p (r - x) + K_i \int{r - x} \,dt
$$
g)
![[oppg2g_script.PNG]]
![[oppg2g_simulink.PNG]]

h)
![[oppg2h_ki_1.PNG]]
![[oppg2h_ki_10.PNG]]
![[oppg2h_ki_100.PNG]]
![[oppg2h_ki_1000.PNG]]

Vi kan se att ved høyere $K_i$, så vil antall svingninger til systemet før den når stasjonærverdi øke

i)
![[oppg2i.PNG]]

j)
![[oppg2j_tau0.PNG]]
![[oppg2j_tau3.PNG]]
![[oppg2j_tau6.PNG]]
![[oppg2j_tau9.PNG]]

Vi kan se att den slutter å bli stabil når $\tau = 9$, for alle verdier før det så er systemet stabilt. 