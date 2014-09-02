reset
set terminal epslatex color colortext
set xlabel 'Durchmesser der Elektronenkreisbahn $d\,[\unit{cm}]$'
set ylabel 'Spezifische Elektronenladung $\nicefrac{e}{m_e}\,[\unitfrac{C}{kg}]$'
set output 'ergebnisse.tex'
lin1(x) = m*x+b
lin2(x) = m2*x+b2
fit lin1(x) 'Messwerte.txt' index 0 using ($3-2.7):5 via m,b
fit lin2(x) '' index 0 using ($3-2.7):6 via m2,b2
set key bottom right
plot 'Messwerte.txt' index 0 using ($3-2.7):5 title 'Konst. Magnetfeld' lt 1 lc 1, '' index 0 using ($3-2.7):6 title 'Elliptische Integrale' lt 1 lc 2, lin1(x) notitle lt 1 lc 1, lin2(x) notitle lt 1 lc 2, 1.7588*10**11 title 'Literaturwert' lt 1 lc 3
